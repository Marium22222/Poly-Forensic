import 'package:flutter/material.dart';
import 'package:poly_forensic/Screens/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 400,
          height: 400,
          child: Image(
              image: AssetImage(
            "assets/images/POlyForensic1.png",
          )),
          // #FF91A4 color pink for whole application.
        ),
        Center(
          child: Text(
            "PCOS Detection Mobile Application",
            style: TextStyle(
                color:Color(0xfffFF91A4),
                fontSize: 17, fontFamily: "Arial",
            fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: 200,
          height: 60,
          child: ElevatedButton(
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            style:
                ElevatedButton.styleFrom(backgroundColor:
                Color(0xfffFF91A4)),
            child: Text(
              "Get Started ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: "Arial",
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ));
  }
}
