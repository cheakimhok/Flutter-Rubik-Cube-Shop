import 'dart:convert';
import 'package:http/http.dart';
import 'package:rubik_cube_shop/models/ProductList.dart';

class DataProvider {
  static Future<ProductList> fetchProductListData() async {
    final url = Uri.parse('http://localhost:3000/products');
    final response = await get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseObject = jsonDecode(response.body);
      return ProductList.fromJson(responseObject);
    } else {
      throw Exception('Failed to load data');
    }
  }
}