import 'dart:convert';

ProductDetail productDetailFromJson(String str) =>
    ProductDetail.fromJson(json.decode(str));

String productDetailToJson(ProductDetail data) => json.encode(data.toJson());

class ProductDetail {
  int id;
  String name;
  String slug;
  SubCategory subCategory;
  String description;
  int price;
  String currency;
  DateTime publishedAt;
  String phoneNumber;
  Address address;
  Seller seller;
  List<String> photos;
  Extra extra;

  ProductDetail({
    required this.id,
    required this.name,
    required this.slug,
    required this.subCategory,
    required this.description,
    required this.price,
    required this.currency,
    required this.publishedAt,
    required this.phoneNumber,
    required this.address,
    required this.seller,
    required this.photos,
    required this.extra,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        slug: json["slug"] ?? "",
        subCategory: SubCategory.fromJson(json["sub_category"] ?? {}),
        description: json["description"] ?? "",
        price: json["price"] ?? 0,
        currency: json["currency"],
        publishedAt: DateTime.parse(json["published_at"] ?? "2023-08-16"),
        phoneNumber: json["phone_number"] ?? "",
        address: Address.fromJson(json["address"] ?? {}),
        seller: Seller.fromJson(json["seller"] ?? {}),
        photos: List<String>.from(json["photos"].map((x) => x)),
        extra: Extra.fromJson(json["extra"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "sub_category": subCategory.toJson(),
        "description": description,
        "price": price,
        "currency": currency,
        "published_at": publishedAt.toIso8601String(),
        "phone_number": phoneNumber,
        "address": address.toJson(),
        "seller": seller.toJson(),
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "extra": extra.toJson(),
      };
}

class Address {
  District district;
  int id;
  String name;
  double lat;
  double long;

  Address({
    required this.district,
    required this.id,
    required this.name,
    required this.lat,
    required this.long,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        district: District.fromJson(json["district"]),
        id: json["id"],
        name: json["name"],
        lat: json["lat"] ?? 0,
        long: json["long"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "district": district.toJson(),
        "id": id,
        "name": name,
        "lat": lat,
        "long": long,
      };
}

class District {
  int id;
  String name;
  Region region;

  District({
    required this.id,
    required this.name,
    required this.region,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"],
        name: json["name"],
        region: Region.fromJson(json["region"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "region": region.toJson(),
      };
}

class Region {
  int id;
  String name;

  Region({
    required this.id,
    required this.name,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Extra {
  bool isMine;
  String status;
  DateTime expiresAt;

  Extra({
    required this.isMine,
    required this.status,
    required this.expiresAt,
  });

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        isMine: json["is_mine"],
        status: json["status"],
        expiresAt: DateTime.parse(json["expires_at"]),
      );

  Map<String, dynamic> toJson() => {
        "is_mine": isMine,
        "status": status,
        "expires_at": expiresAt.toIso8601String(),
      };
}

class Seller {
  int id;
  String fullName;
  dynamic profilePhoto;

  Seller({
    required this.id,
    required this.fullName,
    required this.profilePhoto,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"],
        fullName: json["full_name"],
        profilePhoto: json["profile_photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "profile_photo": profilePhoto,
      };
}

class SubCategory {
  int id;
  String name;
  Category category;

  SubCategory({
    required this.id,
    required this.name,
    required this.category,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        name: json["name"],
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category.toJson(),
      };
}

class Category {
  int id;
  String name;
  int adsCount;
  String icon;

  Category({
    required this.id,
    required this.name,
    required this.adsCount,
    required this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        adsCount: json["ads_count"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ads_count": adsCount,
        "icon": icon,
      };
}
