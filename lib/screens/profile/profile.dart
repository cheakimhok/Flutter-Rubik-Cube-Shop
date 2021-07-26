import 'package:firebase_auth/firebase_auth.dart';
import 'package:rubik_cube_shop/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:rubik_cube_shop/bottom_bar.dart';
import 'package:rubik_cube_shop/screens/sign_in/sign_in.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final auth = FirebaseAuth.instance;
  
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
          'Profile',
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

      body: SafeArea(
        child: SingleChildScrollView(
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
                        Positioned(
                          right: 5,
                          bottom: 1,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(0, 161, 233, 1),
                            ),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                  ProfileCard(
                    text: "Cheakimhok Mao",
                    icon: Icons.person_outline,
                    edit: Icons.edit_outlined,
                    press: () {},
                  ),
                  ProfileCard(
                    text: "cmao1@paragoniu.edu.kh",
                    icon: Icons.email_outlined,
                    edit: Icons.edit_outlined,
                    press: () {},
                  ),
                  ProfileCard(
                    text: "+855 23 880 880",
                    icon: Icons.call_outlined,
                    edit: Icons.edit_outlined,
                    press: () {},
                  ),
                  ProfileCard(
                    text: "Phnom Penh",
                    icon: Icons.place_outlined,
                    edit: Icons.edit_outlined,
                    press: () {},
                  ),
                  ProfileCard(
                    text: "Log Out",
                    icon: Icons.logout_outlined, 
                    edit: null,
                    press: () {
                      auth.signOut();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
                    },  
                  ),
                ],
              ),
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

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.edit,
    @required this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final IconData edit;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFFF5F6F9),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              size: 28,
              color: Color.fromRGBO(0, 161, 233, 1),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey
                ),
              ),
            ),
            Icon(
              edit,
              color: Colors.grey
            ),
          ],
        ),
      ),
    );
  }
}