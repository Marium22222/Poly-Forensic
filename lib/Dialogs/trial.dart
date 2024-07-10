import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poly_forensic/globals.dart' as globals;
import 'package:toggle_switch/toggle_switch.dart';

import '../Custom Widgets/periodsSymptomDialogOptions.dart';
import '../globals.dart';

class Trial extends StatefulWidget {
  final CollectionReference collectionReference;
  final String doc;
  final DateTime dateToday;
  const Trial(
      {Key? key,
      required this.collectionReference,
      required this.doc,
      required this.dateToday})
      : super(key: key);

  @override
  State<Trial> createState() => _TrialState();
}

class _TrialState extends State<Trial> {
  TextEditingController _notes = new TextEditingController();
  bool _clicked = false;
  String _name = "";
  int _num11 = 0;
  int _num12 = 0;
  int _num13 = 0;
  int _num21 = 0;
  int _num22 = 0;
  int _num23 = 0;
  int _num31 = 0;
  int _num32 = 0;
  int _num33 = 0;
  int _num34 = 0;
  Map<String, dynamic> values = {
    "_num11": "Heavy",
    "_num12": "Medium",
    "_num13": "Light",
    "_num21": "Severe",
    "_num22": "Moderate",
    "_num23": "Normal",
    "_num31": "Good",
    "_num32": "Oily",
    "_num33": "Dry",
    "_num34": "Acne"
  };

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Object?>>(
        stream: widget.collectionReference.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:
                    CircularProgressIndicator()); //return means the bottom code wont run
          }
          if (snapshot.data == null || snapshot.hasError) {
            return const Center(child: Text("DATA NOT AVAILABLE"));
          }
          if (snapshot.data!.docs.length == 0) {
            checked = false;

            return LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: constraints.maxWidth * 0.9,
                    height: constraints.maxHeight * 0.95,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${widget.dateToday.month}/${widget.dateToday.day}/${widget.dateToday.year}",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    letterSpacing: 2.0),
                              ),
                              FloatingActionButton.small(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("x"),
                                shape: CircleBorder(),
                                backgroundColor: Colors.pink[200],
                              ),
                            ],
                          ),
                          Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ADD YOUR SYMPTOMS",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "BLEEDING",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              _clicked = true;
                                              _num11 = 1;
                                              _num12 = 0;
                                              _num13 = 0;
                                              globals.objectsList[0] =
                                                  values["_num11"];
                                              setState(() {});
                                            },
                                            child: PeriodSymptomsDialogOptions(
                                              text: "Heavy",
                                              color1: _num11 == 1
                                                  ? Colors.green
                                                  : Colors.grey.shade300,
                                              color2: _num11 == 1
                                                  ? Colors.white
                                                  : Colors.black,
                                            )),
                                        GestureDetector(
                                            onTap: () {
                                              _clicked = true;
                                              _num11 = 0;
                                              _num12 = 1;
                                              _num13 = 0;
                                              globals.objectsList[0] =
                                                  values["_num12"];
                                              setState(() {});
                                            },
                                            child: PeriodSymptomsDialogOptions(
                                                text: "Medium",
                                                color1: _num12 == 1
                                                    ? Colors.green
                                                    : Colors.grey.shade300,
                                                color2: _num12 == 1
                                                    ? Colors.white
                                                    : Colors.black)),
                                        GestureDetector(
                                          onTap: () {
                                            _clicked = true;
                                            _num11 = 0;
                                            _num12 = 0;
                                            _num13 = 1;
                                            globals.objectsList[0] =
                                                values["_num13"];
                                            setState(() {});
                                          },
                                          child: PeriodSymptomsDialogOptions(
                                              text: "Light",
                                              color1: _num13 == 1
                                                  ? Colors.green
                                                  : Colors.grey.shade300,
                                              color2: _num13 == 1
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "PAIN",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              _clicked = true;
                                              _num21 = 1;
                                              _num22 = 0;
                                              _num23 = 0;
                                              globals.objectsList[1] =
                                                  values["_num21"];
                                              setState(() {});
                                            },
                                            child: PeriodSymptomsDialogOptions(
                                              text: "Severe",
                                              color1: _num21 == 1
                                                  ? Colors.green
                                                  : Colors.grey.shade300,
                                              color2: _num21 == 1
                                                  ? Colors.white
                                                  : Colors.black,
                                            )),
                                        GestureDetector(
                                            onTap: () {
                                              _clicked = true;
                                              _num21 = 0;
                                              _num22 = 1;
                                              _num23 = 0;
                                              globals.objectsList[1] =
                                                  values["_num22"];
                                              setState(() {});
                                            },
                                            child: PeriodSymptomsDialogOptions(
                                                text: "Moderate",
                                                color1: _num22 == 1
                                                    ? Colors.green
                                                    : Colors.grey.shade300,
                                                color2: _num22 == 1
                                                    ? Colors.white
                                                    : Colors.black)),
                                        GestureDetector(
                                          onTap: () {
                                            _clicked = true;
                                            _num21 = 0;
                                            _num22 = 0;
                                            _num23 = 1;
                                            globals.objectsList[1] =
                                                values["_num23"];
                                            setState(() {});
                                          },
                                          child: PeriodSymptomsDialogOptions(
                                              text: "Normal",
                                              color1: _num23 == 1
                                                  ? Colors.green
                                                  : Colors.grey.shade300,
                                              color2: _num23 == 1
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "SKIN",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              _clicked = true;
                                              _num31 = 1;
                                              _num32 = 0;
                                              _num33 = 0;
                                              _num34 = 0;
                                              globals.objectsList[2] =
                                                  values["_num31"];
                                              setState(() {});
                                            },
                                            child: PeriodSymptomsDialogOptions(
                                              text: "Good",
                                              color1: _num31 == 1
                                                  ? Colors.green
                                                  : Colors.grey.shade300,
                                              color2: _num31 == 1
                                                  ? Colors.white
                                                  : Colors.black,
                                            )),
                                        GestureDetector(
                                            onTap: () {
                                              _clicked = true;
                                              _num31 = 0;
                                              _num32 = 1;
                                              _num33 = 0;
                                              _num34 = 0;
                                              globals.objectsList[2] =
                                                  values["_num32"];
                                              setState(() {});
                                            },
                                            child: PeriodSymptomsDialogOptions(
                                                text: "Oily",
                                                color1: _num32 == 1
                                                    ? Colors.green
                                                    : Colors.grey.shade300,
                                                color2: _num32 == 1
                                                    ? Colors.white
                                                    : Colors.black)),
                                        GestureDetector(
                                          onTap: () {
                                            _clicked = true;
                                            _num31 = 0;
                                            _num32 = 0;
                                            _num33 = 1;
                                            _num34 = 0;
                                            globals.objectsList[2] =
                                                values["_num33"];
                                            setState(() {});
                                          },
                                          child: PeriodSymptomsDialogOptions(
                                              text: "Dry",
                                              color1: _num33 == 1
                                                  ? Colors.green
                                                  : Colors.grey.shade300,
                                              color2: _num33 == 1
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            _clicked = true;
                                            _num31 = 0;
                                            _num32 = 0;
                                            _num33 = 0;
                                            _num34 = 1;
                                            globals.objectsList[2] =
                                                values["_num34"];
                                            setState(() {});
                                          },
                                          child: PeriodSymptomsDialogOptions(
                                              text: "Acne",
                                              color1: _num34 == 1
                                                  ? Colors.green
                                                  : Colors.grey.shade300,
                                              color2: _num34 == 1
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "KEY NOTES",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),

                                    ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    Card(
                                      color: Colors.white,
                                      child: TextField(
                                        controller: _notes,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Want to mark as first period of month?",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        ),
                                        ToggleSwitch(
                                          customWidths: [30.0, 30.0],
                                          cornerRadius: 20.0,
                                          activeBgColors: [
                                            [Colors.redAccent],
                                            [Colors.indigo.shade900],
                                          ],
                                          activeFgColor: Colors.white,
                                          inactiveBgColor: Colors.grey,
                                          inactiveFgColor: Colors.white,
                                          totalSwitches: 2,
                                          icons: [
                                            Icons.cancel_sharp,
                                            Icons.check_outlined
                                          ],
                                          onToggle: (index) {
                                            if (index == 0) {
                                              _name = "No";
                                            } else if (index == 1) {
                                              _name = "Yes";
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              FloatingActionButton(
                                  onPressed: () {
                                    globals.objectsList[3] = _notes.value.text;
                                    print(globals.objectsList);
                                    String dateNow =
                                        "${widget.dateToday.day}-${widget.dateToday.month}-${widget.dateToday.year}";
                                    Map<String, dynamic> dataToAdd = {
                                      "Bleeding": objectsList[0],
                                      "pain": objectsList[1],
                                      "skin": objectsList[2],
                                      "notes": objectsList[3]
                                    };
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(login)
                                        .collection("symptoms")
                                        .doc("periods_symptoms")
                                        .collection(dateNow)
                                        .add(dataToAdd);
                                    // FirebaseFirestore.instance.collection("users").doc("shaikhnaila488@gmail.com").collection("symptoms").doc(dateNow).set(dataToAdd);
                                    if (_name == "Yes") {
                                      DateTime d = widget.dateToday
                                          .add(Duration(days: 28));
                                      print("yes");
                                      FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(login)
                                          .update({
                                        "lastPeriodDate": "${widget.dateToday}",
                                        "expectedPeriodDate": "${d}"
                                      });
                                    }
                                  },
                                  backgroundColor: Colors.grey[50],
                                  child: Text("Save"))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
          }
          print(snapshot.data!.docs[0]);
          objectsList = [
            snapshot.data!.docs[0]['Bleeding'],
            snapshot.data!.docs[0]['pain'],
            snapshot.data!.docs[0]['skin'],
            snapshot.data!.docs[0]['notes'],
          ];
          return LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: constraints.maxWidth * 0.9,
                  height: constraints.maxHeight * 0.95,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${widget.dateToday.month}/${widget.dateToday.day}/${widget.dateToday.year}",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  letterSpacing: 2.0),
                            ),
                            FloatingActionButton.small(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("x"),
                              shape: CircleBorder(),
                              backgroundColor: Colors.pink[200],
                            ),
                          ],
                        ),
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ADD YOUR SYMPTOMS",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "BLEEDING",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            _clicked = true;
                                            _num11 = 1;
                                            _num12 = 0;
                                            _num13 = 0;
                                            globals.objectsList[0] =
                                                values["_num11"];
                                            setState(() {});
                                          },
                                          child: PeriodSymptomsDialogOptions(
                                            text: "Heavy",
                                            color1: objectsList[0] == "Heavy"
                                                ? Colors.green
                                                : Colors.grey.shade300,
                                            color2: objectsList[0] == "Heavy"
                                                ? Colors.white
                                                : Colors.black,
                                          )),
                                      GestureDetector(
                                          onTap: () {
                                            _clicked = true;
                                            _num11 = 0;
                                            _num12 = 1;
                                            _num13 = 0;
                                            globals.objectsList[0] =
                                                values["_num12"];
                                            setState(() {});
                                          },
                                          child: PeriodSymptomsDialogOptions(
                                              text: "Medium",
                                              color1: objectsList[0] == "Medium"
                                                  ? Colors.green
                                                  : Colors.grey.shade300,
                                              color2: objectsList[0] == "Medium"
                                                  ? Colors.white
                                                  : Colors.black)),
                                      GestureDetector(
                                        onTap: () {
                                          _clicked = true;
                                          _num11 = 0;
                                          _num12 = 0;
                                          _num13 = 1;
                                          globals.objectsList[0] =
                                              values["_num13"];
                                          setState(() {});
                                        },
                                        child: PeriodSymptomsDialogOptions(
                                            text: "Light",
                                            color1: objectsList[0] == "Light"
                                                ? Colors.green
                                                : Colors.grey.shade300,
                                            color2: objectsList[0] == "Light"
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "PAIN",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            _clicked = true;
                                            _num21 = 1;
                                            _num22 = 0;
                                            _num23 = 0;
                                            globals.objectsList[1] =
                                                values["_num21"];
                                            setState(() {});
                                          },
                                          child: PeriodSymptomsDialogOptions(
                                            text: "Severe",
                                            color1: objectsList[1] == "Severe"
                                                ? Colors.green
                                                : Colors.grey.shade300,
                                            color2: objectsList[1] == "Severe"
                                                ? Colors.white
                                                : Colors.black,
                                          )),
                                      GestureDetector(
                                          onTap: () {
                                            _clicked = true;
                                            _num21 = 0;
                                            _num22 = 1;
                                            _num23 = 0;
                                            globals.objectsList[1] =
                                                values["_num22"];
                                            setState(() {});
                                          },
                                          child: PeriodSymptomsDialogOptions(
                                              text: "Moderate",
                                              color1:
                                                  objectsList[1] == "Moderate"
                                                      ? Colors.green
                                                      : Colors.grey.shade300,
                                              color2:
                                                  objectsList[1] == "Moderate"
                                                      ? Colors.white
                                                      : Colors.black)),
                                      GestureDetector(
                                        onTap: () {
                                          _clicked = true;
                                          _num21 = 0;
                                          _num22 = 0;
                                          _num23 = 1;
                                          globals.objectsList[1] =
                                              values["_num23"];
                                          setState(() {});
                                        },
                                        child: PeriodSymptomsDialogOptions(
                                            text: "Normal",
                                            color1: objectsList[1] == "Normal"
                                                ? Colors.green
                                                : Colors.grey.shade300,
                                            color2: objectsList[1] == "Normal"
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "SKIN",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            _clicked = true;
                                            _num31 = 1;
                                            _num32 = 0;
                                            _num33 = 0;
                                            _num34 = 0;
                                            globals.objectsList[2] =
                                                values["_num31"];
                                            setState(() {});
                                          },
                                          child: PeriodSymptomsDialogOptions(
                                            text: "Good",
                                            color1: objectsList[2] == "Good"
                                                ? Colors.green
                                                : Colors.grey.shade300,
                                            color2: objectsList[2] == "Good"
                                                ? Colors.white
                                                : Colors.black,
                                          )),
                                      GestureDetector(
                                          onTap: () {
                                            _clicked = true;
                                            _num31 = 0;
                                            _num32 = 1;
                                            _num33 = 0;
                                            _num34 = 0;
                                            globals.objectsList[2] =
                                                values["_num32"];
                                            setState(() {});
                                          },
                                          child: PeriodSymptomsDialogOptions(
                                              text: "Oily",
                                              color1: objectsList[2] == "Oily"
                                                  ? Colors.green
                                                  : Colors.grey.shade300,
                                              color2: objectsList[2] == "Oily"
                                                  ? Colors.white
                                                  : Colors.black)),
                                      GestureDetector(
                                        onTap: () {
                                          _clicked = true;
                                          _num31 = 0;
                                          _num32 = 0;
                                          _num33 = 1;
                                          _num34 = 0;
                                          globals.objectsList[2] =
                                              values["_num33"];
                                          setState(() {});
                                        },
                                        child: PeriodSymptomsDialogOptions(
                                            text: "Dry",
                                            color1: objectsList[2] == "Dry"
                                                ? Colors.green
                                                : Colors.grey.shade300,
                                            color2: objectsList[2] == "Dry"
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _clicked = true;
                                          _num31 = 0;
                                          _num32 = 0;
                                          _num33 = 0;
                                          _num34 = 1;
                                          globals.objectsList[2] =
                                              values["_num34"];
                                          setState(() {});
                                        },
                                        child: PeriodSymptomsDialogOptions(
                                            text: "Acne",
                                            color1: objectsList[2] == "Acne"
                                                ? Colors.green
                                                : Colors.grey.shade300,
                                            color2: objectsList[2] == "Acne"
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "KEY NOTES",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: constraints.maxWidth * 0.8,
                                    height: constraints.maxHeight * 0.13,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: Colors.grey)),
                                    child: Text("${objectsList[3]}"),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }
}
