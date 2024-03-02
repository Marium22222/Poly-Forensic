import 'package:flutter/material.dart';
import 'package:poly_forensic/Dialogs/BMIResultDialog.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  TextEditingController weight=new TextEditingController();
  TextEditingController height=new TextEditingController();
  double bmi=0.0;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              children: [
                Divider(),
                Text(
                  "CHECK BMI",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  width: constraints.maxWidth * 0.8,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "WEIGHT",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),
                          ),
                          Container(
                            width: constraints.maxWidth * 0.36,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.monitor_weight_outlined,
                                  color: Colors.grey[500],
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 40,
                                  child: TextField(
                                    controller: weight,
                                    decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: "In Kg"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "HEIGHT",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),
                          ),
                          Container(
                            width: constraints.maxWidth * 0.36,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.height_outlined,
                                  color: Colors.grey[500],
                                ),
                                SizedBox(
                                  width: 80,
                                  height: 40,
                                  child: TextField(
                                    controller: height,
                                    decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: "In m"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 40,
                // ),
                SizedBox(height: constraints.maxHeight*0.5,),
                SizedBox(
                  width: constraints.maxWidth * 0.9,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          foregroundColor: Colors.black,
                          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20))
                      ),
                      onPressed: () {
                        double h_squared =
                            double.parse(height.value.text) *
                                double.parse(height.value.text);
                        double weight_new =
                        double.parse(weight.value.text);
                        bmi = weight_new / h_squared;
                        showDialog(context: context,builder: (context) => BMIDialog(bmi: bmi,),);
                        setState(() {});
                      },
                      child: Text(
                        "CALCULATE",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            fontSize: 18
                        ),
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
