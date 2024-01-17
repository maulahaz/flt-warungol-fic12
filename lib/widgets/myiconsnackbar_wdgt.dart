import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../configs/x_configs.dart';

class MyIconSnackbar {
  static showSnackbar(BuildContext context, String title, String subtitle,
      String iconStr, Color txColor, Color bgColor, Color iconColor) {
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
          Positioned(
              bottom: 0,
              child: SvgPicture.asset(
                iconStr,
                height: 48,
                width: 40,
              ))
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: kTransparent,
      elevation: 0,
    ));
  }

  static success(BuildContext context, String title, String subtitle) {
    showSnackbar(context, title, subtitle, 'assets/icons/blue-bubbles.svg',
        Colors.white, Color(0xFF28A745), Colors.white);
  }

  static danger(BuildContext context, String title, String subtitle) {
    showSnackbar(context, title, subtitle, 'assets/icons/close-circle.svg',
        Colors.white, Colors.red, Colors.white);
  }
}
