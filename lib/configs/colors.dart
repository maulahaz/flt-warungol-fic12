import 'package:flutter/material.dart';

// Main Colors:
// --------------------------------------------------
const kRed = Color(0xFFE92E30);
const kGreen = Color(0xFF6AC259);
const kBlue = Colors.blue;
const kYellow = Colors.yellow;
const kGrey = Color(0xFFC1C1C1);
const kWhite = Color(0xFFFFFFFF);
const kBlack = Color(0xFF101010);
const kTransparent = Colors.transparent;

//--App Colors Pallets:
const kAppPrimary = kWhite;
const kAppInversePrimary = Color.fromRGBO(97, 97, 97, 1);
const kAppSecondary = Color.fromARGB(255, 53, 128, 119);

const kAppLight = Color(0xFFF8F5FF);
const kAppGrey = Color(0xFFEEEEEE);
const kAppPrimaryDark = Color(0xffa2d2ff);

//--Bootstrap Color Standards: (Primary, Secondary,Success,Danger,Warnig,Info,Light,Dark)
//--Background Color:
const kBSPrimary = Color(0xFF007BFF);
const kBSSecondary = Color(0xFF6C757D);
const kBSSuccess = Color(0xFF28A745);
const kBSDanger = Color(0xFFDC3545);
const kBSWarning = Color(0xFFFFC107);
const kBSInfo = Color(0xFF17A2B8);
const kBSLight = Color(0xFFF8F9FA);
const kBSDark = Color(0xFF343A40);
const kBSDefault = Color(0xffe0e0e0);

//--Gradient:
const kAppGradientPrim = LinearGradient(
  colors: [kAppPrimary, kWhite, kAppPrimaryDark],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const kPrimaryGradient = LinearGradient(
  colors: [kAppPrimary, kWhite],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
