import 'package:flutter/material.dart';
import 'dart:async';

import 'package:poly_forensic/Screens/ResultsScreen.dart';

class Waiting extends StatefulWidget {
  // final String result;
  const Waiting({Key? key}) : super(key: key);

  @override
  State<Waiting> createState() => _WaitingState();
}

class _WaitingState extends State<Waiting> {
  late Timer _timer;
  int _currentIndex = 0;
  final List<String> _messages = [
    "Please wait.......While we are generating the results",
    "Explore our Mitigation section and PCOS awareness blogs",
    "Healthy diet and exercise can help you combat PCOS"

  ];

  @override
  void initState() {
    super.initState();
    // Start the timer for 1 minute
    _timer = Timer(Duration(minutes: 1), () {
      // After 1 minute, navigate to another screen
     Navigator.pop(context);
    });

    // Change text every 3 seconds
    Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _messages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffbddb),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 400.0,  // Adjust the size as needed
              height: 400.0, // Adjust the size as needed
              child: Image(image: AssetImage("assets/images/gifWait2.gif")),
            ),
          ),
          AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: Text(
              _messages[_currentIndex],

              key: ValueKey<int>(_currentIndex),
              style: TextStyle(fontSize: 20
              ,color: Colors.white,
              fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,

            ),
          ),
        ],
      ),
    );
  }
}

