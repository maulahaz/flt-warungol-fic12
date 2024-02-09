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
  @override
  Widget build(BuildContext context) {
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
          const SelectShipping(),
          // const _ShippingSelected(),
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
              Text(
                1520000.currencyFormatRp,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          Row(
            children: [
              const Text(
                'Shipping cost',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                25000.currencyFormatRp,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
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
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                1545000.currencyFormatRp,
                style: const TextStyle(
                  color: kAppSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          MyButtons.primary(context, 'Go to payment', () {
            context.goNamed('paymentDetail');
          })
        ],
      ),
    );
  }
}
