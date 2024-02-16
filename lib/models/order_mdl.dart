import 'dart:convert';

class OrderModel {
  final String? status;
  final String? msg;
  final DataOrder? data;

  OrderModel({
    this.status,
    this.msg,
    this.data,
  });

  factory OrderModel.fromJson(String str) =>
      OrderModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderModel.fromMap(Map<String, dynamic> json) => OrderModel(
        status: json["status"],
        msg: json["msg"],
        data: json["data"] == null ? null : DataOrder.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "msg": msg,
        "data": data?.toMap(),
      };
}

class DataOrder {
  final int? userId;
  final String? transactionNumber;
  final String? status;
  final int? subtotal;
  final String? paymentMethod;
  final int? addressId;
  final String? shippingService;
  final int? shippingCost;
  final int? totalCost;
  final String? paymentVaName;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;
  final String? paymentVaNumber;
  final DataUser? user;
  final List<OrderItem>? orderItems;

  DataOrder({
    this.userId,
    this.transactionNumber,
    this.status,
    this.subtotal,
    this.paymentMethod,
    this.addressId,
    this.shippingService,
    this.shippingCost,
    this.totalCost,
    this.paymentVaName,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.paymentVaNumber,
    this.user,
    this.orderItems,
  });

  factory DataOrder.fromJson(String str) => DataOrder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataOrder.fromMap(Map<String, dynamic> json) => DataOrder(
        userId: json["user_id"],
        transactionNumber: json["transaction_number"],
        status: json["status"],
        subtotal: json["subtotal"],
        paymentMethod: json["payment_method"],
        addressId: json["address_id"],
        shippingService: json["shipping_service"],
        shippingCost: json["shipping_cost"],
        totalCost: json["total_cost"],
        paymentVaName: json["payment_va_name"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
        paymentVaNumber: json["payment_va_number"],
        user: json["user"] == null ? null : DataUser.fromMap(json["user"]),
        orderItems: json["order_items"] == null
            ? []
            : List<OrderItem>.from(
                json["order_items"]!.map((x) => OrderItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "transaction_number": transactionNumber,
        "status": status,
        "subtotal": subtotal,
        "payment_method": paymentMethod,
        "address_id": addressId,
        "shipping_service": shippingService,
        "shipping_cost": shippingCost,
        "total_cost": totalCost,
        "payment_va_name": paymentVaName,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "payment_va_number": paymentVaNumber,
        "user": user?.toMap(),
        "order_items": orderItems == null
            ? []
            : List<dynamic>.from(orderItems!.map((x) => x.toMap())),
      };
}

class OrderItem {
  final int? id;
  final int? orderId;
  final int? productId;
  final int? quantity;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DataProduct? product;

  OrderItem({
    this.id,
    this.orderId,
    this.productId,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  factory OrderItem.fromJson(String str) => OrderItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderItem.fromMap(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        product: json["product"] == null
            ? null
            : DataProduct.fromMap(json["product"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "quantity": quantity,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product": product?.toMap(),
      };
}

class DataProduct {
  final int? id;
  final String? name;
  final String? description;
  final int? categoryId;
  final int? price;
  final int? isAvailable;
  final int? stock;
  final String? readiness;
  final String? picture;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? sellerId;
  final dynamic warungId;

  DataProduct({
    this.id,
    this.name,
    this.description,
    this.categoryId,
    this.price,
    this.isAvailable,
    this.stock,
    this.readiness,
    this.picture,
    this.createdAt,
    this.updatedAt,
    this.sellerId,
    this.warungId,
  });

  factory DataProduct.fromJson(String str) =>
      DataProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataProduct.fromMap(Map<String, dynamic> json) => DataProduct(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        categoryId: json["category_id"],
        price: json["price"],
        isAvailable: json["is_available"],
        stock: json["stock"],
        readiness: json["readiness"],
        picture: json["picture"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        sellerId: json["seller_id"],
        warungId: json["warung_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "category_id": categoryId,
        "price": price,
        "is_available": isAvailable,
        "stock": stock,
        "readiness": readiness,
        "picture": picture,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "seller_id": sellerId,
        "warung_id": warungId,
      };
}

class DataUser {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? roles;
  final dynamic emailVerifiedAt;
  final dynamic twoFactorSecret;
  final dynamic twoFactorRecoveryCodes;
  final dynamic twoFactorConfirmedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DataUser({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.roles,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.twoFactorConfirmedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory DataUser.fromJson(String str) => DataUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataUser.fromMap(Map<String, dynamic> json) => DataUser(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        roles: json["roles"],
        emailVerifiedAt: json["email_verified_at"],
        twoFactorSecret: json["two_factor_secret"],
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "roles": roles,
        "email_verified_at": emailVerifiedAt,
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
