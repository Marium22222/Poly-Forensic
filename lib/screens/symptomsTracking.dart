import 'package:flutter/material.dart';
import 'dart:math';

class SymptomsTracking extends StatefulWidget {
  const SymptomsTracking({Key? key}) : super(key: key);

  @override
  State<SymptomsTracking> createState() => _SymptomsTrackingState();
}

class _SymptomsTrackingState extends State<SymptomsTracking> {
  TextEditingController weight = new TextEditingController();
  TextEditingController height = new TextEditingController();
  double bmi = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        title: Text(
          'TRACK YOUR SYMPTOMS',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontFamily: "Times New Roman"),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              children: [
                Divider(),
                Text(
                  "Track BMI",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  width: constraints.maxHeight * 0.55,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: Colors.black, width: 5))),
                            child: Column(
                              children: [
                                Text("WEIGHT"),
                                SizedBox(
                                  width: 40,
                                  height: 25,
                                  child: TextField(
                                    controller: weight,
                                    decoration: InputDecoration(
                                        border: UnderlineInputBorder()),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        decoration: BoxDecoration(
                            border: Border(
                                left:
                                    BorderSide(color: Colors.black, width: 5))),
                        child: Column(
                          children: [
                            Text("HEIGHT"),
                            SizedBox(
                              width: 40,
                              height: 25,
                              child: TextField(
                                controller: height,
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder()),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bmi == 0.0
                    ? ElevatedButton(
                        onPressed: () {
                          double h_squared = double.parse(height.value.text) *
                              double.parse(height.value.text);
                          double weight_new = double.parse(weight.value.text);
                          bmi = weight_new / h_squared;
                          setState(() {});
                        },
                        child: Text("Calculate"))
                    : Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Remarks",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Times New Roman",
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "The formula for BMI is weight in kilograms divided by height in meters squared. If height has been measured in centimeters, divide by 100 to convert this to meters. The BMI IS $bmi",
                              style: TextStyle(
                                fontFamily: "Times New Roman",
                                fontSize: 18,
                                letterSpacing: 0.2,
                              ),
                              textAlign: TextAlign.justify,
                            )
                          ],
                        ),
                      ),
                Text(
                  "Track Your Period Symptoms",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
