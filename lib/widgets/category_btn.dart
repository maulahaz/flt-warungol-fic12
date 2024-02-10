import 'package:flt_warungol_fic12/configs/x_configs.dart';
import 'package:flt_warungol_fic12/helpers/x_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: kAppGradientPrim,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: kAppPrimary, width: 1),
                ),
                // child: Image.network(
                child: SvgPicture.network(
                  imagePath.contains('http')
                      ? imagePath
                      : BASE_URL_IMAGE + 'category/' + imagePath,
                  width: 60.0,
                  // height: 60.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              width: 70.0,
              child: Text(
                label.capitalized(),
                style: getFont(14, color: kAppSecondary),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
