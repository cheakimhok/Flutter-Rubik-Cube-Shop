import 'package:flutter/material.dart';
import 'package:rubik_cube_shop/size.dart';
import 'package:rubik_cube_shop/screens/onboarding/onboarding.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: WelcomeComponent(),
      backgroundColor: Colors.white,
    );
  }
}

class WelcomeComponent extends StatefulWidget {
  @override
  _WelcomeComponentState createState() => _WelcomeComponentState();
}

class _WelcomeComponentState extends State<WelcomeComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea (
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget> [
            Expanded(
              flex: 6,
              child: Column(
                children: <Widget> [
                  Spacer(flex: 3),
                  Text(
                    "WELCOME",
                    style: TextStyle (
                      fontSize: getProportionateScreenWidth(45),
                      color: Color.fromRGBO(0, 161, 233, 1),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(flex: 1),
                  Image.asset(
                    "assets/images/welcome.png",
                    height: getProportionateScreenHeight(350),
                    width: getProportionateScreenWidth(230),
                  ),
                  Spacer(flex: 1),
                  Text(
                    "Enjoy your shopping time!",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ]
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(105)
                ),
                child: Column(
                  children: <Widget> [
                    Spacer(),
                    SizedBox(
                      width: getProportionateScreenWidth(250),
                      height: getProportionateScreenHeight(55),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                        color: Color.fromRGBO(0, 161, 233, 1),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Boarding()),
                          )
                        }, 
                        child: Text(
                          'GET STARTED',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionateScreenWidth(16),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ), 
    );
  }
}