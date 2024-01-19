import 'package:flutter/material.dart';

import '../../../models/x_models.dart';
import '../../x_pages.dart';

class ProductList extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAllTap;
  final List<Product> items;

  const ProductList({
    super.key,
    required this.title,
    required this.onSeeAllTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleContent(
          title: title,
          onSeeAllTap: onSeeAllTap,
        ),
        SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (.9 / 1),
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 20.0,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) => ProductCard(
            data: items[index],
          ),
        )
      ],
    );
  }
}
