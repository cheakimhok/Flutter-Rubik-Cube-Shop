class ProductType {
  int id;
  String productType;

  ProductType(
    this.id,
    this.productType,
  );

  ProductType.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      productType = json['productType'];
}