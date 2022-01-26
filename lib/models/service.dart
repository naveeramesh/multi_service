// To parse this JSON data, do
//
//     final service = serviceFromJson(jsonString);

import 'dart:convert';

Service serviceFromJson(String str) => Service.fromJson(json.decode(str));

String serviceToJson(Service data) => json.encode(data.toJson());

class Service {
  Service({
    this.title,
    this.price,
    this.image,
    this.category,
  });

  String? title;
  int? price;
  String? image;
  String? category;

  Service.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        price = json["price"],
        image = json["image"],
        category = json["category"];

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "image": image,
        "category": category,
      };
}
