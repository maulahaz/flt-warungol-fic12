import 'package:flt_warungol_fic12/configs/variables.dart';
import 'package:flt_warungol_fic12/helpers/build_extension_hlp.dart';
import 'package:flt_warungol_fic12/widgets/x_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(
    //   const Duration(seconds: 3),
    //   () => context.goNamed(
    //     'dashboard',
    //     // pathParameters: PathParameters().toMap(),
    //   ),
    // );

    return Scaffold(
      backgroundColor: context.colorSchema.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //--Shopping bag
            Icon(Icons.shopping_bag,
                size: 100, color: context.colorSchema.inversePrimary),
            SizedBox(height: 20),
            Text(
              APP_NAME,
              style: TextStyle(
                color: context.colorSchema.inversePrimary,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            //--Button
            SizedBox(
                width: context.deviceWidth * .5,
                child: MyButtons.primary(context, 'Let\'s shop',
                    () => context.goNamed('dashboard'))),
          ],
        ),
      ),
    );
  }
}
