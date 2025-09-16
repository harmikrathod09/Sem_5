class AnimationModel{
  String image;
  String title;
  String subtitle;

  AnimationModel({required this.image, required this.title, required this.subtitle});

  factory AnimationModel.fromJson(Map<String, dynamic> json) {
    return AnimationModel(
      image: json['image'],
      title: json['title'],
      subtitle: json['subtitle'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "image": image,
      "title": title,
      "subtitle": subtitle,
    };
  }
}