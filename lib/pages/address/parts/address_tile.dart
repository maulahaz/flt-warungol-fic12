import 'package:flutter/material.dart';

import '../../../configs/x_configs.dart';
import '../../../models/x_models.dart';

class AddressTile extends StatelessWidget {
  final bool isSelected;
  // final AddressModel data;
  final Address data;
  final VoidCallback onTap;
  final VoidCallback onEditTap;

  const AddressTile({
    super.key,
    required this.data,
    this.isSelected = false,
    required this.onTap,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          gradient: kAppGradientPrim,
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: kBlack.withOpacity(0.1),
                    blurRadius: 2,
                    offset: const Offset(0, 2),
                    spreadRadius: 0,
                    blurStyle: BlurStyle.outer,
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '${data.name} - ${data.addressType}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 4.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      data.fullAddress,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14.0),
                  Icon(
                    isSelected
                        ? Icons.radio_button_checked
                        : Icons.circle_outlined,
                    color: isSelected ? kAppInversePrimary : kGrey,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            if (isSelected) ...[
              const Divider(color: kGrey),
              Center(
                child: TextButton(
                  onPressed: onEditTap,
                  child: const Text('Edit',
                      style: TextStyle(color: kAppInversePrimary)),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
