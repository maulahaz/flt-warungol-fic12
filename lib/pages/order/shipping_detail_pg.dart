import 'package:flt_warungol_fic12/configs/x_configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShippingDetailPage extends StatelessWidget {
  const ShippingDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
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
    //     updatedAt: DateTime.now().subtract(const Duration(days: 3)),
    //   ),
    //   TrackRecordModel(
    //     title: 'Pesanan Anda sedang disiapkan',
    //     status: TrackRecordStatus.dikemas,
    //     updatedAt: DateTime.now().subtract(const Duration(days: 2)),
    //   ),
    //   TrackRecordModel(
    //     title: 'Pesanan Anda dalam pengiriman',
    //     status: TrackRecordStatus.dikirim,
    //     updatedAt: DateTime.now().subtract(const Duration(days: 1)),
    //   ),
    //   TrackRecordModel(
    //     title: 'Pesanan Anda telah tiba',
    //     status: TrackRecordStatus.selesai,
    //     updatedAt: DateTime.now(),
    //   ),
    // ];

    void copyToClipboard(String text) {
      Clipboard.setData(ClipboardData(text: text)).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Copied to clipboard!'),
            duration: Duration(seconds: 1),
            backgroundColor: kAppInversePrimary,
          ),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Shipment'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          // ProductTile(
          //   data: orders.first,
          // ),
          const SizedBox(height: 36.0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: kAppInversePrimary),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Text(
                        'Resi No.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'JNCL000030',
                        style: TextStyle(
                          fontSize: 16,
                          color: kGrey,
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      InkWell(
                        onTap: () => copyToClipboard('JNCL000030'),
                        child: const Text(
                          'COPY',
                          style: TextStyle(
                            fontSize: 16,
                            color: kAppInversePrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 1,
                  color: kPrimary,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: TrackingVertical(trackRecords: trackRecords),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
