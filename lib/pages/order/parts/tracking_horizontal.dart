import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../configs/x_configs.dart';
import '../../../models/x_models.dart';
import '../../../widgets/x_widgets.dart';

class TrackingHorizontal extends StatelessWidget {
  final List<TrackRecordModel> trackRecords;
  const TrackingHorizontal({super.key, required this.trackRecords});

  @override
  Widget build(BuildContext context) {
    final trackRecord = trackRecords.where((element) => element.isActive).last;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: trackRecords.length,
            itemBuilder: (BuildContext context, int index) => TrackingItemH(
              isActive: trackRecords[index].isActive,
              isCurrent:
                  index == (trackRecords.where((e) => e.isActive).length - 1),
              isLast: index == trackRecords.length - 1,
            ),
          ),
        ),
        const SizedBox(height: 24.0),
        Text(
          trackRecord.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4.0),
        if (trackRecord.status != TrackRecordStatus.selesai) ...[
          const Text(
            'Estimasi tiba : 20 Januari 2024',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Pesanan dikemas Penjual',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const Text(
            'Januari 14, 22:36',
            style: TextStyle(
              color: kGrey,
            ),
          ),
          const SizedBox(height: 30.0),
          MyButtons.primaryOutlined(context, 'Cancel order', () {})
        ],
        if (trackRecord.status == TrackRecordStatus.selesai) ...[
          Text(
            'Diterima : ${trackRecord.formattedDate}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 30.0),
          MyButtons.primaryOutlined(context, 'Cancel order', () {
            context.goNamed('shippingDetail');
          }),
          Button.outlined(
            onPressed: () {
              context.goNamed(
                'shippingDetail',
              );
            },
            label: 'Detail pelacakan pengiriman',
          ),
          const SizedBox(height: 8.0),
          Button.filled(
            onPressed: () {
              context.goNamed('root');
            },
            label: 'Beli lagi',
          ),
        ],
      ],
    );
  }
}

class TrackingItemH extends StatelessWidget {
  final bool isActive;
  final bool isCurrent;
  final bool isLast;

  const TrackingItemH({
    super.key,
    required this.isActive,
    required this.isCurrent,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isCurrent ? Icons.radio_button_checked : Icons.circle,
          color: isActive
              ? kAppInversePrimary
              : kAppInversePrimary.withOpacity(0.2),
          size: isCurrent ? 20.0 : 14.0,
        ),
        if (!isLast)
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width / 4.2,
              height: 2.0,
              color: isActive && !isCurrent
                  ? kAppInversePrimary
                  : kAppInversePrimary.withOpacity(0.2),
            ),
          ),
      ],
    );
  }
}
