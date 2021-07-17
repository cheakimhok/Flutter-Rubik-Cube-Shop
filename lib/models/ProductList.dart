import 'package:rubik_cube_shop/models/ProductType.dart';
import 'package:rubik_cube_shop/models/Product.dart';

class ProductList {
  List<ProductType> productType;
  List<Product> twoByTwo;
  List<Product> threeByThree;
  List<Product> fourthByFourth;
  List<Product> others;
  List<Product> accessories;

  ProductList(
    this.productType,
    this.twoByTwo,
    this.threeByThree,
    this.fourthByFourth,
    this.others,
    this.accessories,
  );

  ProductList.fromJson(Map<String, dynamic> json) {
    List<dynamic> productTypeData = json['productType'];
    productType = productTypeData.map((e) => ProductType.fromJson(e)).toList();

    List<dynamic> twoByTwoData = json['twoByTwo'];
    twoByTwo = twoByTwoData.map((e) => Product.fromJson(e)).toList();

    List<dynamic> threeByThreeData = json['threeByThree'];
    threeByThree = threeByThreeData.map((e) => Product.fromJson(e)).toList();

    List<dynamic> fourthByFourthData = json['fourthByFourth'];
    fourthByFourth = fourthByFourthData.map((e) => Product.fromJson(e)).toList();

    List<dynamic> othersData = json['others'];
    others = othersData.map((e) => Product.fromJson(e)).toList();

    List<dynamic> accessoriesData = json['accessories'];
    accessories = accessoriesData.map((e) => Product.fromJson(e)).toList();    
  }
}