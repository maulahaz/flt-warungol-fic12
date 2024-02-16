import 'package:flt_warungol_fic12/helpers/x_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../configs/x_configs.dart';
import '../../../controllers/x_controllers.dart';
import '../../../models/x_models.dart';

class CartTile extends StatelessWidget {
  // final CartModel data;
  final ProductQuantityModel data;
  const CartTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: kPrimary.withOpacity(0.44),
              foregroundColor: kRed,
              icon: Icons.delete_outlined,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(10.0),
              ),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          decoration: BoxDecoration(
            gradient: kAppGradientPrim,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kAppPrimary),
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    // child: Image.asset(
                    //   data.product.picture!,
                    //   width: 68.0,
                    //   height: 68.0,
                    // ),
                    child: Image.network(
                      data.product.picture!.contains('http')
                          ? data.product.picture!
                          : BASE_URL_IMAGE + 'product/' + data.product.picture!,
                      width: 68.0,
                      height: 68.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 14.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.product.name!,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Text(
                            data.product.price!.currencyFormatRp,
                            style: const TextStyle(
                              color: kAppSecondary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: InkWell(
                      onTap: () {
                        context.read<CartBloc>().add(RemoveItem(data.product));
                        // if (data.quantity > 1) {
                        //   data.quantity--;
                        //   setState(() {});
                        // }
                      },
                      child: const ColoredBox(
                        color: kAppPrimary,
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.remove,
                            color: kAppInversePrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${data.qty}'),
                  ),
                  const SizedBox(width: 4.0),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: InkWell(
                      onTap: () {
                        context.read<CartBloc>().add(AddItem(data.product));
                        // data.quantity++;
                        // setState(() {});
                      },
                      child: const ColoredBox(
                        color: kAppPrimary,
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.add,
                            color: kAppInversePrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
