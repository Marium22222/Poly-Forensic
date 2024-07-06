import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:poly_forensic/Screens/marium%20screens/AdminDashboard.dart';
import 'package:poly_forensic/screens/ResultsScreen.dart';
import 'package:poly_forensic/screens/SignUp.dart';
import 'package:poly_forensic/screens/dashboard.dart';
import 'package:poly_forensic/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../globals.dart';
import '../reusable_widgets/reusable_widgets.dart';
import 'package:poly_forensic/globals.dart' as globals;

import 'BlogsAdmin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailTextController = new TextEditingController();
  TextEditingController _passwordTextController = new TextEditingController();
  bool signed=true;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: constraints.maxHeight * 0.45,
                      ),
                      Container(
                        height: constraints.maxHeight * 0.4,
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/loginBack.png',
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                      // Positioned(
                      //     top: constraints.maxHeight * 0.15,
                      //     child: Container(
                      //       child: Image.asset('assets/images/doctor.png'),
                      //       height: constraints.maxHeight * 0.3,
                      //     )),
                      Positioned(
                          top: constraints.maxHeight * 0.12,
                          left: constraints.maxWidth*0.1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text("LOGIN",
                                  style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0,
                                    shadows: [
                                      Shadow(
                                        color: Colors.white,
                                        offset: Offset(1,2),
                                        blurRadius: 2
                                      )
                                    ]

                                  ),)
                              ),
                              Text("Please login to your account.",style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  // color: Colors.grey[600],
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0

                              ),)
                            ],
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontFamily: "Times New Roman"),
                        ),
                        TextField(
                          controller: _emailTextController,
                          decoration:
                          InputDecoration(border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontFamily: "Times New Roman"),
                        ),

                        TextField(
                          obscureText: true,
                          controller: _passwordTextController,
                          decoration:
                          InputDecoration(
                            border: OutlineInputBorder(),

                          ),
                        ),
                      ],
                    ),
                  ),
                  Text("Invalid Credentials",
                      style:TextStyle(
                       color:signed==true?Colors.white:Colors.red,
                        fontWeight: FontWeight.bold
                  )),
                  signinSignupButton(
                      context, true, () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                        .then((value) async{
                      globals.login = _emailTextController.text;
                      print(globals.login);
                      if (globals.login == 'admin1@gmail.com') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminDashboard()));
                      } else {
                        globals.login = _emailTextController.text;
                        SharedPreferences pref =await SharedPreferences.getInstance();
                        pref.setString("email", "${_emailTextController.text}");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()));
                        setState(() {
                          signed=true;
                        });
                      }
                    }).onError((error, stackTrace) {
                      setState(() {
                        signed=false;
                      });
                      print("Error ${error.toString()}");
                    });
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        },
                        child: const Text(
                          ' Sign Up',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}