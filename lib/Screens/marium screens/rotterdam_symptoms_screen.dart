import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poly_forensic/Screens/marium%20screens/Prediction_Page.dart';
import 'package:poly_forensic/Screens/marium%20screens/ferriman_hirsutism_screen.dart';
import 'package:poly_forensic/Screens/marium%20screens/know_ferriman.dart';
import 'Detection_Camera.dart';
import 'package:poly_forensic/Screens/symptomsTracking.dart';
import 'package:poly_forensic/Screens/ResultsScreen.dart';
import 'package:poly_forensic/globals.dart' as globals;
import 'function.dart';
class RotterdamSymptomsScreen extends StatefulWidget {

  const RotterdamSymptomsScreen({Key? key,}) : super(key: key);
  @override
  State<RotterdamSymptomsScreen> createState() => _RotterdamSymptomsScreenState();
}

class _RotterdamSymptomsScreenState extends State<RotterdamSymptomsScreen> {


  TextEditingController priceController = TextEditingController();
  TextEditingController numberoffolliclesController = TextEditingController();
  TextEditingController folliclesinmmController = TextEditingController();
  TextEditingController ovaryVolumeController = TextEditingController();
  TextEditingController _bmiController = TextEditingController();
  TextEditingController menstrualdays = TextEditingController();
  TextEditingController abortions= TextEditingController();
  TextEditingController hipcircumference = TextEditingController();
  TextEditingController waistcircumference = TextEditingController();
  TextEditingController waisthipcircumference = TextEditingController();
  TextEditingController folliclesInL = TextEditingController();
  TextEditingController folliclesinR = TextEditingController();
  TextEditingController ferrimanController = TextEditingController();
  String dropdownValue = 'No';
  String dropdownValue1 = '2 months';
  String dropdownValue2 = 'No';
  String dropdownValue3 = 'No';
  String dropdownValue4 = 'No';
  String dropdownValue5 = 'No';
  String dropdownValue6 = 'No';
  String dropdownValue7 = 'No';
  var number="";
  var foll="";
  var volume="";

