import 'dart:convert';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  int id;
  String name;
  String slug;
  String currency;
  int price;
  String description;
  String phoneNumber;
  List<dynamic> images;

  Products({
    required this.id,
    required this.name,
    required this.slug,
    required this.currency,
    required this.price,
    required this.description,
    required this.phoneNumber,
    required this.images,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        slug: json["slug"] ?? "",
        currency: json["currency"] ?? "",
        price: json["price"] ?? 0,
        description: json["description"] ?? "",
        phoneNumber: json["phone_number"] ?? "",
        images: List<dynamic>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "currency": currency,
        "price": price,
        "description": description,
        "phone_number": phoneNumber,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
