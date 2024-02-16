import 'package:flt_warungol_fic12/configs/x_configs.dart';
import 'package:flt_warungol_fic12/controllers/order/shipping_cost_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingSelected extends StatelessWidget {
  const ShippingSelected();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShippingCostBloc, ShippingCostState>(
      builder: (context, state) {
        if (state is GetShippingCostLoadedState) {
          return Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
            decoration: BoxDecoration(
              border: Border.all(color: kAppInversePrimary),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'state.shippingCost.rajaongkir!.results![0].costs![0].service!',
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    Text(
                      'Edit',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 4.0),
                    Icon(Icons.chevron_right),
                  ],
                ),
                SizedBox(height: 12.0),
                Text(
                  'JNE (Rp. 25.000)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text('Estimasi tiba 2 Januari 2024'),
              ],
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
