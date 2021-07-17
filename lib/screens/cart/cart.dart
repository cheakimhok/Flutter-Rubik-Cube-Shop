import 'package:rubik_cube_shop/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:rubik_cube_shop/bottom_bar.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
}

Widget cartBody () {
  return ListView(
    children: <Widget> [
      Column(children: List.generate(3, (index) {
        return Padding(
          padding: EdgeInsets.only(right: 25, left: 25, bottom: 10, top: 15),
          child: Row(
            children: <Widget> [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  // color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("assets/images/3x3.jpeg"),
                    fit: BoxFit.contain,
                  ) 
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Row(
                      children: <Widget> [
                        SizedBox(width: 20),
                        Text(
                          "Gan 356 RS",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 90),
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
                          "\$16.99",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 30),
                        Text(
                          "x1",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500
                          )
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),),
      SizedBox(height: 60), 
      Padding(
        padding: EdgeInsets.only(left:25, right: 25),
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
      )
    ]
  );
}