import 'package:rubik_cube_shop/screens/forgot_password/forgot_password.dart';
import 'package:rubik_cube_shop/screens/home/home.dart';
import 'package:rubik_cube_shop/screens/sign_up/sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        key: _formKey,
        margin: EdgeInsets.only(bottom: 50),
        child: SingleChildScrollView(
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
                
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Column(
                  children: <Widget> [
                    _textInput(hint:"Email", icon:Icons.email),
                    _passwordInput(hint:"Password", icon:Icons.vpn_key),
                    SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Forgot Password", 
                            style: TextStyle(
                              fontSize: 16, color: Color.fromRGBO(0, 161, 233, 1),
                            ),
                            recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ForgotPassword()),
                              );
                            }
                          )
                        ]
                      )
                    ),
                    SizedBox(height: 70,),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        color: Color.fromRGBO(0, 161, 233, 1),
                        onPressed: () async {
                          try {
                            FirebaseUser user =
                              (await FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text,
                              )).user;
                            if (user != null) {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
                            }
                          } catch (e) {
                            print(e);
                            _emailController.text = "";
                            _passwordController.text = "";
                          }
                        },
                        child: Text("Sign In",
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
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't have an account yet?", style: TextStyle(fontSize: 16,color: Colors.grey)
                    ),
                    TextSpan(
                      text: "  Sign Up", 
                      style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(0, 161, 233, 1),
                      ),
                      recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      }
                    ),
                  ]
              )),
              
            ]
          ),
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
        color: Colors.white,
      ),
      padding: EdgeInsets.only(top: 5, bottom: 5 ,left: 10),
      child: TextFormField(
        controller: _emailController,
        decoration: InputDecoration(
          border:  InputBorder.none,
          hintText:  hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }

  Widget _passwordInput({controller,hint,icon}) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey,
            width: 2
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(top: 5, bottom: 5 ,left: 10),
      child: TextFormField(
        obscureText: true,
        controller: _passwordController,
        decoration: InputDecoration(
          border:  InputBorder.none,
          hintText:  hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}