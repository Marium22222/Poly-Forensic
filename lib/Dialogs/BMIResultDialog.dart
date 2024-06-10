import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poly_forensic/globals.dart';

class BMIDialog extends StatefulWidget {
  final double bmi;
  final double weight;
  final double height;
  const BMIDialog({super.key, required this.bmi, required this.weight, required this.height});

  @override
  State<BMIDialog> createState() => _BMIDialogState();
}

class _BMIDialogState extends State<BMIDialog> {
  String getValue(double bmi) {
    if (bmi < 18.5) {
      return "Your BMI is $bmi, indicating your weight is in the Underweight category for adults of your height. BMI is a screening measure and is not intended to diagnose disease or illness.";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return "Your BMI is $bmi, indicating your weight is in the Healthy Weight category for adults of your height. BMI is a screening measure and is not intended to diagnose disease or illness.";
    } else if (bmi >= 25 && bmi <= 29.9) {
      return "Your BMI is $bmi, indicating your weight is in the Overweight category for adults of your height. BMI is a screening measure and is not intended to diagnose disease or illness";
    }
    return "Your BMI is $bmi, indicating your weight is in the Obesity category for adults of your height. BMI is a screening measure and is not intended to diagnose disease or illness";
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        String output = getValue(widget.bmi);
        return Center(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: constraints.maxHeight * 0.45,
                width: constraints.maxWidth * 0.8,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.cancel))
                    ],
                  ),
                  Text(
                    "$output",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Times New Roman",
                        letterSpacing: 1.3,
                        wordSpacing: 3.0),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection("users")
                          .doc(login)
                          .update({"BMI": "${widget.bmi}","weight":"${widget.weight}","height":"${widget.height}"});
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        foregroundColor: Colors.white),
                    child: Text("Save BMI"),
                  )
                ])));
      },
    );
    ;
  }
}
