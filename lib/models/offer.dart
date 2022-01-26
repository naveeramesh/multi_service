class Offer {
  Offer({
    required this.image,
  });

  String image;

  Offer.fromJson(Map<String, dynamic> json) : image = json["image"];

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}
