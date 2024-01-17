import 'package:flutter/material.dart';

import '../configs/x_configs.dart';

class ThisSliverAppbar extends StatelessWidget {
  const ThisSliverAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: kTransparent,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background:
            Image.asset('lib/assets/images/naturaleza.jpg', fit: BoxFit.cover),
      ),
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
