import 'package:flt_warungol_fic12/helpers/x_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../configs/x_configs.dart';
import '../../../models/x_models.dart';

class ProductCard extends StatelessWidget {
  final Product data;
  const ProductCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(
          'productDetail',
          // pathParameters: PathParameters().toMap(),
          // extra: data,
        );
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              // color: Colors.yellow,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                  color: kBlack.withOpacity(0.05),
                  blurRadius: 7.0,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    BASE_URL + 'uploads/product/' + data.picture!,
                    width: 170.0,
                    height: 112.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  child: Text(
                    data.name!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  data.price!.currencyFormatRp,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: kAppPrimary,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -5,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: kWhite,
                  boxShadow: [
                    BoxShadow(
                      color: kBlack.withOpacity(0.1),
                      blurRadius: 10.0,
                      offset: const Offset(0, 2),
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: SvgPicture.asset('lib/assets/icons/order.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
