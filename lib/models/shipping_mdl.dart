import 'package:flt_warungol_fic12/helpers/x_helpers.dart';

class ShippingModel {
  final String type;
  final int priceStart;
  final int priceEnd;
  final DateTime estimate;

  ShippingModel({
    required this.type,
    required this.priceStart,
    required this.priceEnd,
    required this.estimate,
  });

  String get priceFormat =>
      '${priceStart.currencyFormatRp} - ${priceEnd.currencyFormatRp}';
  String get estimateFormat => estimate.toFormattedDate();
}
