import 'package:flt_warungol_fic12/helpers/x_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../configs/x_configs.dart';
import '../../controllers/x_controllers.dart';
import '../../datasources/local/bank_dt.dart';
import '../../models/x_models.dart';
import '../../widgets/x_widgets.dart';
import 'x_payments.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedPayment = ValueNotifier<int>(0);

    void seeAllTap() {
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: kWhite,
        builder: (BuildContext context) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  child: ColoredBox(
                    color: kAppSecondary,
                    child: SizedBox(height: 8.0, width: 55.0),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Paymnent Method',
                      style: TextStyle(
                        color: kPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: kAppSecondary,
                      child: IconButton(
                        onPressed: () => null, //context.pop(),
                        icon: const Icon(
                          Icons.close,
                          color: kPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                ValueListenableBuilder(
                  valueListenable: selectedPayment,
                  builder: (context, value, _) => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => PaymentMethod(
                      isActive: value == banks[index].code,
                      data: banks[index],
                      onTap: () {
                        // selectedPayment.value = banks[index].code;
                        // if (banksLimit.first != banks[index]) {
                        //   banksLimit[1] = banks[index];
                        // }
                        // context.pop();
                      },
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 14.0),
                    itemCount: banks.length,
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    void buyNowTap() {
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: kWhite,
        builder: (BuildContext context) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
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
                    const Text(
                      'Order in progress',
                      style: TextStyle(
                        color: kAppInversePrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
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
                      child: MyButtons.secondary(context, 'Track Order', () {
                        context.goNamed('trackingOrder');
                      }),
                    ),
                    const SizedBox(width: 20.0),
                    Flexible(
                      child: MyButtons.secondary(context, 'Back to Home', () {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Row(
            children: [
              const Icon(Icons.schedule),
              const SizedBox(width: 12.0),
              const Flexible(
                child: Text(
                  'Finish the Payment',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 12.0),
              CountdownTimer(
                minute: 1440,
                onTimerCompletion: () {},
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Row(
            children: [
              const Text(
                'Payment Method',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: null, //seeAllTap,
                child: const Text(
                  'See All',
                  style: TextStyle(
                    color: kPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              final paymentVAName =
                  (state is AddItemLoadedState) ? state.paymentVAName : '';
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => PaymentMethod(
                    isActive: paymentVAName ==
                        banks[index].code, // banksLimit[index].code,
                    data: banks[index], //banksLimit[index],
                    onTap: () {
                      context.read<CartBloc>().add(AddPaymentMethod(
                            banks[index].method, //[index].method,
                            banks[index].code, //banksLimit[index].code,
                          ));
                      print(
                          // 'Name: ${banksLimit[index].code} - Method: ${banksLimit[index].method}');
                          'Name: ${banks[index].code} - Method: ${banks[index].method}');
                    }),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 14.0),
                // itemCount: banksLimit.length,
                itemCount: banks.length,
              );
            },
          ),
          const SizedBox(height: 36.0),
          const Divider(),
          const SizedBox(height: 8.0),
          const Text(
            'Payment Summary',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12.0),
          Row(
            children: [
              const Text(
                'Total Shopping',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  final total = (state is AddItemLoadedState)
                      ? state.dataOutput.fold<int>(
                          0,
                          (previousValue, element) =>
                              previousValue +
                              (element.qty * element.product.price!))
                      : 0;
                  return Text(
                    total.currencyFormatRp,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          Row(
            children: [
              const Text(
                'Shipping Cost',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  final shippingCost =
                      (state is AddItemLoadedState) ? state.shippingCost : 0;
                  return Text(
                    shippingCost.currencyFormatRp,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          const Divider(),
          const SizedBox(height: 24.0),
          Row(
            children: [
              const Text(
                'Bill Amount',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  final grandTotal = (state is AddItemLoadedState)
                      ? state.dataOutput.fold<int>(
                              0,
                              (previousValue, element) =>
                                  previousValue +
                                  (element.qty * element.product.price!)) +
                          state.shippingCost
                      : 0;
                  return Text(
                    grandTotal.currencyFormatRp,
                    style: const TextStyle(
                      color: kAppSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              final addressId =
                  (state is AddItemLoadedState) ? state.addressId : 0;
              final shippingService =
                  (state is AddItemLoadedState) ? state.shippingService : '';
              final paymentMethod =
                  (state is AddItemLoadedState) ? state.paymentMethod : '';
              final shippingCost =
                  (state is AddItemLoadedState) ? state.shippingCost : 0;
              final productQty =
                  (state is AddItemLoadedState) ? state.dataOutput : [];

              final selectedPayment =
                  (state is AddItemLoadedState) ? state.paymentVAName : '';
              if (selectedPayment == '') {
                return MyButtons.disabled(context, 'Pay Now');
              } else {
                return BlocListener<OrderBloc, OrderState>(
                  listener: (context, state) {
                    if (state is MakeOrderInitialState) {
                      MyButtons.isLoading(context, '...Loading');
                    } else if (state is MakeOrderErrorState) {
                      MySnackbar.danger(context, 'Error', state.error!);
                    } else if (state is MakeOrderLoadedState) {
                      context.pushNamed('paymentWaiting',
                          extra: state.order.data!.id);
                    }
                  },
                  child: MyButtons.primary(context, 'Pay Now', () {
                    // buyNowTap();
                    // selectedPayment.isEmpty
                    // print(addressId);
                    context.read<OrderBloc>().add(MakeOrder(
                          addressId: addressId,
                          paymentMethod: paymentMethod,
                          shippingService: shippingService,
                          shippingCost: shippingCost,
                          paymentVAName: selectedPayment,
                          productQty: productQty as List<ProductQuantityModel>,
                        ));
                  }),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
