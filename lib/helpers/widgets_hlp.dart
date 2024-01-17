import 'package:flutter/material.dart';

import '../configs/x_configs.dart';

//--Get Font Style Function:
// ========================================================================
TextStyle getFont(double fontSize,
    {Color? color, bool isBold = false, String? fontName}) {
  return new TextStyle(
    fontSize: fontSize,
    color: color ?? kBlack,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    fontFamily: fontName,
  );
}
