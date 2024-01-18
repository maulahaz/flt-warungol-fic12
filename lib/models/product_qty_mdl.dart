// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'x_models.dart';

class ProductQuantityModel {
  Product product;
  int qty;

  ProductQuantityModel({required this.product, required this.qty});

  @override
  bool operator ==(covariant ProductQuantityModel other) {
    if (identical(this, other)) return true;

    return other.product == product && other.qty == qty;
  }

  @override
  int get hashCode => product.hashCode ^ qty.hashCode;

  ProductQuantityModel copyWith({
    Product? product,
    int? qty,
  }) {
    return ProductQuantityModel(
      product: product ?? this.product,
      qty: qty ?? this.qty,
    );
  }
}
