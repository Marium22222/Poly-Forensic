import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:poly_forensic/screens/ResultsScreen.dart';
import 'package:poly_forensic/screens/SignUp.dart';

import '../reusable_widgets/reusable_widgets.dart';
import 'package:poly_forensic/globals.dart' as globals;

import 'BlogsAdmin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailTextController=new TextEditingController();
  TextEditingController _passwordTextController=new TextEditingController();
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
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
                          controller: _passwordTextController,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ],
                    ),
                  ),
                  signinSignupButton(context, true, () {
                    FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailTextController.text, password: _passwordTextController.text).then((value) {

                      globals.login=_emailTextController.text;
                      print(globals.login);
                      if(globals.login=='admin1@gmail.com'){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => BlogsAdminScreen()));
                      }
                      else{
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ResultsScreen()));
                      }
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  }),
                  // signUpOption()
                  // SizedBox(
                  //   width:150,
                  //   height: 50,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //
                  //
                  //     },
                  //     child: Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  //     style: ButtonStyle(backgroundColor:MaterialStatePropertyAll<Color>(Colors.black)
                  //
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Row signUpOption() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       const Text("Don't have an account?",
  //         style: TextStyle(color: Colors.black),
  //       ),
  //       GestureDetector(
  //         onTap: () {
  //           Navigator.push(context,
  //               MaterialPageRoute(builder: (context) => SignUpScreen()));
  //         },
  //         child: const Text(
  //           ' Sign Up',
  //           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //         ),
  //       )
  //     ],
  //   );
  // }
}
