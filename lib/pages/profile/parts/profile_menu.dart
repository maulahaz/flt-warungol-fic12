import 'package:flutter/material.dart';
import '../../../configs/x_configs.dart';

class ProfileMenu extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ProfileMenu({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: kAppInversePrimary,
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: kAppInversePrimary,
            ),
          ],
        ),
      ),
    );
  }
}
