import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FerrimanGallwey extends StatefulWidget {
  const FerrimanGallwey({Key? key}) : super(key: key);

  @override
  State<FerrimanGallwey> createState() => _FerrimanGallweyState();
}

class _FerrimanGallweyState extends State<FerrimanGallwey> {

  int selectedOption = 0;
  int selectedOption1 = 0;
  int selectedOption2 = 0;
  int selectedOption3 = 0;
  int selectedOption4 = 0;
  int selectedOption5 = 0;
  int selectedOption6 = 0;
  int selectedOption7 = 0;
  int selectedOption8 = 0;
  int result=0;
  String resultString="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ferriman Gallwey Screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
        
          children: [
            Text("select your upper lip hair 0-4"),
            Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                        "assets/images/UpperLip_0.jpeg"
                                    ),
                      ),
                    ),
                    Radio<int>(
                      value: 0,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperLip_1.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 1,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperLip_2.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 2,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperLip_3.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 3,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ), Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperLip_4.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 4,
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                )
              ],
            ),
        
        
        
        //----------------------next pic of hirsutism-----------------------------------
        
            Text("select your chin hair 0-4"),
            Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/chin_0.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 0,
                      groupValue: selectedOption1,
                      onChanged: (value) {
                        setState(() {
                          selectedOption1 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/chin_1.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 1,
                      groupValue: selectedOption1,
                      onChanged: (value) {
                        setState(() {
                          selectedOption1 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/chin_2.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 2,
                      groupValue: selectedOption1,
                      onChanged: (value) {
                        setState(() {
                          selectedOption1 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/chin_3.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 3,
                      groupValue: selectedOption1,
                      onChanged: (value) {
                        setState(() {
                          selectedOption1 = value!;
        
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ), Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/chin_4.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 4,
                      groupValue: selectedOption1,
                      onChanged: (value) {
                        setState(() {
                          selectedOption1 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                )
              ],
            ),
        
        //----------------------next pic of hirsutism-----------------------------------
        
            Text("select your Upper Chest hair 0-4"),
            Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperChest_0.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 0,
                      groupValue: selectedOption2,
                      onChanged: (value) {
                        setState(() {
                          selectedOption2 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperChest_1.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 1,
                      groupValue: selectedOption2,
                      onChanged: (value) {
                        setState(() {
                          selectedOption2 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperChest_2.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 2,
                      groupValue: selectedOption2,
                      onChanged: (value) {
                        setState(() {
                          selectedOption2 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperChest_3.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 3,
                      groupValue: selectedOption2,
                      onChanged: (value) {
                        setState(() {
                          selectedOption2 = value!;
        
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ), Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperChest_4.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 4,
                      groupValue: selectedOption2,
                      onChanged: (value) {
                        setState(() {
                          selectedOption2 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                )
              ],
            ),
        
        
        //----------------------next pic of hirsutism-----------------------------------
        
            Text("select your Lower Abdomen hair 0-4"),
            Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/LowerAbdomen_0.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 0,
                      groupValue: selectedOption4,
                      onChanged: (value) {
                        setState(() {
                          selectedOption4 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/LowerAbdomen_1.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 1,
                      groupValue: selectedOption4,
                      onChanged: (value) {
                        setState(() {
                          selectedOption4 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/LowerAbdomen_2.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 2,
                      groupValue: selectedOption4,
                      onChanged: (value) {
                        setState(() {
                          selectedOption4 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/LowerAbdomen_3.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 3,
                      groupValue: selectedOption4,
                      onChanged: (value) {
                        setState(() {
                          selectedOption4 = value!;
        
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ), Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/LowerAbdomen_4.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 4,
                      groupValue: selectedOption4,
                      onChanged: (value) {
                        setState(() {
                          selectedOption4 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                )
              ],
            ),
        //----------------------next pic of hirsutism-----------------------------------
        
            Text("select your Upper Abdomen hair 0-4"),
            Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperAbdomen_0.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 0,
                      groupValue: selectedOption3,
                      onChanged: (value) {
                        setState(() {
                          selectedOption3 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperAbdomen_1.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 1,
                      groupValue: selectedOption3,
                      onChanged: (value) {
                        setState(() {
                          selectedOption3 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperAbdomen_2.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 2,
                      groupValue: selectedOption3,
                      onChanged: (value) {
                        setState(() {
                          selectedOption3 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperAbdomen_3.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 3,
                      groupValue: selectedOption3,
                      onChanged: (value) {
                        setState(() {
                          selectedOption3 = value!;
        
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ), Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperAbdomen_4.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 4,
                      groupValue: selectedOption3,
                      onChanged: (value) {
                        setState(() {
                          selectedOption3 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                )
              ],
            ),

            //----------------------next pic of hirsutism-----------------------------------

            Text("select your Upper Back hair 0-4"),
            Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperBack_0.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 0,
                      groupValue: selectedOption5,
                      onChanged: (value) {
                        setState(() {
                          selectedOption5 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperBack_1.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 1,
                      groupValue: selectedOption5,
                      onChanged: (value) {
                        setState(() {
                          selectedOption5 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperBack_2.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 2,
                      groupValue: selectedOption5,
                      onChanged: (value) {
                        setState(() {
                          selectedOption5 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperBack_3.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 3,
                      groupValue: selectedOption5,
                      onChanged: (value) {
                        setState(() {
                          selectedOption5 = value!;

                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ), Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperBack_4.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 4,
                      groupValue: selectedOption5,
                      onChanged: (value) {
                        setState(() {
                          selectedOption5 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                )
              ],
            ),



            //----------------------next pic of hirsutism-----------------------------------

            Text("select your Lower Back hair 0-4"),
            Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/LowerBack_0.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 0,
                      groupValue: selectedOption6,
                      onChanged: (value) {
                        setState(() {
                          selectedOption6 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/LowerBack_1.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 1,
                      groupValue: selectedOption6,
                      onChanged: (value) {
                        setState(() {
                          selectedOption6 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/LowerBack_2.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 2,
                      groupValue: selectedOption6,
                      onChanged: (value) {
                        setState(() {
                          selectedOption6 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/LowerBack_3.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 3,
                      groupValue: selectedOption6,
                      onChanged: (value) {
                        setState(() {
                          selectedOption6 = value!;

                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ), Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/LowerBack_4.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 4,
                      groupValue: selectedOption6,
                      onChanged: (value) {
                        setState(() {
                          selectedOption6 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                )
              ],
            ),



            //----------------------next pic of hirsutism-----------------------------------

            Text("select your Upper Arms hair 0-4"),
            Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperArms_0.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 0,
                      groupValue: selectedOption7,
                      onChanged: (value) {
                        setState(() {
                          selectedOption7 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperArms_1.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 1,
                      groupValue: selectedOption7,
                      onChanged: (value) {
                        setState(() {
                          selectedOption7 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperArms_2.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 2,
                      groupValue: selectedOption7,
                      onChanged: (value) {
                        setState(() {
                          selectedOption7 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperArms_3.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 3,
                      groupValue: selectedOption7,
                      onChanged: (value) {
                        setState(() {
                          selectedOption7 = value!;

                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ), Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/UpperArms_4.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 4,
                      groupValue: selectedOption7,
                      onChanged: (value) {
                        setState(() {
                          selectedOption7 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                )
              ],
            ),



            //----------------------next pic of hirsutism-----------------------------------

            Text("select your Thighs hair 0-4"),
            Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/Thighs_0.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 0,
                      groupValue: selectedOption8,
                      onChanged: (value) {
                        setState(() {
                          selectedOption8= value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/Thighs_1.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 1,
                      groupValue: selectedOption8,
                      onChanged: (value) {
                        setState(() {
                          selectedOption8 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/Thighs_2.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 2,
                      groupValue: selectedOption8,
                      onChanged: (value) {
                        setState(() {
                          selectedOption8= value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/Thighs_3.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 3,
                      groupValue: selectedOption8,
                      onChanged: (value) {
                        setState(() {
                          selectedOption8 = value!;

                          print("Button value: $value");
                        });   },
                    ),
                  ],
                ), Column(
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.asset(
                            "assets/images/Thighs_4.jpeg"
                        ),
                      ),
                    ),
                    Radio<int>(
                      value: 4,
                      groupValue: selectedOption8,
                      onChanged: (value) {
                        setState(() {
                          selectedOption8 = value!;
                          print("Button value: $value");
                        });   },
                    ),
                  ],
                )
              ],
            ),
        ElevatedButton(onPressed: ()
        {
          print(selectedOption);
          print(selectedOption1);
          print(selectedOption1+selectedOption);
          setState(() {
            result=selectedOption+selectedOption1+
                selectedOption2+selectedOption3+selectedOption4+
            selectedOption5+selectedOption6+selectedOption7+
                selectedOption8;
            if(result>=8)
              {
                resultString="You might have hirsutism";
                print("You might have hirsutism");
              }
            else{
              resultString="You are marked save from hirsutism";
              print("You are marked save from hirsutism");
            }
          });
        
        }, child: Text(
          "Calculate Score"
        )),
            Text("Score: ${result}",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
            Text(resultString,style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),)
          ],
        ),
      ),
    );
  }
}
