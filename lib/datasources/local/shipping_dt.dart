import '../../models/x_models.dart';

final shippings = [
  ShippingModel(
    type: 'Reguler',
    priceStart: 20000,
    priceEnd: 30000,
    estimate: DateTime.now().subtract(const Duration(days: 3)),
  ),
  ShippingModel(
    type: 'Cargo',
    priceStart: 20000,
    priceEnd: 30000,
    estimate: DateTime.now().subtract(const Duration(days: 3)),
  ),
  ShippingModel(
    type: 'Economy',
    priceStart: 20000,
    priceEnd: 30000,
    estimate: DateTime.now().subtract(const Duration(days: 4)),
  ),
];
