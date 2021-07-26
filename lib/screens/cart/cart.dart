import 'package:rubik_cube_shop/models/Cart.dart';
import 'package:rubik_cube_shop/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:rubik_cube_shop/bottom_bar.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:rubik_cube_shop/size.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  List<Cart> fetchCart = [];
  bool _isLoading = true;
  bool _isError = false;

  Future<Cart> fetchCartData() async {
    final url = Uri.parse('https://cheakimhok-rubik-cube-shop-api.herokuapp.com/cart');
    final response = await get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        for (Map i in data) {
          fetchCart.add(Cart.fromJson(i));
        }
        _isLoading = false;
      });
    } else {
      _isError = true;
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCartData();
  }

  @override
  Widget build(BuildContext context) {

    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
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
              color: Colors.grey,
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
          'Cart',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget> [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Color.fromRGBO(255, 255, 255, 1),
                size: 35,
              ), 
              onPressed: () {},
            ),
          )
        ],
      ),

      body: cartBody(),

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

  Widget cartBody () {
    return Column(
      children: <Widget> [
        Expanded(
          child: ListView(
            children: List.generate(fetchCart.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: 25, left: 25, bottom: 10, top: 25),
                  child: Row(
                    children: <Widget> [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          // color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              '${fetchCart[index].productImage}', 
                            ), 
                            fit: BoxFit.contain,
                          ) 
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Row(
                            children: <Widget> [
                              SizedBox(width: 20),
                              Text(
                                '${fetchCart[index].productName}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 75),
                              Icon(
                                Icons.close,
                                size: 28,
                              )
                            ],
                          ),
                          Row(
                            children: <Widget> [
                              SizedBox(height: 50),
                              SizedBox(width: 20),
                              Text(
                                '${fetchCart[index].productPrice}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 30),
                              Text(
                                'x${fetchCart[index].productAmount}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500
                                )
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              }
            ),
          )
        ),
        totalPrice()
      ]
    );
  }

  Widget totalPrice() {
    return Column(
      children: <Widget> [
        Padding(
          padding: EdgeInsets.only(top: 15, left:25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: <Widget> [
              Text(
                "Total",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text(
                "\$16.99",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 30),
        Center(
          child: Container(
            width: 380,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Color.fromRGBO(0, 161, 233, 1)
            ),
            child: Center(
              child: Text('Checkout',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,   
                ),
              )
            )
          )
        ),
        SizedBox(height: 55),
      ]
    );
  }
}

