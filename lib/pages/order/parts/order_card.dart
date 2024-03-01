import 'package:flt_warungol_fic12/configs/x_configs.dart';
import 'package:flt_warungol_fic12/helpers/x_helpers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../models/x_models.dart';

class OrderCard extends StatelessWidget {
  final HistoryOrder data;
  const OrderCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed('trackingOrder',
            pathParameters: {'orderId': data.id.toString()});
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(color: kAppInversePrimary),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'RESI No.: ${data.shippingResi ?? '-'}',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 24.0),
            Row(children: [
              Text('Status'),
              Spacer(),
              Text(data.status ?? '-'),
            ]),
            const SizedBox(height: 12.0),
            // Row(children: [
            //   Text('Item'),
            //   const SizedBox(width: 8.0),
            //   Text(data. ?? '-'),
            // ]),
            Row(children: [
              Text('Total Price'),
              Spacer(),
              Text(data.totalCost!.currencyFormatRp),
            ]),
            const SizedBox(height: 12.0),
            InkWell(
              onTap: () {},
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Track Order',
                  style: TextStyle(
                    color: kAppSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
