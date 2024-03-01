import 'package:flt_warungol_fic12/controllers/x_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'x_orders.dart';

class TrackingOrderPage extends StatefulWidget {
  final int orderId;
  const TrackingOrderPage({super.key, required this.orderId});

  @override
  State<TrackingOrderPage> createState() => _TrackingOrderPageState();
}

class _TrackingOrderPageState extends State<TrackingOrderPage> {
  // final List<ProductModel> orders = [
  //   ProductModel(
  //     images: [
  //       Assets.images.products.earphone.path,
  //       Assets.images.products.earphone.path,
  //       Assets.images.products.earphone.path,
  //     ],
  //     name: 'Earphone',
  //     price: 320000,
  //     stock: 20,
  //     description:
  //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
  //     store: StoreModel(
  //       name: 'CWB Online Store',
  //       type: StoreEnum.officialStore,
  //       imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
  //     ),
  //   ),
  //   ProductModel(
  //     images: [
  //       Assets.images.products.sepatu.path,
  //       Assets.images.products.sepatu2.path,
  //       Assets.images.products.sepatu.path,
  //     ],
  //     name: 'Sepatu Nike',
  //     price: 2200000,
  //     stock: 20,
  //     description:
  //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
  //     store: StoreModel(
  //       name: 'CWB Online Store',
  //       type: StoreEnum.officialStore,
  //       imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
  //     ),
  //   ),
  // ];
  // final List<TrackRecordModel> trackRecords = [
  //   TrackRecordModel(
  //     title: 'Pesanan Anda belum dibayar',
  //     status: TrackRecordStatus.belumBayar,
  //     isActive: true,
  //     updatedAt: DateTime.now().subtract(const Duration(days: 3)),
  //   ),
  //   TrackRecordModel(
  //     title: 'Pesanan Anda sedang disiapkan',
  //     status: TrackRecordStatus.dikemas,
  //     isActive: true,
  //     updatedAt: DateTime.now().subtract(const Duration(days: 2)),
  //   ),
  //   TrackRecordModel(
  //     title: 'Pesanan Anda dalam pengiriman',
  //     status: TrackRecordStatus.dikirim,
  //     isActive: true,
  //     updatedAt: DateTime.now().subtract(const Duration(days: 1)),
  //   ),
  //   TrackRecordModel(
  //     title: 'Pesanan Anda telah tiba',
  //     status: TrackRecordStatus.selesai,
  //     isActive: true,
  //     updatedAt: DateTime.now(),
  //   ),
  // ];

  @override
  void initState() {
    context.read<OrderDetailBloc>().add(GetOrderDetail(id: widget.orderId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Order'),
      ),
      body: BlocBuilder<OrderDetailBloc, OrderDetailState>(
        builder: (context, state) {
          if (state is GetOrderDetailLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetOrderDetailLoadedState) {
            final orderDetail = state.dataOrder.data;
            return ListView(
              padding: const EdgeInsets.all(20.0),
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: orderDetail.orderItems.length,
                  itemBuilder: (context, index) => HistProductTile(
                    data: orderDetail.orderItems[index],
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16.0),
                ),
                const SizedBox(height: 40.0),
                // TrackingHorizontal(trackRecords: trackRecords),
                // const SizedBox(height: 20.0),
                const Text(
                  'Shipping Info',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Shipping Address',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  orderDetail.address.fullAddress,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Received By',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  orderDetail.user.name,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text('No Data'));
          }
        },
      ),
    );
  }
}