  String result = '';
  void getPrediction(data) async {
    final inputData = {
      "BMI": [_bmiController.text],
      "Cycle(R/I)": [data["PeriodsRegularity"]],
      "Cycle length(days)": [data["menstrualduration"]],
      "Pregnant(Y/N)": [data["pregnancy"]],
      "No. of aborptions": [data["abortions"]],
      "Hip(inch)": [data["hipcircumference"]],
      "Waist(inch)": [data["waistcircumference"]],
      "Waist:Hip Ratio": [data["ratiohiptowaist"]],
      "Weight gain(Y/N)": [data["weightgain"]],
      "hair growth(Y/N)": [data["hairgrowth"]],
      "Skin darkening (Y/N)": [data["darkskin"]],
      "Pimples(Y/N)": [data["pimples"]],
      "Fast food (Y/N)": [data["fastfood"]],
      "Follicle No. (L)": [data["folliclesL"]],
      "Follicle No. (R)": [data["folliclesR"]]
    };
    print(data);
    try {
      print("hit");
      final response = await fetchPrediction(inputData);
      print("hit after");
      setState(() {
        result = response['PCOS_Y/N'].toString();
      });
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResultsScreen(result: result),));
    } catch (e) {
      setState(() {
        result = 'Failed to load prediction';
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Prediction Screen",
        style: TextStyle(
          color: Colors.white
        ),),

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
          var ferr1=userDocument!['ferrimanGallweyScore'];


          // globals.ferriman=userDocument!['ferrimanGallweyScore'];

          ferrimanController.text=ferr1.toString();
          _bmiController.text = bmi.toString();
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                              content: Text('PCOS is usually diagnosed'
                                  ' based on the Rotterdam criteria if 2 of 3'
                                  ' criteria are present: (1) oligo- and/or'
                                  ' anovulation, (2) hyperandrogenism (HA) '
                                  '(clinical and/or biochemical), and (3) '
                                  'polycystic ovary morphology (PCOM) on '
                                  'ultrasonography (either 12 or more follicles measuring 2-9 mm in diameter and/or an increased ovarian volume >10 cm3). Irregular menstruation  is defined as less than 21 days or more than 35 days or fewer than 8 cycles per year. Clinical HA includes hirsutism, acne, or alopecia. Biochemical HA typically refers to an elevated serum testosterone level.'),
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
                      child: Text("Learn More about Rotterdam Criteria",
                        style: TextStyle(
                          color: Colors.blue,
                        ),),
                    ),
                    SizedBox(height: 20,),

                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text("1. HyperAndrogenism",style: TextStyle(fontWeight: FontWeight.bold,
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
                    SizedBox(height: 20,),
                    SizedBox(height: 20,),
                    Text(" A) Check hirsutism using Ferriman Gallwey Score"),
                    SizedBox(height: 20,),
                    TextFormField(

                      controller: ferrimanController,
                      validator: (value) {
                        if (value =="-1")
                        {
                          return 'Please enter a  value or calculate from below';
                        }
                        print("val"+value!);
                        return null;

                      },

                      // decoration: InputDecoration(labelText: 'b) Duration of the menstrual cycle in days.'),
                      decoration: InputDecoration(
                        labelText: 'Enter Ferriman Gallwey Score',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'Ferriman Gallwey Score',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),

                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        ElevatedButton(onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>KnowFerriman()),
                          );
                        },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[200]
                          ),
                          child: Text("Check Ferriman Gallwey Score",  style: TextStyle(
                              color: Colors.white
                          ),),)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text(" B) Check Acne"),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>TestGalCam()),
                          );
                        },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[200]
                          ),
                          child: Text("Check Now",  style: TextStyle(
                              color: Colors.white
                          ),),),


                      ],
                    ),
                    Text("2. BMI(Body Mass Index)",style:
                    TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 18),),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: _bmiController,

                      decoration: InputDecoration(
                        labelText: 'Enter your BMI',
                        labelStyle: TextStyle(color: Colors.black),
                        hintText: 'BMI',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: ElevatedButton(onPressed: ()
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SymptomsTracking()),        );
                      },style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[200]
                      ),
                        child: Text("Check BMI from here",style: TextStyle(
                          color: Colors.white,
                        ),),),
                    ),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Text("3. Other Details",style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 20),),
                        SizedBox(height: 20,),

                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue, // Outline color
                              width: 2, // Outline width
                            ),
                            borderRadius: BorderRadius.circular(8), // Rounded corners
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Select Menstrual Cycle Every",
                                style: TextStyle(
                                    fontSize: 15
                                ),),
                              DropdownButton<String>(
                                value: dropdownValue1,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(globals.login)
                                        .set({"BMI": "${_bmiController.text}",
                                    },
                                        SetOptions(merge: true));

                                    dropdownValue1 = newValue!;
                                  });
                                },
                                items: <String>['2 months', '4 months', '5 months'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                dropdownColor: Colors.blue[200],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a  value';
                            }
                            return null;
                          },
                          controller: menstrualdays,
                          // decoration: InputDecoration(labelText: 'b) Duration of the menstrual cycle in days.'),
                          decoration: InputDecoration(
                            labelText: 'Enter Menstrual Cycle Duration(days)',
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Duration of the menstrual cycle in days.',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),

                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue, // Outline color
                              width: 2, // Outline width
                            ),
                            borderRadius: BorderRadius.circular(8), // Rounded corners
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(" Select if you are you pregnant?"),
                              DropdownButton<String>(
                                value: dropdownValue2,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(globals.login)
                                        .set({"BMI": "${_bmiController.text}",
                                    },
                                        SetOptions(merge: true));
                                    dropdownValue2 = newValue!;
                                  });
                                },
                                dropdownColor: Colors.blue[200],
                                items: <String>['No', 'Yes'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value';
                            }
                            return null;
                          },
                          controller: abortions,
                          // decoration: InputDecoration(labelText: 'd) Number of abortions.'),
                          decoration: InputDecoration(
                            labelText: 'Enter Number of abortions.',
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Number of abortions.',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),

                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value';
                            }
                            return null;
                          },
                          controller: hipcircumference,
                          // decoration: InputDecoration(labelText: 'e) Hip circumference in inches'),
                          decoration: InputDecoration(
                            labelText: ' Enter Hip circumference in inches.',
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: ' Enter Hip circumference in inches.',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),

                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value';
                            }
                            return null;
                          },
                          controller: waistcircumference,
                          // decoration: InputDecoration(labelText: 'f) waist circumference in inches'),
                          decoration: InputDecoration(
                            labelText: 'Enter waist circumference in inches',
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'waist circumference in inches',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),

                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value';
                            }
                            return null;
                          },
                          controller: waisthipcircumference,
                          // decoration: InputDecoration(
                          //     labelText: 'g) Ratio of the circumference of the waist to the hips'),
                          decoration: InputDecoration(
                            labelText: 'Enter Ratio of circumference waist to hips',
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Ratio of circumference waist to hips',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),

                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue, // Outline color
                              width: 2, // Outline width
                            ),
                            borderRadius: BorderRadius.circular(8), // Rounded corners
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Select if you experienced weight gain?"),
                              DropdownButton<String>(
                                value: dropdownValue3,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(globals.login)
                                        .set({"BMI": "${_bmiController.text}",
                                    },
                                        SetOptions(merge: true));

                                    dropdownValue3 = newValue!;
                                  });
                                },
                                dropdownColor: Colors.blue[200],
                                items: <String>['No', 'Yes'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              //four more to go for dropdowns
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),

                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue, // Outline color
                              width: 2, // Outline width
                            ),
                            borderRadius: BorderRadius.circular(8), // Rounded corners
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(" Select if experienced darkening of skin?"),
                              DropdownButton<String>(
                                value: dropdownValue5,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(globals.login)
                                        .set({"BMI": "${_bmiController.text}",
                                    },
                                        SetOptions(merge: true));
                                    dropdownValue5 = newValue!;
                                  });
                                },
                                dropdownColor: Colors.blue[200],
                                items: <String>['No', 'Yes'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              //four more to go for dropdowns
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue, // Outline color
                              width: 2, // Outline width
                            ),
                            borderRadius: BorderRadius.circular(8), // Rounded corners
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(" Select if experienced pimples or acne?"),
                              DropdownButton<String>(
                                value: dropdownValue6,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(globals.login)
                                        .set({"BMI": "${_bmiController.text}",
                                    },
                                        SetOptions(merge: true));
                                    dropdownValue6 = newValue!;
                                  });
                                },
                                dropdownColor: Colors.blue[200],
                                items: <String>['No', 'Yes'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              //four more to go for dropdowns
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue, // Outline color
                              width: 2, // Outline width
                            ),
                            borderRadius: BorderRadius.circular(8), // Rounded corners
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(" Select if consumes frequent fast food ?"),
                              DropdownButton<String>(
                                value: dropdownValue7,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(globals.login)
                                        .set({"BMI": "${_bmiController.text}",
                                    },
                                        SetOptions(merge: true));
                                    dropdownValue7 = newValue!;
                                  });
                                },
                                dropdownColor: Colors.blue[200],
                                items: <String>['No', 'Yes'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              //four more to go for dropdowns
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("Note: Enter number of follicles in left and right ovary if known, Enter 6 in both fields otherwise.",
                          style: TextStyle(
                              color:Colors.red
                          ),),
                        SizedBox(height: 20,),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value';
                            }
                            return null;
                          },
                          controller: folliclesInL,
                          // decoration: InputDecoration(labelText: 'm) Number of follicles in left ovary'),
                          decoration: InputDecoration(
                            labelText: 'Enter Number of follicles in left ovary',
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Number of follicles in left ovary',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),

                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value';
                            }
                            return null;
                          },
                          controller: folliclesinR,
                          // decoration: InputDecoration(labelText: 'n) Number of follicles in right ovary'),
                          decoration: InputDecoration(
                            labelText: 'Enter Number of follicles in right ovary',
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'Number of follicles in right ovary',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),

                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: ElevatedButton(onPressed: (){
                        print(_bmiController);

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
                            .set({
                          //   "ultrasonography": values,
                          // "oligoAnovulation": dropdownValue,
                          "PeriodsRegularity":dropdownValue1,
                          "menstrualduration":menstrualdays.text,
                          "pregnancy":dropdownValue2,
                          "abortions": abortions.text,
                          "hipcircumference":hipcircumference.text,
                          "waistcircumference":waistcircumference.text,
                          "ratiohiptowaist":waisthipcircumference.text,
                          "weightgain":dropdownValue3,
                          "hairgrowth":globals.ferriman<8?"No":"Yes",
                          "darkskin":dropdownValue5,
                          "pimples":dropdownValue6,
                          "fastfood":dropdownValue7,
                          "folliclesL":folliclesInL.text,
                          "folliclesR":folliclesinR.text,
                          "acneLevel":globals.acne.substring(0,1),


                        },


                            SetOptions(merge: true))
                            .then((_) {
                          print("PCOS symptoms updated successfully");
                        }).catchError((error) {
                          print("Error updating PCOS symptoms: $error");
                        });
                        int dv = 0;
                        if (dropdownValue1 == '2 months')
                        {
                          dv = 2;
                        }
                        else if (dropdownValue1 == '4 months')
                        {
                          dv = 4;
                        }
                        else
                        {
                          dv = 5;
                        };
                        //for acne
                        int acne=0;

                        if(globals.acne.substring(0,1)=='1'||globals.acne.substring(0,1)=='2'||dropdownValue6=="Yes")
                        {
                          acne=1;
                        }
                        else if(globals.acne.substring(0,1)=='0'||dropdownValue6=="No")
                        {
                          acne=0;
                        };
                        //for hirsutism through ferriman
                        int ferriman=0;
                        if(globals.ferriman>=8 || dropdownValue4=="Yes")
                        {
                          ferriman=1;
                        }
                        else if(globals.ferriman<8 || dropdownValue4=="No")
                        {
                          ferriman=0;
                        };

                        print("ferriman global"+'${globals.ferriman}');
                        Map<String,dynamic> data = {"ultrasonography": values,
                          // "oligoAnovulation": dropdownValue,
                          "PeriodsRegularity":dv,
                          "menstrualduration":menstrualdays.text,
                          "pregnancy":dropdownValue2 == "Yes"?1:0,
                          "abortions": abortions.text,
                          "hipcircumference":hipcircumference.text,
                          "waistcircumference":waistcircumference.text,
                          "ratiohiptowaist":waisthipcircumference.text,
                          "weightgain":dropdownValue3 == "Yes"?1:0,
                          "hairgrowth":globals.ferriman<=8 ? 0:1,
                          "darkskin":dropdownValue5 == "Yes"?1:0,
                          "pimples":acne,
                          "fastfood":dropdownValue7 == "Yes"?1:0,
                          "folliclesL":folliclesInL.text,
                          "folliclesR":folliclesinR.text};
                        getPrediction(data);


                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')),
                          );
                        }
                      }, style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[200]
                      ),
                          child: Text("Submit",
                            style: TextStyle(
                                color: Colors.white
                            ),)),
                    )

                  ],
                ),
              ),
            ),

          );
        },
      ),


    );
  }
}

