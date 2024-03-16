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
  PageController pageController = new PageController();
  double bmi = 0.0;
  bool checkBmi = true;
  bool checkPCycle = false;

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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      pageController.animateToPage(0,
                          duration: Duration(milliseconds: 20),
                          curve: Curves.bounceIn);
                      checkBmi = true;
                      checkPCycle = false;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: checkBmi == true
                                    ? Colors.grey
                                    : Colors.white,
                                width: 2)),
                      ),
                      child: Text(
                        "Check BMI",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color:
                                checkBmi == true ? Colors.pink : Colors.black),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      pageController.animateToPage(1,
                          duration: Duration(milliseconds: 20),
                          curve: Curves.bounceIn);
                      checkBmi = false;
                      checkPCycle = true;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: checkPCycle == true
                                    ? Colors.grey
                                    : Colors.white,
                                width: 2)),
                      ),
                      child: SizedBox(
                        width: 150,
                        child: Text(
                          "Track Periods Cycle",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: checkPCycle == true
                                  ? Colors.pink
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  if (value == 0) {
                    checkBmi = true;
                    checkPCycle = false;
                    setState(() {});
                  } else if (value == 1) {
                    checkPCycle = true;
                    checkBmi = false;
                    setState(() {});
                  }
                },
                controller: pageController,
                children: [BMIScreen(), PeriodsSymptoms()],
              ),
            ),
          ],
        ));
  }
}
