class Product {
  int id;
  String productName;
  String productImage;
  String productPrice;

  Product(
    this.id,
    this.productName,
    this.productImage,
    this.productPrice,
  );

  Product.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      productName = json['productName'],
      productImage = json['productImage'],
      productPrice = json['productPrice'];
}