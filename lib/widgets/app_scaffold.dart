import 'package:flt_warungol_fic12/helpers/x_helpers.dart';
import 'package:flutter/material.dart';

import '../configs/x_configs.dart';

class AppScaffold extends StatelessWidget {
  final Widget? appBarTitle;
  final List<Widget>? actions;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool showBackButton;
  final double toolbarHeight;

  const AppScaffold({
    super.key,
    this.appBarTitle,
    this.actions,
    this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.showBackButton = true,
    this.toolbarHeight = 60.0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimary,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: toolbarHeight,
        titleTextStyle: const TextStyle(
          color: kWhite,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        leading: showBackButton
            ? IconButton(
                onPressed: () => context.navPop(),
                icon: const Icon(
                  Icons.chevron_left,
                  color: kWhite,
                  size: 32.0,
                ),
              )
            : null,
        centerTitle: true,
        backgroundColor: kAppPrimary,
        title: appBarTitle,
        actions: actions,
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30.0),
          ),
          color: kAppLight,
        ),
        child: body,
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
