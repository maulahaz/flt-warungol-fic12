import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../configs/x_configs.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => context.goNamed(
        'root',
        // pathParameters: PathParameters().toMap(),
      ),
    );

    return const Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(30.0),
        child: Text(
          'Code with Bahri',
          style: TextStyle(
            color: kAppGrey,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
