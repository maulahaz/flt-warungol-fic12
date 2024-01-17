import 'package:flutter/material.dart';
import '../configs/x_configs.dart';
import '../helpers/x_helpers.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const GradientButton({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
        decoration: BoxDecoration(
          gradient: kPrimaryGradient,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Text(title),
      ),
    );
  }
}

class MyButton {
  //--App Button Using Gradient
  static MaterialButton appPrimary(
      BuildContext context, String title, double width, Function() function) {
    return MaterialButton(
      minWidth: width,
      onPressed: function,
      child: Container(
        width: width,
        alignment: Alignment.center,
        padding: EdgeInsets.all(kDefaultPadding * 0.5), // 15
        decoration: BoxDecoration(
            gradient: kAppGradientPrim,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: kAppPrimaryDark, width: 2)),
        child: Text(title, style: getFont(16, color: kBlack)),
      ),
    );
  }

  //--CommonButton.defaultBtn
  static MaterialButton defaultBtn(
      BuildContext context, String text, double width, Function() function) {
    return MaterialButton(
      minWidth: width,
      padding: EdgeInsets.all(20),
      onPressed: function,
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20)
              .copyWith(color: kBlack, fontWeight: FontWeight.bold)),
    );
  }

  //--CommonButton.successBtn
  static MaterialButton successBtn(
      BuildContext context, String text, double width, Function() function) {
    return MaterialButton(
      minWidth: width,
      padding: EdgeInsets.all(20),
      onPressed: function,
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20)
              .copyWith(color: kBlack, fontWeight: FontWeight.bold)),
    );
  }

  //--CommonButton.successBtnOutline
  static OutlinedButton successBtnOutline(
      BuildContext context, String text, Function() function) {
    return OutlinedButton(
      onPressed: function,
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20)
              .copyWith(color: kBlack, fontWeight: FontWeight.bold)),
    );
  }

  //--CommonButton.successBtn
  static InkWell iconBtn(
      Function() function, IconData icon, Color fColor, Color bgColor) {
    return InkWell(
      onTap: function,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            padding: EdgeInsets.all(5),
            color: bgColor,
            child: Icon(icon, color: fColor)),
      ),
    );
  }
}

enum ButtonStyle { filled, outlined }

class Button extends StatelessWidget {
  const Button.filled({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.filled,
    this.color = kAppPrimary,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 50.0,
    this.borderRadius = 6.0,
    this.icon,
    this.disabled = false,
    this.fontSize = 16.0,
  });

  const Button.outlined({
    super.key,
    required this.onPressed,
    required this.label,
    this.style = ButtonStyle.outlined,
    this.color = kWhite,
    this.textColor = kBlack,
    this.width = double.infinity,
    this.height = 50.0,
    this.borderRadius = 6.0,
    this.icon,
    this.disabled = false,
    this.fontSize = 16.0,
  });

  final Function() onPressed;
  final String label;
  final ButtonStyle style;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;
  final Widget? icon;
  final bool disabled;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: style == ButtonStyle.filled
          ? ElevatedButton(
              onPressed: disabled ? null : onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  if (icon != null) const SizedBox(width: 10.0),
                  Text(
                    label,
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          : OutlinedButton(
              onPressed: disabled ? null : onPressed,
              style: OutlinedButton.styleFrom(
                backgroundColor: color,
                side: const BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  if (icon != null) const SizedBox(width: 10.0),
                  Text(
                    label,
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}


// class MyButtonsX {
//   static MaterialButton showMyButtons(
//     // BuildContext context,
//     String title,
//     Color color,
//     VoidCallback onPress,
//   ) {
//     return MaterialButton(
//       child: Text(title),
//       color: color,
//       onPressed: onPress,
//     );
//   }

//   static secondary({String title, Function onPress}) {
//     showMyButtons(title, Color(0x6C757D), onPress);
//   }
// }

// class MyButtons {
//   static showMyButtons(
//     BuildContext context,
//     String title,
//     Color color,
//     VoidCallback onPress,
//   ) {
//     return MaterialButton(
//       child: Text(title),
//       color: color,
//       onPressed: onPress,
//     );
//   }

  // static primary({String title, Function onPress}) {
  //   showMyButtons(title, onPress, Color(0x007BFF));
  // }

  // static secondary(BuildContext context, String title, Function onPress) {
  //   showMyButtons(context, title, Color(0x6C757D), onPress);
  // }

  // static success(String title, Function onPress) {
  //   showMyButtons(title, onPress, Color(0x28A745));
  // }

  // static danger(String title, Function onPress) {
  //   showMyButtons(title, onPress, Color(0xDC3545));
  // }

  // static warning(String title, Function onPress) {
  //   showMyButtons(title, onPress, Color(0xFFC107));
  // }

  // static info(String title, Function onPress) {
  //   showMyButtons(title, onPress, Color(0x17A2B8));
  // }

  // static light(String title, Function onPress) {
  //   showMyButtons(title, onPress, Color(0xF8F9FA));
  // }

  // static dark(String title, Function onPress) {
  //   showMyButtons(title, onPress, Color(0x343A40));
  // }
// }
