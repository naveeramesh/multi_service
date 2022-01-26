import 'dart:convert';

Service serviceFromJson(String str) => Service.fromJson(json.decode(str));

class Service {
  Service({
    this.title,
    required this.image,
  });

  String? title;

  String image;

  Service.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        image = json["image"];
}
