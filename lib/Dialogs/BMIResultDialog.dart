import 'package:flutter/material.dart';

class BMIDialog extends StatefulWidget {
  final double bmi;
  const BMIDialog({super.key, required this.bmi});

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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
                height: constraints.maxHeight * 0.4,
                width: constraints.maxWidth * 0.8,
                child: Column(children: [
                  Text(
                    "$output",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Times New Roman",
                        letterSpacing: 1.3,
                        wordSpacing: 3.0),
                    textAlign: TextAlign.justify,
                  ),
                ])));
      },
    );
    ;
  }
}
