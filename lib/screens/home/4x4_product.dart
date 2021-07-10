import 'package:rubik_cube_shop/screens/detail/product_detail.dart';
import 'package:flutter/material.dart';

class FourByFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              children: <Widget> [
                 _buildCard('Gan 460 M', '\$55.99', 'assets/images/4x4.jpeg', context),
                  _buildCard('Gan 460 M Pro', '\$58.99', 'assets/images/4x4(1).jpeg', context),
              ],
            ) 
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, context) {
    return Padding (
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute (
              builder: (context) => ProductDetail(
                assetPath: imgPath,
                productprice: price,
                productname: name
              )
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
              Hero  (
                tag: imgPath,
                child: Container (
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration (
                    image: DecorationImage (
                      image: AssetImage (imgPath),
                      fit: BoxFit.contain,
                    )
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                price,
                style: TextStyle(
                color: Color.fromRGBO(0, 161, 233, 1),
                fontWeight: FontWeight.w600,
                fontSize: 17)
              ),
              SizedBox(height: 8),
              Text(
                name,
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
                child: Row (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon (
                      Icons.shopping_basket,
                      color: Color.fromRGBO(0, 161, 233, 1),
                      size: 18,
                    ),
                    Text(
                      'Add to cart',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 161, 233, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )
                    )
                  ],
                ),
              )
            ]
          )
        ),
      ),
    );
  }
}