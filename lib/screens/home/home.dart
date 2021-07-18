import 'package:rubik_cube_shop/screens/home/2x2_product.dart';
import 'package:rubik_cube_shop/screens/home/3x3_product.dart';
import 'package:rubik_cube_shop/screens/home/4x4_product.dart';
import 'package:rubik_cube_shop/screens/home/accessories_product.dart';
import 'package:rubik_cube_shop/screens/home/others_product.dart';
import 'package:flutter/material.dart';
import 'package:rubik_cube_shop/bottom_bar.dart';
import 'package:rubik_cube_shop/size.dart';
import 'package:rubik_cube_shop/provider.dart';
import 'package:rubik_cube_shop/models/ProductList.dart';
import 'package:rubik_cube_shop/models/ProductType.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with SingleTickerProviderStateMixin {
  TabController _tabController;
  ProductList _productList;
  bool _isLoading = true;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);

    DataProvider.fetchProductListData().then((value) {
      setState(() {
        _productList = value;
        _isLoading = false;
      });
    }).catchError((error) {
      print('Error: $error');
      setState(() {
        _isError = true;
        _isLoading = false;
      });
    }); 
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
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color.fromRGBO(0, 161, 233, 1),
        elevation: 0.0,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          // child: IconButton(
          //   icon: Icon(
          //     Icons.menu_outlined,
          //     color: Color.fromRGBO(255, 255, 255, 1),
          //     size: 35,
          //   ),
          //   onPressed: () {},
          // ),
        ),
        title: Text(
          'Gan Cube',
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
      body: ListView(
        padding: EdgeInsets.only(left: 10),
        children: <Widget> [
          SizedBox(height: 10),
          TabBar(
            controller: _tabController,
            indicatorColor: Color.fromRGBO(0, 161, 233, 1),
            labelColor: Color.fromRGBO(0, 161, 233, 1),
            labelPadding: EdgeInsets.fromLTRB(25, 5, 25, 5),
            isScrollable: true,
            unselectedLabelColor: Color.fromRGBO(0, 0, 0, 1),
            tabs: [
              Tab(
                child: Text('\t2 x 2',
                  style: TextStyle(
                    fontSize: 24,
                  )),
              ),
              Tab(
                child: Text('\t3 x 3',
                  style: TextStyle(
                    fontSize: 24,
                  )),
              ),
              Tab(
                child: Text('\t4 x 4',
                  style: TextStyle(
                    fontSize: 24,
                  )),
              ),
              Tab(
                child: Text('\tOther',
                  style: TextStyle(
                    fontSize: 24,
                  )),
              ),
              Tab(
                child: Text('\tAccessories',
                  style: TextStyle(
                    fontSize: 24,
                  )),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height - 50.0,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: [
                TwoByTwo(),
                ThreeByThree(),
                FourByFour(),
                OthersProduct(),
                AccessoriesProduct(),
              ]
            )
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
