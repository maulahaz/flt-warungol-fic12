// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flt_warungol_fic12/helpers/x_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flt_warungol_fic12/datasources/local/bank_dt.dart';

import '../../configs/x_configs.dart';
import '../../controllers/x_controllers.dart';
import '../../widgets/x_widgets.dart';
import 'x_payments.dart';

class PaymentWaitingPage extends StatefulWidget {
  final int orderId;
  const PaymentWaitingPage({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  @override
  State<PaymentWaitingPage> createState() => _PaymentWaitingPageState();
}

class _PaymentWaitingPageState extends State<PaymentWaitingPage> {
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      context
          .read<OrderStatusBloc>()
          .add(GetOrderStatus(orderId: widget.orderId));
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void onPaymentCompleted() {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: kWhite,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                child: ColoredBox(
                  color: kAppInversePrimary,
                  child: SizedBox(height: 8.0, width: 55.0),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: const Text(
                      'Payment completed.',
                      maxLines: 2,
                      style: TextStyle(
                        color: kAppInversePrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: kAppSecondary2,
                    child: IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(
                        Icons.close,
                        color: kAppInversePrimary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Image.asset('lib/assets/images/process-order.png'),
              ),
              const SizedBox(height: 50.0),
              Row(
                children: [
                  Flexible(
                    child:
                        MyButtons.secondaryOutlined(context, 'Track Order', () {
                      context.goNamed('trackingOrder');
                    }),
                  ),
                  const SizedBox(width: 16.0),
                  Flexible(
                    child: MyButtons.secondaryOutlined(context, 'Back to Home',
                        () {
                      context.goNamed('root');
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Waiting for payment'),
      ),
      body: BlocListener<OrderStatusBloc, OrderStatusState>(
        listener: (context, state) {
          if (state is GetOrderStatusLoadedState) {
            print('Status: ' + state.status);
            if (state.status == 'paid') {
              //--Show the success dialog:
              onPaymentCompleted();
              //--Stop the timer:
              _timer?.cancel();
              //--Empty out the Cart:
              context.read<CartBloc>().add(EmptyCart());
            }
          }
        },
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            Row(
              children: [
                const Icon(Icons.schedule),
                const SizedBox(width: 12.0),
                const Flexible(
                  child: Text(
                    'Complete payment within',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 12.0),
                CountdownTimer(
                  minute: 60,
                  onTimerCompletion: onPaymentCompleted, //onTimerCompletion,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            BlocBuilder<OrderBloc, OrderState>(
              builder: (context, state) {
                if (state is MakeOrderLoadedState) {
                  final orderModel = state.order.data!;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        banks
                            .where((element) =>
                                element.code == orderModel.paymentVaName)
                            .first
                            .name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                            banks
                                .where((element) =>
                                    element.code == orderModel.paymentVaName)
                                .first
                                .image,
                            height: 32),
                      ),
                    ],
                  );
                } else if (state is MakeOrderLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return const SizedBox();
                }
              },
            ),
            const SizedBox(height: 14.0),
            const Divider(),
            const SizedBox(height: 14.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'No Virtual Account',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    BlocBuilder<OrderBloc, OrderState>(
                      builder: (context, state) {
                        if (state is MakeOrderLoadedState) {
                          return Text(
                            state.order.data!.paymentVaNumber!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          );
                        } else if (state is MakeOrderLoadingState) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Center(child: Text('Something went wrong'));
                        }
                      },
                    ),
                  ],
                ),
                BlocBuilder<OrderBloc, OrderState>(
                  builder: (context, state) {
                    if (state is MakeOrderLoadedState) {
                      return MyButtons.primaryIconned(context, 'Copy',
                          SvgPicture.asset('lib/assets/icons/copy.svg'), () {
                        Clipboard.setData(ClipboardData(
                                text: state.order.data!.paymentVaNumber!))
                            .then((_) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Copied to clipboard'),
                            duration: Duration(seconds: 1),
                            backgroundColor: kAppInversePrimary,
                          ));
                        });
                      });
                    } else {
                      return MyButtons.primaryIconned(context, 'Copy',
                          SvgPicture.asset('lib/assets/icons/copy.svg'), () {
                        Clipboard.setData(ClipboardData(text: 'No Data'))
                            .then((_) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Copied to clipboard'),
                            duration: Duration(seconds: 1),
                            backgroundColor: kAppInversePrimary,
                          ));
                        });
                      });
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 14.0),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Total Payment',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              subtitle: BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  final totalPayment = (state is MakeOrderLoadedState)
                      ? state.order.data!.totalCost!
                      : 0;
                  return Text(
                    totalPayment.currencyFormatRp,
                    style: TextStyle(
                      color: kAppSecondary,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            MyButtons.primaryOutlined(context, 'Start New Shopping', () {
              //--Stop the timer:
              _timer?.cancel();
              //--Empty out the Cart:
              context.read<CartBloc>().add(EmptyCart());
              //--Back to Home:
              context.pushNamed('root');
            }),
            const SizedBox(height: 20.0),
            MyButtons.primary(context, 'Cek Payment Status', () {
              onPaymentCompleted();
              // context.pushNamed('trackingOrder');
            }),
          ],
        ),
      ),
    );
  }
}
