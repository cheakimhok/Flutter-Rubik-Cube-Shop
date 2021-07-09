import 'package:rubik_cube_shop/home.dart';
import 'package:flutter/material.dart';
import 'package:rubik_cube_shop/bottom_bar.dart';

class ProductDetail extends StatelessWidget {
  final assetPath, productprice, productname;

  ProductDetail({this.assetPath, this.productprice, this.productname});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(0, 161, 233, 1),
        elevation: 0.0,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Color.fromRGBO(255, 255, 255, 1),
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          'Detail',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: ListView(
        children: [
            SizedBox(height: 15.0),
            Hero(
              tag: assetPath,
              child: Image.asset(assetPath,
              height: 280,
              width: 280,
              fit: BoxFit.contain
              )
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                productprice,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 161, 233, 1)
                )
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(productname,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontSize: 24)),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                textAlign: TextAlign.center,
                style: TextStyle(
                      fontSize: 19,
                      color: Color(0xFFB4B8B9))
                ),
              ),
            ),
            SizedBox(height: 60),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color.fromRGBO(0, 161, 233, 1)
                ),
                child: Center(
                  child: Text('Add to cart',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,   
                    ),
                  )
                )
              )
            )
        ]
      ),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton (
          onPressed: null,
          backgroundColor: Color.fromRGBO(0, 161, 233, 1),
          child: Image.asset(
            'assets/images/testing.png',
            height: 50,
            width: 50,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}