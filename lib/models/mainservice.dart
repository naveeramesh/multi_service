class MainService {
  MainService({
    this.title,
    this.price,
    required this.image,
    this.category,
  });

  String? title;
  int? price;
  String image;
  String? category;

  MainService.fromJson(Map<String, dynamic> json)
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
