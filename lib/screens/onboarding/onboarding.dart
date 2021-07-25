import 'package:rubik_cube_shop/screens/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:rubik_cube_shop/size.dart';
import 'package:rubik_cube_shop/models/Onboarding.dart';

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
  // List<Map<String, String>> boardingData = [
  //   {
  //     "text": "SELECT PRODUCTS",
  //     "image": "assets/images/product.png"
  //   },
  //   {
  //     "text": "ADD TO CART",
  //     "image": "assets/images/cart.png"
  //   },
  //   {
  //     "text": "EASY PAYMENT",
  //     "image": "assets/images/confirm.png"
  //   },
  // ];
  List<OnBoarding> fetchOnboarding = [];
  bool _isLoading = true;
  bool _isError = false;

  Future<OnBoarding> fetchOnboardingData() async {
    final url = Uri.parse('https://cheakimhok-rubik-cube-shop-api.herokuapp.com/onBoarding');
    final response = await get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        for (Map i in data) {
          fetchOnboarding.add(OnBoarding.fromJson(i));
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
    fetchOnboardingData();
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
                itemCount: fetchOnboarding.length,
                itemBuilder: (context, index) => BoardingContent(
                  image: fetchOnboarding[index].image,
                  title: fetchOnboarding[index].title,
                  subtitle: fetchOnboarding[index].subtitle,
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
                      children: List.generate(fetchOnboarding.length, (index) => buildContainer(index: index),
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
    this.title,
    this.image,
    this.subtitle,
  }) : super(key: key);

  final String title, image, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Image.network(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
        Spacer(),
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(26),
            color: Color.fromRGBO(0, 161, 233, 1),
            fontWeight: FontWeight.w700,
          )
        ),
        SizedBox(height: 15),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
