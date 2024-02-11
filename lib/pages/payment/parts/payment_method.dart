import 'package:flt_warungol_fic12/configs/x_configs.dart';
import 'package:flutter/material.dart';

import '../../../models/x_models.dart';

class PaymentMethod extends StatelessWidget {
  final bool isActive;
  final BankAccountModel data;
  final VoidCallback onTap;

  const PaymentMethod({
    super.key,
    required this.isActive,
    required this.data,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          // borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          // border: Border.all(color: kAppSecondary),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kBlack.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Image.asset(
              data.image,
              height: 30.0,
            ),
            const SizedBox(width: 8.0),
            Flexible(
              child: Text(
                data.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Spacer(),
            Icon(
              // isActive ? Icons.circle : Icons.circle_outlined,
              // color: isActive ? kAppSecondary : kGrey,
              isActive ? Icons.radio_button_checked : Icons.circle_outlined,
              color: isActive ? kAppInversePrimary : kGrey,
            ),
          ],
        ),
      ),
    );
  }
}
