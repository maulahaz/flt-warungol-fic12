import 'package:flutter/material.dart';

import '../configs/x_configs.dart';

class ThisAppbar extends StatelessWidget {
  const ThisAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kTransparent,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(Icons.arrow_back_ios),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(Icons.menu),
        )
      ],
    );
  }
}
