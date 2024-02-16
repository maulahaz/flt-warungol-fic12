import 'package:flt_warungol_fic12/configs/x_configs.dart';
import 'package:flt_warungol_fic12/helpers/build_extension_hlp.dart';
import 'package:flt_warungol_fic12/widgets/x_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/x_controllers.dart';

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
            ClipRRect(
                child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: kAppSecondary2,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: kWhite,
                    width: 3,
                  )),
              child: Icon(Icons.shopping_bag, size: 100),
            )),
            SizedBox(height: 20),
            Text(
              'Welcome to',
              style: TextStyle(
                color: kAppInversePrimary,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 14),
            Text(
              APP_NAME,
              style: TextStyle(
                fontSize: 16,
                color: kAppSecondary,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // SizedBox(
            //   width: context.deviceWidth * .5,
            //   child: MyButtons.primary(
            //       context, 'Let\'s shop', () => context.goNamed('root')),
            // ),
            //--Button
            SizedBox(
                width: context.deviceWidth * .5,
                child: BlocConsumer<WarungBloc, WarungState>(
                  listener: (context, state) {
                    if (state is GetWarungLoadedState) {
                      context.goNamed('root');
                    }
                  },
                  builder: (context, state) {
                    // if (state is GetWarungInitialState) {
                    //   return MyButtons.primary(context, 'Let\'s shop',
                    //       () => context.read<WarungBloc>().add(GetWarungs()));
                    // }
                    if (state is GetWarungLoadingState) {
                      return MyButtons.isLoading(context, '...Loading');
                    } else {
                      return MyButtons.primary(context, 'Let\'s shop',
                          () => context.read<WarungBloc>().add(GetWarungs()));
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
