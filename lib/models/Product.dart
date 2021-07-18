class Product {
  int id;
  String productName;
  String productImage;
  String productPrice;
  String productDetail;

  Product(
    this.id,
    this.productName,
    this.productImage,
    this.productPrice,
    this.productDetail,
  );

  Product.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      productName = json['productName'],
      productImage = json['productImage'],
      productPrice = json['productPrice'],
      productDetail = json['productDetail'];
}