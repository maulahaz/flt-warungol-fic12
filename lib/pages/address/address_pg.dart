import 'package:flt_warungol_fic12/controllers/x_controllers.dart';
import 'package:flt_warungol_fic12/helpers/x_helpers.dart';
import 'package:flt_warungol_fic12/models/x_models.dart';
import 'package:flt_warungol_fic12/widgets/x_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../configs/x_configs.dart';
import 'x_addresses.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  void initState() {
    super.initState();
    context.read<AddressBloc>().add(GetAddress());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorSchema.background,
        title: const Text('Address'),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       context.goNamed(
        //         'cart',
        //       );
        //     },
        //     icon: SvgPicture.asset('lib/assets/icons/cart.svg', height: 24.0),
        //   ),
        // ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const Text(
            'Choose or add a new address',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20.0),
          BlocBuilder<AddressBloc, AddressState>(
            builder: (context, state) {
              if (state is GetAddressLoadedState) {
                List<Address> addresses = state.dataOutput;
                // int selectedIndex = 0;
                return BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    final addressId =
                        (state is AddItemLoadedState) ? state.addressId : 0;
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: addresses.length,
                      itemBuilder: (context, index) {
                        // int selectedIndex = addresses.indexWhere((element) => element.isDefault == index);
                        return AddressTile(
                          isSelected: addressId == addresses[index].id,
                          // isSelected: selectedIndex == index,
                          data: addresses[index],
                          onTap: () {
                            context
                                .read<CartBloc>()
                                .add(AddAddressId(addresses[index].id!));
                            // selectedIndex = index;
                            // print(selectedIndex.toString());
                            // setState(() {});
                          },
                          onEditTap: () {
                            context.goNamed(
                              'addressEdit',
                              extra: addresses[index],
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                    );
                  },
                );
              } else if (state is GetAddressLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is GetAddressInitialState) {
                return Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Center(child: Text('No Data')));
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          const SizedBox(height: 40.0),
          MyButtons.primary(context, 'Add new address', () {
            context.goNamed('addressAdd');
          }),
          const SizedBox(width: 50.0),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Subtotal (Approx.)',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
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
                        color: kAppSecondary,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                final selectedAddress =
                    (state is AddItemLoadedState) ? state.addressId : 0;
                if (selectedAddress == 0) {
                  return MyButtons.disabled(context, 'Continue');
                } else {
                  return MyButtons.primary(context, 'Continue', () {
                    context.goNamed('orderDetail');
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
