import 'package:flutter/material.dart';
import 'dart:math';

import 'package:poly_forensic/screens/BmiScreen.dart';
import 'package:poly_forensic/screens/periodsSymptoms.dart';


class SymptomsTracking extends StatefulWidget {
  const SymptomsTracking({Key? key}) : super(key: key);

  @override
  State<SymptomsTracking> createState() => _SymptomsTrackingState();
}

class _SymptomsTrackingState extends State<SymptomsTracking> {
  TextEditingController weight = new TextEditingController();
  TextEditingController height = new TextEditingController();
  PageController pageController=new PageController();
  double bmi = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'TRACK YOUR SYMPTOMS',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontFamily: "Times New Roman"),
        ),
        centerTitle: true,
      ),
      body: PageView(
        controller: pageController,
        children: [
          BMIScreen(),
          PeriodsSymptoms()
        ],
      )
    );
  }
}
