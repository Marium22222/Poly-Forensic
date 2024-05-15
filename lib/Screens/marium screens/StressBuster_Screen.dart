import 'package:flutter/material.dart';

class StressBusterScreen extends StatefulWidget {
  const StressBusterScreen({Key? key}) : super(key: key);

  @override
  State<StressBusterScreen> createState() => _StressBusterScreenState();
}

class _StressBusterScreenState extends State<StressBusterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stress Buster Screen"
        ),
        
      ),
      body: Column(
        children: [
          Text('Some Friendly Reminders for you',style: TextStyle(
              fontSize: 20,
              color: Colors.purple,
              fontWeight: FontWeight.bold
          ),),
          Image.asset("assets/images/stress.png"),

        ],
      ),
    );
  }
}
