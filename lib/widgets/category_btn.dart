import 'package:flt_warungol_fic12/configs/x_configs.dart';
import 'package:flt_warungol_fic12/helpers/x_helpers.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onPressed;

  const CategoryButton({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Image.network(
                imagePath.contains('http')
                    ? imagePath
                    : BASE_URL_IMAGE + 'category/' + imagePath,
                width: 80.0,
                height: 70.0,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: 70.0,
              child: Text(
                label.capitalized(),
                style: getFont(12, color: kAppSecondary),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
