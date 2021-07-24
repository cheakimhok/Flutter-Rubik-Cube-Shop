class Cart {
  int id;
  String productName;
  String productImage;
  String productPrice;
  int productAmount;

  Cart({
    this.id,
    this.productName,
    this.productImage,
    this.productPrice,
    this.productAmount,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart( 
    id: json['id'],
    productName : json['productName'],
    productImage : json['productImage'],
    productPrice : json['productPrice'],
    productAmount : json['productAmount']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productName": productName,
    "productImage": productImage,
    "productPrice": productPrice,
    "productAmount": productAmount,
  };
}