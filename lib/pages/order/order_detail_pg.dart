import 'package:flt_warungol_fic12/widgets/x_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/x_controllers.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Order Detail Page'),
            MyButtons.primary(context, 'Signout', () {
              print('Signout Button');
              context.read<AuthBloc>().add(GetSignout());
              context.goNamed('dashboard');
            }),
            MyButtons.primary(context, 'Go to Dashboard', () {
              context.goNamed('root');
            })
          ],
        ),
      ),
    );
  }
}
