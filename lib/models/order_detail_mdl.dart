import 'dart:convert';

class OrderDetailModel {
  String status;
  String msg;
  DataDetail data;

  OrderDetailModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory OrderDetailModel.fromJson(String str) =>
      OrderDetailModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetailModel.fromMap(Map<String, dynamic> json) =>
      OrderDetailModel(
        status: json["status"],
        msg: json["msg"],
        data: DataDetail.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "msg": msg,
        "data": data.toMap(),
      };
}

class DataDetail {
  int id;
  int userId;
  int addressId;
  int subtotal;
  int shippingCost;
  int totalCost;
  String status;
  String paymentMethod;
  String transactionNumber;
  String paymentVaName;
  String paymentVaNumber;
  dynamic paymentEwallet;
  String shippingService;
  dynamic shippingResi;
  dynamic shippingProof;
  dynamic notes;
  DateTime createdAt;
  DateTime updatedAt;
  OrderUser user;
  OrderAddress address;
  List<HistOrderItem> orderItems;

  DataDetail({
    required this.id,
    required this.userId,
    required this.addressId,
    required this.subtotal,
    required this.shippingCost,
    required this.totalCost,
    required this.status,
    required this.paymentMethod,
    required this.transactionNumber,
    required this.paymentVaName,
    required this.paymentVaNumber,
    required this.paymentEwallet,
    required this.shippingService,
    required this.shippingResi,
    required this.shippingProof,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.address,
    required this.orderItems,
  });

  factory DataDetail.fromJson(String str) =>
      DataDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataDetail.fromMap(Map<String, dynamic> json) => DataDetail(
        id: json["id"],
        userId: json["user_id"],
        addressId: json["address_id"],
        subtotal: json["subtotal"],
        shippingCost: json["shipping_cost"],
        totalCost: json["total_cost"],
        status: json["status"],
        paymentMethod: json["payment_method"],
        transactionNumber: json["transaction_number"],
        paymentVaName: json["payment_va_name"],
        paymentVaNumber: json["payment_va_number"],
        paymentEwallet: json["payment_ewallet"],
        shippingService: json["shipping_service"],
        shippingResi: json["shipping_resi"],
        shippingProof: json["shipping_proof"],
        notes: json["notes"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: OrderUser.fromMap(json["user"]),
        address: OrderAddress.fromMap(json["address"]),
        orderItems: List<HistOrderItem>.from(
            json["order_items"].map((x) => HistOrderItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "address_id": addressId,
        "subtotal": subtotal,
        "shipping_cost": shippingCost,
        "total_cost": totalCost,
        "status": status,
        "payment_method": paymentMethod,
        "transaction_number": transactionNumber,
        "payment_va_name": paymentVaName,
        "payment_va_number": paymentVaNumber,
        "payment_ewallet": paymentEwallet,
        "shipping_service": shippingService,
        "shipping_resi": shippingResi,
        "shipping_proof": shippingProof,
        "notes": notes,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toMap(),
        "address": address.toMap(),
        "order_items": List<dynamic>.from(orderItems.map((x) => x.toMap())),
      };
}

class HistOrderItem {
  int id;
  int orderId;
  int productId;
  int quantity;
  HistOrderProduct product;
  DateTime createdAt;
  DateTime updatedAt;

  HistOrderItem({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.product,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HistOrderItem.fromJson(String str) =>
      HistOrderItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistOrderItem.fromMap(Map<String, dynamic> json) => HistOrderItem(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        product: HistOrderProduct.fromMap(json["product"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "quantity": quantity,
        "product": product.toMap(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class HistOrderProduct {
  int id;
  String name;
  String description;
  int categoryId;
  int price;
  int isAvailable;
  int stock;
  String readiness;
  String picture;
  DateTime createdAt;
  DateTime updatedAt;
  int sellerId;
  dynamic warungId;

  HistOrderProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryId,
    required this.price,
    required this.isAvailable,
    required this.stock,
    required this.readiness,
    required this.picture,
    required this.createdAt,
    required this.updatedAt,
    required this.sellerId,
    required this.warungId,
  });

  factory HistOrderProduct.fromJson(String str) =>
      HistOrderProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistOrderProduct.fromMap(Map<String, dynamic> json) =>
      HistOrderProduct(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        categoryId: json["category_id"],
        price: json["price"],
        isAvailable: json["is_available"],
        stock: json["stock"],
        readiness: json["readiness"],
        picture: json["picture"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "seller_id": sellerId,
        "warung_id": warungId,
      };
}

class OrderAddress {
  int id;
  String name;
  String address;
  String phone;
  String provinceId;
  String cityId;
  String districtId;
  String postalCode;
  int userId;
  int isDefault;
  dynamic createdAt;
  dynamic updatedAt;

  OrderAddress({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.provinceId,
    required this.cityId,
    required this.districtId,
    required this.postalCode,
    required this.userId,
    required this.isDefault,
    required this.createdAt,
    required this.updatedAt,
  });

  String get fullAddress =>
      '$address. $cityId. $provinceId. $districtId. Zip Code $postalCode';

  factory OrderAddress.fromJson(String str) =>
      OrderAddress.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderAddress.fromMap(Map<String, dynamic> json) => OrderAddress(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        provinceId: json["province_id"],
        cityId: json["city_id"],
        districtId: json["district_id"],
        postalCode: json["postal_code"],
        userId: json["user_id"],
        isDefault: json["is_default"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "address": address,
        "phone": phone,
        "province_id": provinceId,
        "city_id": cityId,
        "district_id": districtId,
        "postal_code": postalCode,
        "user_id": userId,
        "is_default": isDefault,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class OrderUser {
  int id;
  String name;
  String email;
  String phone;
  String roles;
  dynamic fcmId;
  dynamic emailVerifiedAt;
  dynamic twoFactorSecret;
  dynamic twoFactorRecoveryCodes;
  dynamic twoFactorConfirmedAt;
  DateTime createdAt;
  DateTime updatedAt;

  OrderUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.roles,
    required this.fcmId,
    required this.emailVerifiedAt,
    required this.twoFactorSecret,
    required this.twoFactorRecoveryCodes,
    required this.twoFactorConfirmedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderUser.fromJson(String str) => OrderUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderUser.fromMap(Map<String, dynamic> json) => OrderUser(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        roles: json["roles"],
        fcmId: json["fcm_id"],
        emailVerifiedAt: json["email_verified_at"],
        twoFactorSecret: json["two_factor_secret"],
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "roles": roles,
        "fcm_id": fcmId,
        "email_verified_at": emailVerifiedAt,
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
