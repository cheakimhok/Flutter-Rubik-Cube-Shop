class Notifications {
  int id;
  String title;
  String subtitle;

  Notifications({
    this.id,
    this.title,
    this.subtitle,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications( 
    id: json['id'],
    title: json['title'],
    subtitle: json['subtitle'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
  };
}
