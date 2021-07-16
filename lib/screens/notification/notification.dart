import 'package:rubik_cube_shop/models/notifications.dart';
import 'package:rubik_cube_shop/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:rubik_cube_shop/bottom_bar.dart';
import 'package:rubik_cube_shop/size_config.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  List<Notifications> fetchNotification = [];
  bool _isLoading = true;
  bool _isError = false;

  Future<Notification> fetchNotificationData() async {
    final url = Uri.parse('http://localhost:3000/notification');
    final response = await get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        for (Map i in data) {
          fetchNotification.add(Notifications.fromJson(i));
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
    fetchNotificationData();
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
          'Notification',
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

      body: _buildListView(context),

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

  ListView _buildListView(BuildContext context) {
      return ListView.builder(
        itemCount: fetchNotification.length,
        itemBuilder: (context, index) {
          return Card(  
            margin: EdgeInsets.only(top: 25, left: 15, right: 15),       
            child: ListTile(
              title: Text(
                '${fetchNotification[index].title}', 
                style: TextStyle(fontSize: 18)
              ),
              subtitle: Text(
                '${fetchNotification[index].subtitle}',
              ),
              leading: Icon(
                Icons.notifications_outlined,
                size: 32, 
                color: Color.fromRGBO(0, 161, 233, 1),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color.fromRGBO(0, 161, 233, 1),
              ),
            ),
          );
        }
      );  
  }
}