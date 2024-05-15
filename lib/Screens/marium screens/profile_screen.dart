import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poly_forensic/Screens/marium%20screens/profile_update.dart';
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

    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [

              Color(0xffD660CA),
              Color(0xFF26CBC0),
            ], begin: Alignment.topCenter, end: Alignment.center)),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('users').doc(globals.login).snapshots(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    if (!snapshot.hasData) {
    return CircularProgressIndicator();
    }
    var userDocument = snapshot.data;
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
    // AssetImage('assets/profile_img.jpeg'),
    NetworkImage(
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWomPds9w5emH_C6RY8xF7KRCJe6I5zwVsuw&usqp=CAU"),
    radius: _height / 10,
    ),
    SizedBox(
    height: _height / 30,
    ),
    Text(
      userDocument!['username'],
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
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    headerChild('BMI',  userDocument!['BMI']+"kg/m2"),
    headerChild('Acne', "yes"),
    headerChild('Hirsutism', "No"),
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
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    headerChild('Age',  userDocument!['age'].toString()+"years"),
    headerChild('Weight',  userDocument!['weight'].toString()+"Kgs"),
    headerChild('Height', userDocument!['height'].toString()+"Inches"),
    ]),
    ),
    ),
    Padding(
    padding: EdgeInsets.only(top: _height / 20),
    child: Column(
    children: <Widget>[
    infoChild(
    _width, Icons.email, globals.login),
    infoChild(_width, Icons.call, userDocument!['Phoneno'].toString()),
    // infoChild(
    //     _width, Icons.group_add, 'Add to group'),
    // infoChild(_width, Icons.chat_bubble,
    //     'Show all comments'),
    Padding(
    padding: EdgeInsets.only(top: _height / 30),
    child: Container(
    width: _width / 3,
    height: _height / 20,
    decoration: BoxDecoration(
    // color: Color(0xFF26CBE6),
    color:Color(0xffD660CA),
    borderRadius: BorderRadius.all(
    Radius.circular(_height / 40)),
    boxShadow: [
    BoxShadow(
    color: Colors.black87,
    blurRadius: 2.0,
    offset: Offset(0.0, 1.0))
    ]),
    child: Center(
    child: InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>ProfileUpdate()),
        );
      },
      child: Text('UPDATE',
      style: TextStyle(
      fontSize: 12.0,
      color: Colors.white,
      fontWeight: FontWeight.bold)),
    ),
    ),
    ),
    )
    ],
    ),
    )
    ],
    ),
    )
    ],
    ),
    );
    },
          ),

          ),  ], ),
    );



    }


  Widget headerChild(String header, String value) => Expanded(
          child: Column(
        children: <Widget>[
          Text(header,
            style: TextStyle(
                fontSize: 20.0,
                color:Colors.black,
                fontWeight: FontWeight.bold),),
          SizedBox(
            height: 8.0,
          ),
          Text(
            '$value',
            style: TextStyle(
                fontSize: 18.0,
                color:Color(0xffD660CA),
                fontWeight: FontWeight.bold),
          )
        ],
      ));

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
                color:Color(0xffD660CA),
                size: 40.0,
              ),
              SizedBox(
                width: width / 20,
              ),
              Text(data,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
            ],
          ),
          onTap: () {
            print('Info Object selected');
          },
        ),
      );
}
