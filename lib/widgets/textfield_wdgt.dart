import 'package:flutter/material.dart';
import '../configs/x_configs.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function(String value)? onChanged;
  final bool obscureText;
  final Widget? icon;

  const MyTextField({
    super.key,
    required this.controller,
    required this.label,
    this.onChanged,
    this.obscureText = false,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      obscureText: obscureText,
      cursorColor: kAppInversePrimary,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: kAppInversePrimary),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kAppSecondary2),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: icon,
        ),
      ),
    );
  }
}
