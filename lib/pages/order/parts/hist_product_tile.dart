import 'package:flt_warungol_fic12/helpers/x_helpers.dart';
import 'package:flutter/material.dart';

import '../../../configs/x_configs.dart';
import '../../../models/x_models.dart';

class HistProductTile extends StatelessWidget {
  final HistOrderItem data;
  const HistProductTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: kAppInversePrimary),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Image.asset(
              data.product.picture,
              width: 68.0,
              height: 68.0,
            ),
          ),
          const SizedBox(width: 14.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.product.name,
                style: const TextStyle(
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Text(
                    data.product.price.currencyFormatRp,
                    style: const TextStyle(
                      color: kAppInversePrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
