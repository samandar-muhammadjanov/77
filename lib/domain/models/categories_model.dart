import 'dart:convert';

List<Categories> categoriesFromJson(String str) =>
    List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

String categoriesToJson(List<Categories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categories {
  int id;
  String name;
  int adsCount;
  String icon;
  List<dynamic> childs;

  Categories({
    required this.id,
    required this.name,
    required this.adsCount,
    required this.icon,
    required this.childs,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        name: json["name"],
        adsCount: json["ads_count"],
        icon: json["icon"],
        childs: List<dynamic>.from(json["childs"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ads_count": adsCount,
        "icon": icon,
        "childs": List<dynamic>.from(childs.map((x) => x)),
      };
}
