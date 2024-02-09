import 'package:flt_warungol_fic12/helpers/x_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../configs/x_configs.dart';
import '../../../models/x_models.dart';

class SelectShipping extends StatelessWidget {
  const SelectShipping();

  @override
  Widget build(BuildContext context) {
    final selectedPayment = ValueNotifier<int>(0);
    final shippings = [
      ShippingModel(
        type: 'Reguler',
        priceStart: 20000,
        priceEnd: 30000,
        estimate: DateTime.now().subtract(const Duration(days: 3)),
      ),
      ShippingModel(
        type: 'Cargo',
        priceStart: 20000,
        priceEnd: 30000,
        estimate: DateTime.now().subtract(const Duration(days: 3)),
      ),
      ShippingModel(
        type: 'Economy',
        priceStart: 20000,
        priceEnd: 30000,
        estimate: DateTime.now().subtract(const Duration(days: 4)),
      ),
    ];

    void onSelectShippingTap() {
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
                      'Shipping Method',
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
                Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1.50,
                        color: kAppInversePrimary,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: ListTile(
                    leading: SvgPicture.asset('lib/assets/icons/routing.svg'),
                    subtitle: const Text('Dikirim dari Kabupaten Banyuwangi'),
                    trailing: const Text(
                      'weight: 1kg',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: kAppInversePrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                const Text(
                  'Arrive Estimation 20 - 23 January (Rp. 20.000)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 30.0),
                const Divider(color: kAppInversePrimary),
                ValueListenableBuilder(
                  valueListenable: selectedPayment,
                  builder: (context, value, _) => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = shippings[index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: () {},
                        title: Text('${item.type} (${item.priceFormat})'),
                        subtitle:
                            Text('Arrive Estimation ${item.estimateFormat}'),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const Divider(color: kAppInversePrimary),
                    itemCount: shippings.length,
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return GestureDetector(
      onTap: onSelectShippingTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
        decoration: BoxDecoration(
          border: Border.all(color: kAppInversePrimary),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipment option',
              style: TextStyle(fontSize: 16),
            ),
            Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
