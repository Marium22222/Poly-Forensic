import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poly_forensic/Screens/marium%20screens/ferriman_hirsutism_screen.dart';
import 'package:poly_forensic/Screens/marium%20screens/know_ferriman.dart';
import 'package:poly_forensic/Screens/symptomsTracking.dart';
import 'package:poly_forensic/globals.dart' as globals;
class RotterdamSymptomsScreen extends StatefulWidget {
  const RotterdamSymptomsScreen({Key? key}) : super(key: key);

  @override
  State<RotterdamSymptomsScreen> createState() => _RotterdamSymptomsScreenState();
}

class _RotterdamSymptomsScreenState extends State<RotterdamSymptomsScreen> {

  String dropdownValue = 'Yes'; // Default value
  TextEditingController priceController = TextEditingController();
  TextEditingController numberoffolliclesController = TextEditingController();
  TextEditingController folliclesinmmController = TextEditingController();
  TextEditingController ovaryVolumeController = TextEditingController();
  TextEditingController _bmiController = TextEditingController();
  var number="";
  var foll="";
  var volume="";


  Future<void> openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // You can handle the picked image file here
      print('Image picked from camera: ${pickedFile.path}');
    } else {
      print('No image selected from camera.');
    }
  }

  Future<void> openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // You can handle the picked image file here
      print('Image picked from gallery: ${pickedFile.path}');
    } else {
      print('No image selected from gallery.');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rotterdam Criteria Symptoms"),
        centerTitle: true,
      ),
      body:StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').doc(globals.login).snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          var userDocument = snapshot.data;
          var bmi = userDocument!['BMI'];
          _bmiController.text = bmi.toString();
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Rotterdam Criteria'),
                            content: Text('PCOS is usually diagnosed based on the Rotterdam criteria if 2 of 3 criteria are present: (1) oligo- and/or anovulation, (2) hyperandrogenism (HA) (clinical and/or biochemical), and (3) polycystic ovary morphology (PCOM) on ultrasonography (either 12 or more follicles measuring 2-9 mm in diameter and/or an increased ovarian volume >10 cm3). Irregular menstruation  is defined as less than 21 days or more than 35 days or fewer than 8 cycles per year. Clinical HA includes hirsutism, acne, or alopecia. Biochemical HA typically refers to an elevated serum testosterone level.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("Rotterdam criteria",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,

                      ),),
                  ),
                  Text("1. BMI",style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20),),
                  // TextFormField(
                  //   controller: nameController,
                  //   decoration: InputDecoration(labelText: ' Enter BMI'),
                  TextField(
                    controller: _bmiController,
                    decoration: InputDecoration(
                      // labelText: 'BMI',
                    ),

                  ),


                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SymptomsTracking()),
                      );
                    },
                    child: Text("Check BMI from here",style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18),),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("2. PCOM",style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 20),),
                      InkWell(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Polycystic Ovary Morphology'),
                                content: Text('polycystic ovary morphology (PCOM) on ultrasonography (either 12 or more follicles measuring 2-9 mm in diameter and/or an increased ovarian volume >10 cm3).'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text("Details",
                          style: TextStyle(
                              color: Colors.blue

                          ),),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: numberoffolliclesController,
                    decoration: InputDecoration(labelText: 'Number of follicles'),
                  ),
                  TextFormField(
                    controller: folliclesinmmController,
                    decoration: InputDecoration(labelText: 'Follicles in mm (optional)'),
                  ),
                  TextFormField(
                    controller: ovaryVolumeController,
                    decoration: InputDecoration(labelText: 'Ovary Volume'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("3. OligoOvulation",style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 20),),
                      InkWell(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('What is Oligoovulation'),
                                content: Text('What Is Oligoovulation? Oligoovulation is a condition that causes irregular or infrequent periods. While women with an average menstrual cycle typically have periods every 28 to 32 days, women experiencing oligoovulation generally have eight or fewer periods each year.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text("Details",
                          style: TextStyle(
                              color: Colors.blue
                          ),),
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Do you have oligoovulation"),
                      DropdownButton<String>(
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Yes', 'No'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("4. HyperAndrogenism",style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 20),),
                      InkWell(
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('What is HyperAndrogenism'),
                                content: Text('Hyperandrogenism happens when you have an excess amount of androgens in your body. Hyperandrogenism includes acne and hirsutism'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text("Details",
                          style: TextStyle(
                              color: Colors.blue
                          ),),
                      )
                    ],
                  ),
                  Text(" A) Check Acne"),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: (){},
                          child: Text("Capture",
                            style: TextStyle(
                                color: Colors.blue
                            ),)),
                      InkWell(
                          onTap: (){},
                          child: Text("Upload",
                            style: TextStyle(
                                color: Colors.blue
                            ),)),
                    ],
                  ),

                  Text(" B) Check hirsutism"),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: (){},
                          child: Text("Capture",
                            style: TextStyle(
                                color: Colors.blue
                            ),)),
                      InkWell(
                          onTap: (){},
                          child: Text("Upload",
                            style: TextStyle(
                                color: Colors.blue
                            ),)),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("OR"),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>KnowFerriman()),
                          );
                        },
                        child: Text("Open Ferriman Gallwey Screen",  style: TextStyle(
                            color: Colors.blue
                        ),),
                      )
                    ],
                  ),

                  ElevatedButton(onPressed: (){
                    number=numberoffolliclesController.text;
                    foll=folliclesinmmController.text;
                    volume=ovaryVolumeController.text;
                    List<String> values=[number,foll,volume];
                    print(globals.login);
                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(globals.login)
                        .set({"BMI": "${_bmiController.text}"},
                        SetOptions(merge: true));
                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(globals.login).collection("symptoms").doc("pcos_symptoms")
                        .set({"ultrasonography": values,
                    "oligoAnovulation": dropdownValue},
                        SetOptions(merge: true));
                  }, child: Text("Submit"))

                ],
              ),
            ),

          );
        },
      ),


  );
  }
}
