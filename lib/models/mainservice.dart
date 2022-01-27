// To parse this JSON data, do
//
//     final mainService = mainServiceFromJson(jsonString);

import 'dart:convert';

MainService mainServiceFromJson(String str) =>
    MainService.fromJson(json.decode(str));

String mainServiceToJson(MainService data) => json.encode(data.toJson());

class MainService {
  MainService(
      {this.title,
      this.rating,
      this.price,
      required this.video,
      required this.image,
      this.category,
      this.description});

  String? title;
  int? price;
  String video;
  String image;
  num? rating;
  String? category;
  String? description;

  factory MainService.fromJson(Map<String, dynamic> json) => MainService(
      title: json["title"],
      price: json["price"],
      video: json["video"],
      image: json["image"],
      category: json["category"],
      description: json["description"]);

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "video": video,
        "image": image,
        "category": category,
        "description": description
      };
}
