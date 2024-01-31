import 'package:flutter/material.dart';

import 'x_configs.dart';

class Themes {
  static final light = ThemeData(
      colorScheme: ColorScheme.light(
        background: Colors.grey.shade300,
        // background: Color.fromRGBO(152, 233, 202, 1),
        primary: kWhite,
        secondary: kAppSecondary,
        inversePrimary: kAppInversePrimary,
      ),
      primarySwatch: Colors.brown,
      brightness: Brightness.light,
      primaryIconTheme: IconThemeData(color: kWhite), //<- Ngrubah Warna Drawer
      fontFamily: 'Poppins', //'DancingScript', //'Nova', //
      appBarTheme: AppBarTheme(backgroundColor: kPrimary));

  static final dark = ThemeData(
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade300,
      primary: kWhite,
      secondary: kAppSecondary,
      inversePrimary: kAppInversePrimary,
    ),
    primaryColor: kAppGrey,
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
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
