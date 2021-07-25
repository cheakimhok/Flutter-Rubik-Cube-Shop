import 'dart:convert';
import 'package:intl/intl.dart';

class Rating {
  int id;
  int productId;
  String reviewer;
  double rating;
  int datetime;

  Rating(
    this.id,
    this.productId,
    this.reviewer,
    this.rating,
    this.datetime,
  );

  String formattedDate() {
    final ratingDate = DateTime.fromMillisecondsSinceEpoch(datetime);
    final formatter = DateFormat.yMd();
    return formatter.format(ratingDate);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'reviewer': reviewer,
      'rating': rating,
      'datetime': datetime,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      map['id'],
      map['productId'],
      map['reviewer'],
      double.parse(map['rating'].toString()),
      map['datetime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source));
}