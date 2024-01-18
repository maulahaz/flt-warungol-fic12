import 'dart:convert';

class ProductRemoteModel {
  final String? status;
  final Data? data;

  ProductRemoteModel({
    this.status,
    this.data,
  });

  factory ProductRemoteModel.fromJson(String str) =>
      ProductRemoteModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductRemoteModel.fromMap(Map<String, dynamic> json) =>
      ProductRemoteModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data?.toMap(),
      };
}

class Data {
  final int? currentPage;
  final List<Product>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<Product>.from(json["data"]!.map((x) => Product.fromMap(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromMap(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toMap())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Product {
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

  Product({
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
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
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
      };
}

class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(String str) => Link.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Link.fromMap(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "label": label,
        "active": active,
      };
}




// import 'dart:convert';

// class ProductRemoteModel {
//   final String? status;
//   final List<Product>? data;

//   ProductRemoteModel({
//     this.status,
//     this.data,
//   });

//   factory ProductRemoteModel.fromJson(String str) =>
//       ProductRemoteModel.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory ProductRemoteModel.fromMap(Map<String, dynamic> json) =>
//       ProductRemoteModel(
//         status: json["status"],
//         data: json["data"] == null
//             ? []
//             : List<Product>.from(json["data"]!.map((x) => Product.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "status": status,
//         "data":
//             data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
//       };
// }

// class Product {
//   final int? id;
//   final String? name;
//   final String? description;
//   final int? categoryId;
//   final int? price;
//   final int? isAvailable;
//   final int? stock;
//   final String? readiness;
//   final String? picture;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;

//   Product({
//     this.id,
//     this.name,
//     this.description,
//     this.categoryId,
//     this.price,
//     this.isAvailable,
//     this.stock,
//     this.readiness,
//     this.picture,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Product.fromMap(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         categoryId: json["category_id"],
//         price: json["price"],
//         isAvailable: json["is_available"],
//         stock: json["stock"],
//         readiness: json["readiness"],
//         picture: json["picture"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "category_id": categoryId,
//         "price": price,
//         "is_available": isAvailable,
//         "stock": stock,
//         "readiness": readiness,
//         "picture": picture,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//       };
// }
