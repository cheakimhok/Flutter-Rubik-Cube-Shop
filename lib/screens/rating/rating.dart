import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rubik_cube_shop/bottom_bar.dart';
import 'package:rubik_cube_shop/size.dart';

class RatingProduct extends StatefulWidget {
  @override
  _RatingProductState createState() => _RatingProductState();
}

class _RatingProductState extends State<RatingProduct> {
  double rating = 0;
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
          'Rating',
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
              onPressed: () {
              },
            ),
          )
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 45),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: <Widget> [
                Container(
                  height: 120,
                  width: 120,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage(
                        'assets/images/user.png'
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Text(
                  'Cheakimhok Mao',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54
                  ),
                ),
                SizedBox(height: 60,),
                Text(
                  'How was this product?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey
                  ),
                ),
                SizedBox(height: 30,),
                RatingBar.builder(
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 40,
                  itemPadding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(1)
                  ),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Color.fromRGBO(253, 204, 13, 1),
                  ),
                  onRatingUpdate: (value) {
                    rating = value;
                  },
                ),
                SizedBox(height: 180),
                Center(
                  child: Container(
                    width: 380,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Color.fromRGBO(0, 161, 233, 1)
                    ),
                    child: Center(
                      child: Text('Submit',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,   
                        ),
                      )
                    )
                  )
                )
              ],
            ),
          ),
        ),
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