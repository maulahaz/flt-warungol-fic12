import 'package:flt_warungol_fic12/configs/x_configs.dart';
import 'package:flt_warungol_fic12/helpers/x_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;

import '../../controllers/x_controllers.dart';
import '../../datasources/local/auth_local_dt.dart';
import '../../widgets/x_widgets.dart';
import 'x_carts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorSchema.background,
        title: const Text('Cart'),
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is AddItemLoadedState) {
                final totalQty = state.dataOutput.fold<int>(
                    0, (previousValue, element) => previousValue + element.qty);

                return totalQty > 0
                    ? badges.Badge(
                        badgeStyle: badges.BadgeStyle(
                            badgeColor: kAppSecondary.withAlpha(150)),
                        badgeContent: Text(
                          totalQty.toString(),
                          style: TextStyle(color: kWhite),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'lib/assets/icons/cart.svg',
                            height: 24,
                          ),
                        ))
                    : SvgPicture.asset(
                        'lib/assets/icons/cart.svg',
                        height: 24,
                      );
              } else {
                return SvgPicture.asset(
                  'lib/assets/icons/cart.svg',
                  height: 24,
                );
              }
            },
          ),
          SizedBox(width: 14),
        ],
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is AddItemLoadedState) {
            if (state.dataOutput.isEmpty) {
              return Center(
                child: Column(
                  children: [
                    Text('Your cart is empty'),
                    SizedBox(height: 20),
                    MyButtons.warning(context, 'Add your cart',
                        () => context.pushNamed('root')),
                  ],
                ),
              );
            } else {
              return ListView(
                padding: const EdgeInsets.all(20.0),
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.dataOutput.length,
                    itemBuilder: (context, index) => CartTile(
                      data: state.dataOutput[index],
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16.0),
                  ),
                  const SizedBox(height: 50.0),
                  Row(
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          if (state is AddItemLoadedState) {
                            final total = state.dataOutput.fold<int>(
                                0,
                                (previousValue, element) =>
                                    previousValue +
                                    (element.qty * element.product.price!));
                            return Text(
                              total.currencyFormatRp,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          } else {
                            return Text(
                              0.currencyFormatRp,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  MyButtons.primary(
                      context, 'Checkout (${state.dataOutput.length} items)',
                      () async {
                    final isAuth = await AuthLocalData.isAuth();
                    if (isAuth) {
                      context.goNamed(
                        'orderDetail',
                      );
                    } else {
                      context.pushNamed(
                        'signin',
                      );
                    }
                  }),
                ],
              );
            }
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
