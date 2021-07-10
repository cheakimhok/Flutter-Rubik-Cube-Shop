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
            // child: IconButton(
            //   icon: Icon(
            //     Icons.notifications_outlined,
            //     color: Color.fromRGBO(255, 255, 255, 1),
            //     size: 35,
            //   ), 
            //   onPressed: () {},
            // ),
          )
        ],
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