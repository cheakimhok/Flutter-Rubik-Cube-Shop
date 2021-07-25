import 'dart:convert';
import 'package:http/http.dart';
import 'package:rubik_cube_shop/models/ProductList.dart';
import 'package:rubik_cube_shop/models/Rating.dart';

class DataProvider {
  static Future<ProductList> fetchProductListData() async {
    final url = Uri.parse('https://cheakimhok-rubik-cube-shop-api.herokuapp.com/products');
    final response = await get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseObject = jsonDecode(response.body);
      return ProductList.fromJson(responseObject);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<Rating>> fetchRatingData(int productId) async {
    final url = Uri.parse('https://cheakimhok-rubik-cube-shop-api.herokuapp.com/rating?productId=$productId');
    final response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> responseList = jsonDecode(response.body);
      return responseList.map((e) {
        Map<String, dynamic> ratingObject = e;
        return Rating.fromMap(ratingObject);
      }).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<Rating> addRating(int productId, String reviewer, double rating) async {
    final url = Uri.parse('https://cheakimhok-rubik-cube-shop-api.herokuapp.com/rating');
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final newRating = Rating(0, productId, reviewer, rating, DateTime.now().millisecondsSinceEpoch);
    final response = await post(url, headers: headers, body: newRating.toJson());

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return newRating;
    } else {
      throw Exception('Failed to load data');
    }
  }
}