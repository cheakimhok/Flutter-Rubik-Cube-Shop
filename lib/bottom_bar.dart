import 'package:rubik_cube_shop/screens/cart/cart.dart';
import 'package:rubik_cube_shop/screens/home/home.dart';
// import 'package:rubik_cube_shop/notification.dart';
import 'package:rubik_cube_shop/screens/profile/profile.dart';
import 'package:flutter/material.dart';
// import 'package:animations/animations.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // PageTransitionSwitcher(
      //   transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>  
      //   FadeThroughTransition(
      //     animation: primaryAnimation,
      //     secondaryAnimation: secondaryAnimation,
      //     child: child
      //   ),
      //   child: screenList[_screenIndex],
      // ),
      shape: CircularNotchedRectangle(),
      // notchMargin: 6,
      // color: Colors.transparent,
      // elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 60,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(30),
        //     topRight: Radius.circular(30),
        //   ),
        //   color: Colors.white,
        // ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 25,
              width: MediaQuery.of(context).size.width /2 - 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.home_outlined, 
                      color: Color(0xFF676E79),
                      size: 33,
                    ), 
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person_outlined, 
                      color: Color(0xFF676E79),
                      size: 33,
                    ), 
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen()),
                      );
                    },
                  )
                ],
              )
            ),
            Container(
              height: 25,
              width: MediaQuery.of(context).size.width /2 - 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart_outlined, color: Color(0xFF676E79),
                      size: 30,
                    ), 
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartScreen()),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.notifications_outlined, 
                      color: Color(0xFF676E79),
                      size: 32,
                    ), 
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => NotificationScreen()),
                      // );
                    },
                  ),
                ],
              )
            ),
          ]
        )
      )
    );
  }
}