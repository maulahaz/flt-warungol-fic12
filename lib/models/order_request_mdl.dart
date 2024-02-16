import 'dart:convert';

class OrderRequestModel {
  final String? paymentMethod;
  final String? paymentVaName;
  final int? addressId;
  final String? shippingService;
  final int? shippingCost;
  final int? totalCost;
  final List<Item>? items;

  OrderRequestModel({
    this.paymentMethod,
    this.paymentVaName,
    this.addressId,
    this.shippingService,
    this.shippingCost,
    this.totalCost,
    this.items,
  });

  factory OrderRequestModel.fromJson(String str) =>
      OrderRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderRequestModel.fromMap(Map<String, dynamic> json) =>
      OrderRequestModel(
        paymentMethod: json["payment_method"],
        paymentVaName: json["payment_va_name"],
        addressId: json["address_id"],
        shippingService: json["shipping_service"],
        shippingCost: json["shipping_cost"],
        totalCost: json["total_cost"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "payment_method": paymentMethod,
        "payment_va_name": paymentVaName,
        "address_id": addressId,
        "shipping_service": shippingService,
        "shipping_cost": shippingCost,
        "total_cost": totalCost,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

class Item {
  final int? productId;
  final int? quantity;

  Item({
    this.productId,
    this.quantity,
  });

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        productId: json["product_id"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toMap() => {
        "product_id": productId,
        "quantity": quantity,
      };
}
