import 'package:flt_warungol_fic12/controllers/x_controllers.dart';
import 'package:flt_warungol_fic12/helpers/x_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../configs/x_configs.dart';
import '../../../datasources/local/x_locals.dart';

class SelectCourier extends StatelessWidget {
  const SelectCourier();

  @override
  Widget build(BuildContext context) {
    void onSelectCourierTap() {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    child: ColoredBox(
                      color: kAppInversePrimary,
                      child: SizedBox(height: 8.0, width: 55.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Couriers:',
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
                const SizedBox(height: 18.0),
                const Divider(color: kAppInversePrimary),
                //--Get List Courier:
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const Divider(color: kAppInversePrimary),
                    itemCount: couriers.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: () {
                          //--Update selectedCourier:
                          context
                              .read<CourierCubit>()
                              .onSelectedCourier(couriers[index]);
                          //--Update ShippingCost based on selectedCourier:
                          context.read<ShippingCostBloc>().add(GetShippingCosts(
                                origin: '5779',
                                destination: '2103',
                                courier: couriers[index],
                              ));
                          //--Refresh Ship cost:
                          context
                              .read<CartBloc>()
                              .add(AddShippingService(couriers[index], 0));
                          //--Refresh Courier Service:
                          context
                              .read<CourierServiceCubit>()
                              .onSelectedCourierService('-');
                          //--Close this:
                          context.navPop();
                        },
                        title: Text('${couriers[index]}'),
                        // subtitle:
                        //     Text('Estimation ${item.cost![0].etd} day(s)'),
                      );
                    }),
              ],
            ),
          );
        },
      );
    }

    return GestureDetector(
      onTap: onSelectCourierTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
        decoration: BoxDecoration(
          border: Border.all(color: kAppInversePrimary),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Courier option',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '${context.watch<CourierCubit>().state.toTitleCase()}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
