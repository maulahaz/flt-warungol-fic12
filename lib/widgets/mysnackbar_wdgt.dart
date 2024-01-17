import 'package:flutter/material.dart';

import '../configs/x_configs.dart';

class MySnackbarXX {
  static showSnackbar(BuildContext context, String title, String subtitle,
      Color txColor, Color bgColor, Color iconColor) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Stack(
        children: [
          Container(
              padding: EdgeInsets.all(16),
              height: 90,
              decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: TextStyle(fontSize: 18, color: kWhite)),
                        SizedBox(height: 12),
                        Text(
                          subtitle,
                          style: TextStyle(fontSize: 12, color: kWhite),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ],
              )),
          // Positioned(
          //   bottom: 0,
          //   child: SvgPicture.asset('assets/icons/blue-bubbles.svg', height: 48, width: 40,))
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: kTransparent,
      elevation: 0,
    ));
  }

  static primary(BuildContext context, String title, String subtitle) {
    showSnackbar(context, title, subtitle, Colors.white, Color(0xFF007BFF),
        Colors.white);
  }

  static secondary(BuildContext context, String title, String subtitle) {
    showSnackbar(context, title, subtitle, Colors.white, Color(0xFF6C757D),
        Colors.white);
  }

  static success(BuildContext context, String title, String subtitle) {
    showSnackbar(context, title, subtitle, Colors.white, Color(0xFF28A745),
        Colors.white);
  }

  static danger(BuildContext context, String title, String subtitle) {
    showSnackbar(
        context, title, subtitle, Colors.white, Colors.red, Colors.white);
  }

  static warning(BuildContext context, String title, String subtitle) {
    showSnackbar(
      context,
      title,
      subtitle,
      Colors.black,
      Color(0xFFFFC107),
      Colors.black,
    );
  }

  static info(BuildContext context, String title, String subtitle) {
    showSnackbar(
      context,
      title,
      subtitle,
      Colors.white,
      Color(0xFF17A2B8),
      Colors.white,
    );
  }

  static light(BuildContext context, String title, String subtitle) {
    showSnackbar(
      context,
      title,
      subtitle,
      Colors.black,
      Color(0xFFF8F9FA),
      Colors.black,
    );
  }

  static dark(BuildContext context, String title, String subtitle) {
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
