import 'package:flutter/material.dart';

import 'x_configs.dart';

class Themes {
  static final light = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    primaryIconTheme: IconThemeData(color: kWhite), //<- Ngrubah Warna Drawer
    fontFamily: 'Poppins', //'DancingScript', //'Nova', //
  );

  static final dark = ThemeData(
    primaryColor: kAppGrey,
    brightness: Brightness.dark,
    // fontFamily: 'Poppins',
  );
}

TextStyle get myLinkText {
  return TextStyle(
    fontFamily: "Poppins",
    fontSize: 14,
    color: kYellow,
  );
}

TextStyle get myLinkText2 {
  return TextStyle(
    fontFamily: "Poppins",
    fontSize: 14,
    color: kBlue,
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.double,
  );
}
