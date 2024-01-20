import 'package:flutter/material.dart';
import 'colors.dart';

//--Shadows:
// --------------------------------------------------
const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);

//--TextStyle:
// --------------------------------------------------
const kTextStyle =
    TextStyle(fontSize: 21, letterSpacing: 1.2, fontWeight: FontWeight.bold);

final kHeadingStyle = TextStyle(
  fontSize: 21,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

//--Input Decoration:
final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 15),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: kAppSecondary),
  );
}
