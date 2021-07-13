class OnBoarding {
  int id;
  String image;
  String title;
  String subtitle;

  OnBoarding({
    this.id,
    this.image,
    this.title,
    this.subtitle
  });

  factory OnBoarding.fromJson(Map<String, dynamic> json) => OnBoarding(
    id: json['id'],
    image: json['image'],
    title: json['title'],
    subtitle: json['subtitle'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "subtitile": subtitle,
  };
}