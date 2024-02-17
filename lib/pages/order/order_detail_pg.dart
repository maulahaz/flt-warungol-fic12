import 'package:flt_warungol_fic12/helpers/x_helpers.dart';
import 'package:flt_warungol_fic12/widgets/x_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../configs/x_configs.dart';
import '../../controllers/x_controllers.dart';
import 'x_orders.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  String initSelectedCourier = 'jne';
  String selectedCourier = '';

  @override
  void initState() {
    // context.watch<CourierCubit>().state;
    context.read<CourierCubit>().onSelectedCourier('-');
    context.read<CourierServiceCubit>().onSelectedCourierService('-');
    // context.read<ShippingCostBloc>().add(GetShippingCosts(
    //       origin: '5779',
    //       destination: '2103',
    //       courier: initSelectedCourier,
    //     ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final selectedCourier = 'jne';
    // final selectedCourier = context.watch<CourierCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Orders'),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed(
                'cart',
              );
            },
            icon: SvgPicture.asset(
              'lib/assets/icons/cart.svg',
              height: 24,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is AddItemLoadedState) {
                print('currentState.addressId');
                print(state.addressId);
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.dataOutput.length,
                  itemBuilder: (context, index) =>
                      CartTile(data: state.dataOutput[index]
                          // data: CartModel(
                          //   product: dataCarts[index],
                          //   quantity: 1,
                          // ),
                          ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16.0),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          const SizedBox(height: 36.0),
          //--Select Courier:
          const SelectCourier(),
          const SizedBox(height: 12.0),
          //--Select Shipping Type from Courier:
          const SelectShipping(),
          // const SizedBox(height: 12.0),
          //--Shipping Selected:
          // const ShippingSelected(),
          //--
          const SizedBox(height: 36.0),
          const Divider(),
          const SizedBox(height: 8.0),
          const Text(
            'Shopping Detail :',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12.0),
          Row(
            children: [
              const Text(
                'Total Price (Items)',
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
              Text(
                // 'Shipping cost \n(By. ${selectedCourier.toTitleCase()})',
                'Shipping cost',
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
                'Grand Total',
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
              final selectedShipment =
                  (state is AddItemLoadedState) ? state.shippingService : '';
              final courierService = context.watch<CourierServiceCubit>().state;
              if (selectedShipment != '' && courierService != '-') {
                return MyButtons.primary(context, 'Go to payment', () {
                  // print('Shoipment $selectedShipment Service $courierService');
                  context.goNamed('payment');
                });
              } else {
                return MyButtons.disabled(context, 'Go to payment');
              }
            },
          ),
          const SizedBox(height: 20.0),
          MyButtons.primaryOutlined(context, 'Shop Again', () {
            context.goNamed('root');
          })
        ],
      ),
    );
  }
}
