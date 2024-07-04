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
        body: Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 500,
          height: 500,
          child: Image(
              image: AssetImage(
            "assets/images/POlyForensic.png",
          )),
        ),
        Text(
          "PCOS Detection Mobile Application",
          style: TextStyle(
              color: Color(0xffffcbcae), fontSize: 17, fontFamily: "Arial"),
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
                ElevatedButton.styleFrom(backgroundColor: Color(0xffffcbcae)),
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
