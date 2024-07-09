import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poly_forensic/Screens/marium%20screens/profile_update.dart';
import 'package:poly_forensic/Screens/marium%20screens/rotterdam_symptoms_screen.dart';
import 'package:poly_forensic/globals.dart' as globals;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    // String ferrimanGallweyScore = "N/A";
    String acne = "N/A";

    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xfffFF91A4),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(globals.login)
                  .snapshots(),
              builder: (context, userSnapshot) {
                if (!userSnapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                var userDocument = userSnapshot.data;
                return StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(globals.login)
                      .collection('symptoms')
                      .doc('pcos_symptoms')
                      .snapshots(),
                  builder: (context, additionalInfoSnapshot) {
                    if (!additionalInfoSnapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    var additionalInfo = additionalInfoSnapshot.data!.data() as Map<String, dynamic>?;

                    // Check for ferrimanGallweyScore field
                    // if (userDocument != null &&  userDocument.containsKey('ferrimanGallweyScore')) {
                    //   var score = additionalInfo['ferrimanGallweyScore'];
                    //   if (score == "") {
                    //     ferrimanGallweyScore = "N/A";
                    //   } else if (score <= 8) {
                    //     ferrimanGallweyScore = "No";
                    //   } else {
                    //     ferrimanGallweyScore = "Yes";
                    //   }
                    // } else {
                    //   ferrimanGallweyScore = "N/A";
                    // }


                    // Check for acneLevel field (if needed)
                    if (additionalInfo != null && additionalInfo.containsKey('acneLevel')) {
                      String acneLevel = additionalInfo['acneLevel'];
                      if (acneLevel == "") {
                        acne = "N/A";
                      } else if (acneLevel.substring(0,1)== '1' || acneLevel.substring(0,1) == '2') {
                        acne = "Yes";
                      } else {
                        acne = "No";
                      }
                    } else {
                      acne = "N/A";
                    }

                    var bmi = userDocument!['BMI'];
                    return Container(
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.only(top: _height / 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage:
                                    AssetImage("assets/images/piccc.png"),
                                    radius: _height / 10,
                                  ),
                                  SizedBox(
                                    height: _height / 30,
                                  ),
                                  Text(
                                    userDocument['username'],
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: _height / 2.2),
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: _height / 2.6,
                                left: _width / 20,
                                right: _width / 20),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black45,
                                            blurRadius: 2.0,
                                            offset: Offset(0.0, 2.0))
                                      ]),
                                  child: Padding(
                                    padding: EdgeInsets.all(18),
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: <Widget>[
                                          headerChild('BMI',
                                              userDocument['BMI']==""?"N/A":  userDocument['BMI']+
                                                  "kg/m2"),
                                          headerChild('Acne', acne),
                                          headerChild('Hirsutism', userDocument['ferrimanGallweyScore']<8?"No":"Yes"),
                                        ]),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black45,
                                            blurRadius: 2.0,
                                            offset: Offset(0.0, 2.0))
                                      ]),
                                  child: Padding(
                                    padding: EdgeInsets.all(_width / 20),
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: <Widget>[
                                          headerChild(
                                              'Age',
                                              userDocument['age'].toString() +
                                                  " years"),
                                          headerChild(
                                              'Weight',
                                              userDocument['weight']
                                                  .toString()==""? "N/A" : userDocument['weight']
                                                  .toString()+
                                                  " Kgs"),
                                          headerChild(
                                              'Height ',
                                              userDocument['height']
                                                  .toString() ==""? "N/A" : userDocument['height']
                                              .toString()+
                                                  " Inch"),
                                        ]),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: _height / 20),
                                  child: Column(
                                    children: <Widget>[
                                      infoChild(_width, Icons.email,
                                          globals.login),
                                      infoChild(
                                          _width,
                                          Icons.call,
                                          userDocument['Phoneno']
                                              .toString()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget headerChild(String header, String value) => Expanded(
    child: Column(
      children: <Widget>[
        Text(
          header,
          style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: "Roboto"),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          '$value',
          style: TextStyle(
              fontSize: 18.0,
              color: Color(0xfffFF91A4),
              fontWeight: FontWeight.bold,
              fontFamily: "Roboto"),
        )
      ],
    ),
  );

  Widget infoChild(double width, IconData icon, data) => Padding(
    padding: EdgeInsets.only(bottom: 8.0),
    child: InkWell(
      child: Row(
        children: <Widget>[
          SizedBox(
            width: width / 10,
          ),
          Icon(
            icon,
            color: Color(0xfffFF91A4),
            size: 35.0,
          ),
          SizedBox(
            width: width / 20,
          ),
          Text(
            data,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto"),
          )
        ],
      ),
      onTap: () {
        print('Info Object selected');
      },
    ),
  );
}
