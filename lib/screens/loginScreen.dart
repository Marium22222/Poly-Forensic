import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:poly_forensic/screens/ResultsScreen.dart';
import 'package:poly_forensic/screens/SignUp.dart';
import 'package:poly_forensic/screens/dashboard.dart';
import 'package:poly_forensic/screens/home.dart';

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
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
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
                          color: Colors.red,
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/LoginBg.png',
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Positioned(
                          top: constraints.maxHeight * 0.13,
                          child: Container(
                            child: Image.asset('assets/images/doctor.png'),
                            height: constraints.maxHeight * 0.34,
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
                  signinSignupButton(context, true, () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                        .then((value) {
                      globals.login = _emailTextController.text;
                      print(globals.login);
                      if (globals.login == 'admin1@gmail.com') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlogsAdminScreen()));
                      } else {
                        globals.login = _emailTextController.text;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()));
                      }
                    }).onError((error, stackTrace) {
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