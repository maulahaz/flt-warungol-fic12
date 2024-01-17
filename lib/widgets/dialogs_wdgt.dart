import 'package:flutter/material.dart';

import '../configs/x_configs.dart';
import '../helpers/x_helpers.dart';
import 'x_widgets.dart';

class MyDialogs {
//--Show Dialog Using DIALOG
// ========================================================================
  static Future<dynamic> showDialogBox(BuildContext context,
      {String title = 'Alert',
      String subtitle = 'Something occured in your Apps',
      required Color iconColor}) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: kTransparent,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          margin: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: kBlack.withOpacity(0.6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add_alert, size: 50, color: iconColor),
              SizedBox(height: 24),
              Text(title, style: getFont(16, color: kWhite)),
              SizedBox(height: 12),
              Text(subtitle, style: getFont(12, color: kWhite)),
            ],
          ),
        ),
      ),
    );
  }

//--Show Dialog Using ALERTDIALOG
// ========================================================================
  static Future<dynamic> showAlertDialogBox(BuildContext context,
      {String title = 'Alert',
      String subtitle = 'Something occured in your Apps',
      Color? iconColor}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: getFont(16, color: kBlack)),
        content: Text(subtitle, style: getFont(12, color: kBlack)),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: context.deviceWidth * 0.3,
                child: MyButtons.primary(context, 'OK', () {}),
              ),
              SizedBox(width: 5),
              SizedBox(
                width: context.deviceWidth * 0.3,
                child: MyButtons.primaryOutlined(context, 'Cancel', () {}),
              ),
            ],
          ),
        ],
      ),
    );
  }

//--Show Loading DIALOG
// ========================================================================
  static Future<dynamic> loading(BuildContext context,
      {String title = 'Loading...'}) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text(title),
                ],
              ),
            ));
  }

  //--showDialogBox::alert
  static Future<dynamic> alert(
      BuildContext context, String title, String subtitle) {
    return showDialogBox(context,
        title: title, subtitle: subtitle, iconColor: Colors.orange);
  }

  //--showAlertDialogBox::alert
  static Future<dynamic> alert2(
      BuildContext context, String title, String subtitle) {
    return showAlertDialogBox(context, title: title, subtitle: subtitle);
  }
}
