import 'package:flutter/material.dart';

import '../configs/x_configs.dart';
import '../helpers/x_helpers.dart';

class IconTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label, hintText;
  final bool isObscure;
  final IconData icon;
  const IconTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.label,
    required this.isObscure,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: getFont(16, color: kAppPrimary),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: 50,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: kBgPrimary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Row(
              children: [
                Icon(icon, size: 17, color: kAppSecondary),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextFormField(
                    obscureText: isObscure,
                    style: getFont(14, color: kAppPrimary),
                    controller: controller,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Your Email Address',
                      hintStyle: getFont(14, color: kAppSecondary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
