import 'package:rubik_cube_shop/2x2_product.dart';
import 'package:rubik_cube_shop/3x3_product.dart';
import 'package:rubik_cube_shop/4x4_product.dart';
import 'package:rubik_cube_shop/accessories_product.dart';
import 'package:rubik_cube_shop/others_product.dart';
import 'package:flutter/material.dart';
import 'package:rubik_cube_shop/bottom_bar.dart';

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }
  
  @override
  Widget build(BuildContext context) {
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
                child: Text('\tOthers',
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
