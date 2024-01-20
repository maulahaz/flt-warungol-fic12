import 'package:flt_warungol_fic12/controllers/x_controllers.dart';
import 'package:flt_warungol_fic12/helpers/x_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;

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
              gradient: kAppGradientPrim,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                    data.picture!.contains('http')
                        ? data.picture!
                        : BASE_URL_IMAGE + 'product/' + data.picture!,
                    width: 170.0,
                    height: 112.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: Text(
                    data.name!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  data.price!.currencyFormatRp,
                  style: getFont(14, color: kAppSecondary, isBold: true),
                ),
              ],
            ),
          ),
          Positioned(
            top: 5,
            left: 10,
            child: badges.Badge(
              badgeStyle: badges.BadgeStyle(
                  badgeColor: data.readiness == 'ready'
                      ? kAppSecondary.withOpacity(.6)
                      : kAppSecondary2Dark.withOpacity(.5)),
              badgeContent: Text(
                data.readiness == 'ready' ? 'R' : 'O',
                style: TextStyle(
                    color: data.readiness == 'ready'
                        ? kAppPrimary
                        : kAppInversePrimary),
              ),
            ),
          ),
          Positioned(
            bottom: -5,
            right: 0,
            child: IconButton(
              onPressed: () {
                context.read<CartBloc>().add(AddItem(data));
              },
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
