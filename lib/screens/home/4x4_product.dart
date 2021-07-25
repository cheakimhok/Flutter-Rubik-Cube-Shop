import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rubik_cube_shop/models/Product.dart';
import 'package:rubik_cube_shop/models/ProductList.dart';
import 'package:rubik_cube_shop/provider.dart';
import 'package:rubik_cube_shop/screens/detail/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:rubik_cube_shop/size.dart';

class FourByFour extends StatefulWidget {
  @override
  _FourByFourState createState() => _FourByFourState();
}

class _FourByFourState extends State<FourByFour> {
  ProductList _productList;
  bool _isLoading = true;
  bool _isError = false;

  @override
  void initState() {
    super.initState();

    DataProvider.fetchProductListData().then((value) {
      setState(() {
        _productList = value;
        _isLoading = false;
      });
    }).catchError((error) {
      print('Error: $error');
      setState(() {
        _isError = true;
        _isLoading = false;
      });
    }); 
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Padding(
        padding: EdgeInsets.only(bottom: 300),
        child: Center(
          child: CircularProgressIndicator()
        )
      );
    }
    
    if (_isError) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(30)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: getProportionateScreenWidth(45),
              color: Colors.grey
            ),
            SizedBox(height: getProportionateScreenWidth(10)),
            Text(
              'Error while loading data from the server. Please try again later.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: getProportionateScreenWidth(14)
              ),
            )
          ],
        ),
      );
    }

    final products = _productList.fourthByFourth;
    
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget> [
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.only(top: 15,right: 15, left: 10),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              childAspectRatio: 0.72,
              children: products.map<Widget>((e) {
                return _buildCard(e);
              }).toList()
            ) 
          ),
        ],
      ),
    );
  }

  Widget _buildCard(Product product) {
    return Padding (
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute (
              builder: (context) => ProductDetail(product)
            )
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5)
            ],
            color: Colors.white
          ),
          child: Column(
            children: [
              SizedBox(height: 15),
              Hero(
                tag: product.productImage,
                child: Container (
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration (
                    image: DecorationImage (
                      image: NetworkImage (product.productImage),
                      fit: BoxFit.contain,
                    )
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                '\$${product.productPrice}',
                style: TextStyle(
                color: Color.fromRGBO(0, 161, 233, 1),
                fontWeight: FontWeight.w600,
                fontSize: 17)
              ),
              SizedBox(height: 8),
              Text(
                product.productName,
                style: TextStyle(
                color: Color(0xFF575E67),
                fontSize: 15)
              ),
              SizedBox(height: 5),
              Padding (
                padding: EdgeInsets.all(8),
                child: Container (
                  color: Color(0xFFEBEBEB),
                  height: 2,
                ),
              ),
              SizedBox(height: 5),
              Padding (
                padding: EdgeInsets.only(left: 5, right: 5),
                child: RatingBarIndicator (
                  rating: 4.5,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemSize: 22,
                  itemPadding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(1)
                  ),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Color.fromRGBO(253, 204, 13, 1),
                  ),
                ),
              )
            ]
          )
        ),
      ),
    );
  }
}