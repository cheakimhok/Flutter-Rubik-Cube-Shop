import 'package:rubik_cube_shop/signin.dart';
import 'package:flutter/material.dart';
import 'package:rubik_cube_shop/size_config.dart';

class Boarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BoardingComponent(),
    );
  }
}

class BoardingComponent extends StatefulWidget {
  @override
  _BoardingComponentState createState() => _BoardingComponentState();
}

class _BoardingComponentState extends State<BoardingComponent> {
  int currentPage = 0;
  List<Map<String, String>> boardingData = [
    {
      "text": "SELECT PRODUCTS",
      "image": "assets/images/product.png"
    },
    {
      "text": "ADD TO CART",
      "image": "assets/images/cart.png"
    },
    {
      "text": "EASY PAYMENT",
      "image": "assets/images/confirm.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: PageView.builder(
                onPageChanged: (value) {
                   setState(() {
                     currentPage = value;
                   });
                },
                itemCount: boardingData.length,
                itemBuilder: (context, index) => BoardingContent(
                image: boardingData[index]["image"],
                text: boardingData[index]["text"],
                ),
              )
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(boardingData.length, (index) => buildContainer(index: index),
                      ),
                    ),
                    Spacer(flex: 4), 
                    SizedBox(
                      width: double.infinity,
                      height: getProportionateScreenHeight(56),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        color: Color.fromRGBO(0, 161, 233, 1),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignIn()),
                          )
                        }, 
                        child: Text("Continue",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            color: Colors.white, 
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
 
  Container buildContainer({int index}) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20:6,
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 161, 233, 1),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class BoardingContent extends StatelessWidget {
  const BoardingContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
        Spacer(),
        Text(text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(26),
            color: Color.fromRGBO(0, 161, 233, 1),
            fontWeight: FontWeight.w700,
          )
        ),
        Text("\n""Lorem ipsum dolor sit amet",
        style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
