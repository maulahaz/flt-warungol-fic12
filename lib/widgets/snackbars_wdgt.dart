import 'package:flutter/material.dart';

import '../helpers/x_helpers.dart';

class MySnackbar {
  static void showSnackbar(BuildContext context, String title, String subtitle,
      Color txColor, Color bgColor, Color iconColor) {
    //----------
    // final _globalKey = GlobalKey<ScaffoldMessengerState>(); <-- Backup
    // _globalKey.currentState..showSnackBar( <-- Backup
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Icon(
            Icons.notification_important,
            color: iconColor,
          ),
          SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: getFont(14, color: txColor)),
              Text(subtitle, style: getFont(12, color: txColor)),
            ],
          ),
        ],
      ),
      backgroundColor: bgColor,
      duration: Duration(seconds: 2),
    ));
  }

  static primary(context, String title, String subtitle) {
    showSnackbar(context, title, subtitle, Colors.white, Color(0xFF007BFF),
        Colors.white);
  }

  static secondary(context, String title, String subtitle) {
    showSnackbar(context, title, subtitle, Colors.white, Color(0xFF6C757D),
        Colors.white);
  }

  static success(context, String title, String subtitle) {
    showSnackbar(context, title, subtitle, Colors.white, Color(0xFF28A745),
        Colors.white);
  }

  static danger(context, String title, String subtitle) {
    showSnackbar(
        context, title, subtitle, Colors.white, Colors.red, Colors.white);
  }

  static warning(context, String title, String subtitle) {
    showSnackbar(
      context,
      title,
      subtitle,
      Colors.black,
      Color(0xFFFFC107),
      Colors.black,
    );
  }

  static info(context, String title, String subtitle) {
    showSnackbar(
      context,
      title,
      subtitle,
      Colors.white,
      Color(0xFF17A2B8),
      Colors.white,
    );
  }

  static light(context, String title, String subtitle) {
    showSnackbar(
      context,
      title,
      subtitle,
      Colors.black,
      Color(0xFFF8F9FA),
      Colors.black,
    );
  }

  static dark(context, String title, String subtitle) {
    showSnackbar(
      context,
      title,
      subtitle,
      Colors.white,
      Color(0xFF343A40),
      Colors.white,
    );
  }
}
