import 'package:flutter/material.dart';

class MealsNutritionDialog extends StatefulWidget {
  final Map<String, dynamic> data;
  const MealsNutritionDialog({Key? key, required this.data}) : super(key: key);

  @override
  State<MealsNutritionDialog> createState() => _MealsNutritionDialogState();
}

class _MealsNutritionDialogState extends State<MealsNutritionDialog> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
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
                          child: Icon(
                            Icons.cancel,
                            size: 30,
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Calories",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              fontSize: 18,
                              letterSpacing: 1.3,
                              wordSpacing: 3.0),
                        ),
                        Text(
                          "${widget.data['calories']}",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              fontSize: 18,
                              letterSpacing: 1.3,
                              wordSpacing: 3.0),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Fat",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              fontSize: 18,
                              letterSpacing: 1.3,
                              wordSpacing: 3.0),
                        ),
                        Text(
                          "${widget.data['fat']}",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              letterSpacing: 1.3,
                              fontSize: 18,
                              wordSpacing: 3.0),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0,10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Carbs",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              fontSize: 18,
                              letterSpacing: 1.3,
                              wordSpacing: 3.0),
                        ),
                        Text(
                          "${widget.data['carbs']}",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Times New Roman",
                              letterSpacing: 1.3,
                              fontSize: 18,
                              wordSpacing: 3.0),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ])));
      },
    );
  }
}
