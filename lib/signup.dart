import 'package:rubik_cube_shop/home.dart';
import 'package:rubik_cube_shop/signin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Column(
          children: <Widget> [
            Container(
              height: MediaQuery.of(context).size.height*0.4,
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 161, 233, 1),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))
              ),
              child: Center(
                child: Image.asset('assets/images/testing.png',
                width: 170,
                height: 170,
                fit: BoxFit.cover,
                )
              ),     
            ),

            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Column(
                  children: <Widget> [
                    _textInput(hint:"Username", icon:Icons.person),
                    _textInput(hint:"Email", icon:Icons.email),
                    _textInput(hint:"Password", icon:Icons.vpn_key),
                    Container(
                      margin: EdgeInsets.only(top:30, bottom: 70),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        color: Color.fromRGBO(0, 161, 233, 1),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          )
                        },
                        child: Text("Sign Up",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white, 
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "Already have an account yet?", style: TextStyle(fontSize: 16,color: Colors.grey)),
                  TextSpan(text: "  Sign In", 
                    style: TextStyle(
                      fontSize: 16, color: Color.fromRGBO(0, 161, 233, 1),
                    ),
                    recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    }
                  ),
                ]
            )),
            
          ]
        ),
      ),
    );
  }

  Widget _textInput({controller,hint,icon}) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey,
            width: 2
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey,
        //     blurRadius: 2.0,
        //     offset: Offset(0,2),
        //   )
        // ],
        color: Colors.white,
      ),
      padding: EdgeInsets.only(top: 5, bottom: 5 ,left: 10),
      child: TextFormField(
        // obscureText: true,
        controller: controller,
        decoration: InputDecoration(
          border:  InputBorder.none,
          hintText:  hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}