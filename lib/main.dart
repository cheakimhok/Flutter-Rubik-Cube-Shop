import 'package:flutter/material.dart';
import 'package:rubik_cube_shop/welcome.dart';

void main() {
  return runApp(MaterialApp (
    routes: {
      'intro': (context) => WelcomeScreen(),
    },
    home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),() {
      setState(() {
        // Here you can write your code for open new view
        Navigator.pushNamed(context, 'intro');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack (
        fit: StackFit.expand,
        children: [
          Container (
            decoration: BoxDecoration (
            color: Color.fromRGBO(0, 161, 233, 1),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  ClipOval (
                    child: Image.asset(
                      'assets/images/testing.png', 
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
          )
        ],
      ),
    );
  }
}