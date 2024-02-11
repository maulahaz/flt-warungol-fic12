import 'package:flutter/material.dart';

import '../configs/x_configs.dart';
import '../helpers/x_helpers.dart';

class MyButtons {
  static Widget showMyButtons(
    BuildContext context,
    String label,
    Color txColor,
    Color bgColor,
    Function() function, {
    required bool outlined,
    required bool gradiented,
    Widget? hasIcon,
    bool isLoading = false,
  }) {
    //--USING ELEVATED BUTTON v.1:
    //----------------------------------------------------------------
    // return ElevatedButton(
    //   onPressed: function,
    //   child: Text(label, style: getFont(16, color: kBlack)),
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: outlined ? kTransparent : color,
    //     side: outlined ? BorderSide(width:2, color:color) : null,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(12),
    //     ),
    //   ),
    // );

    //--USING ELEVATED BUTTON v.2:
    //----------------------------------------------------------------
    // return ElevatedButton(
    //   onPressed: function,
    //   style: ElevatedButton.styleFrom(
    //     padding: const EdgeInsets.all(0.0),
    //     elevation: 5,
    //   ),
    //   child: Container(
    //     padding: EdgeInsets.all(10),
    //     constraints: BoxConstraints(minWidth: 88.0),
    //     decoration: BoxDecoration(
    //         color: outlined ? kTransparent : color,
    //         gradient: gradiented ? kAppGradientPrim : null,
    //         borderRadius: BorderRadius.all(Radius.circular(10)),
    //         border: outlined ? Border.all(color: color, width: 2) : null),
    //     child: Text(label, style: getFont(16, color: kBlack)),
    //   ),
    // );

    //--USING MATERIAL BUTTON (will take all Width):
    //----------------------------------------------------------------
    return MaterialButton(
      onPressed: function,
      hoverColor: kTransparent,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(kDefaultPadding * 0.5),
        decoration: BoxDecoration(
            color: outlined ? kTransparent : bgColor,
            gradient: gradiented ? kAppGradientPrim : null,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: outlined ? Border.all(color: bgColor, width: 2) : null),
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(color: kAppPrimary)),
                  SizedBox(width: 10),
                  Text(label, style: getFont(16, color: txColor)),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  hasIcon == null
                      ? SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: hasIcon,
                        ),
                  Text(label, style: getFont(16, color: txColor))
                ],
              ),
      ),
    );
  }

  static Widget primary(
      BuildContext context, String label, Function() function) {
    return showMyButtons(context, label, kBlack, kAppPrimary, function,
        outlined: false, gradiented: false);
  }

  static Widget secondary(
      BuildContext context, String label, Function() function) {
    return showMyButtons(
        context, label, kAppSecondary, kAppSecondary2, function,
        outlined: false, gradiented: false);
  }

  static Widget warning(
      BuildContext context, String label, Function() function) {
    return showMyButtons(context, label, kBlack, kBSWarning, function,
        outlined: false, gradiented: false);
  }

  static Widget danger(
      BuildContext context, String label, Function() function) {
    return showMyButtons(context, label, kWhite, kRed, function,
        outlined: false, gradiented: false);
  }

  static Widget disabled(BuildContext context, String label) {
    return showMyButtons(context, label, kWhite, kGrey, () {},
        outlined: false, gradiented: false);
  }

  static Widget primaryOutlined(
      BuildContext context, String label, Function() function) {
    return showMyButtons(context, label, kBlack, kAppPrimary, function,
        outlined: true, gradiented: false);
  }

  static Widget secondaryOutlined(
      BuildContext context, String label, Function() function) {
    return showMyButtons(
        context, label, kAppSecondary, kAppInversePrimary, function,
        outlined: true, gradiented: false);
  }

  static Widget dangerOutlined(
      BuildContext context, String label, Function() function) {
    return showMyButtons(context, label, kRed, kRed, function,
        outlined: true, gradiented: false);
  }

  static Widget primaryGradiented(
      BuildContext context, String label, Function() function) {
    return showMyButtons(context, label, kBlack, kAppPrimary, function,
        outlined: false, gradiented: true);
  }

  static Widget isLoading(BuildContext context, String label) {
    return showMyButtons(context, label, kAppInversePrimary, kGrey, () {},
        outlined: false, gradiented: false, isLoading: true);
  }

  static Widget primaryIconned(
      BuildContext context, String label, Widget icon, Function() function) {
    return showMyButtons(context, label, kBlack, kAppPrimary, function,
        outlined: false, gradiented: false, hasIcon: icon);
  }
}
