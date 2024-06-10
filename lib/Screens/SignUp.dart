import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poly_forensic/reusable_widgets/UserImage.dart';
import 'package:poly_forensic/screens/ResultsScreen.dart';
import 'package:poly_forensic/screens/loginScreen.dart';
import '../reusable_widgets/reusable_widgets.dart';
// import '../utils/colors_utils.dart';
// import 'Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _phnoTextController = TextEditingController();
  TextEditingController _deptTextController = TextEditingController();
  TextEditingController _ageTextController = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection("users");
  AsciiEncoder asciEncoder=new AsciiEncoder();
  validEmail(){
    final bool emailValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailTextController.text);
    return emailValid;
  }
  bool isNotStringOnly(String str) {
    for(var i=0;i<str.length;i++){
      if(str[i]=='1'||str[i]=='2'||str[i]=='3'||str[i]=='4'||str[i]=='5'||str[i]=='6'||str[i]=='7'||str[i]=='8'||str[i]=='9'||str[i]=='#'||str[i]=='@'||str[i]=='!'||str[i]=='/'||str[i]=='\/'||str[i]=='*'||str[i]=='\$'){
        return true;
        break;
      }
    }
    return false;
  }
  validPassword(){
    final bool passValid=_passwordTextController.text.length>8 && isNotStringOnly(_passwordTextController.text)?true:false;
    return passValid;
  }
  validPhoneNumber(){
    final bool validPhoneNumber= _phnoTextController.text.length==11 && int.parse(_phnoTextController.text)!=null?true:false;
    return validPhoneNumber;
  }

  // String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.pink[300],
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 80,
                ),
                Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),
                Text(
                  'User please fill the input below',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Enter Your Full Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                textField("", Icons.person_outline, false,
                    _nameTextController),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Enter Email ID',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                textField("", Icons.email_outlined, false,
                    _emailTextController),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Enter Pasword',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                textField("", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Enter Phone no.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                textField("", Icons.phone_android_outlined, false,
                    _phnoTextController),
                const SizedBox(
                  height: 30,
                ),
                // Text(
                //   'Enter Department',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 18,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // textField("", Icons.house_siding_outlined, false,
                //     _deptTextController),
                // const SizedBox(
                //   height: 30,
                // ),
                Text(
                  'Enter Age',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                textField("", Icons.female, false,
                    _ageTextController),
                const SizedBox(
                  height: 40,
                ),
                // Center(
                //   child: UserImage(
                //       onFileChanged: (imageUrl) {
                //         setState(() {
                //           this.imageUrl = imageUrl;
                //         });
                //       }
                //   ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                Center(
                  child: signinSignupButton(context, false, () async {
                    if(validPhoneNumber()&&validEmail()&&validPassword()){
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text).then((value) {
                        print("New Account Created!");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LoginScreen()));
                      }).onError((error, stackTrace){
                        print("Error ${error.toString()}");
                      });
                     
                      await users.doc(_emailTextController.text).set({
                        "username":_nameTextController.text,
                        "password":_passwordTextController.text,
                        "Phoneno":_phnoTextController.text,
                        "age":_ageTextController.text,
                        "height":0,
                        "weight":0,
                        "BMI":0,
                        "lastPeriodDate":"",
                        "expectedPeriodDate":"",
                      }).then((value) {
                        print("Added user!");
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => ResultsScreen()));
                      }).onError((error, stackTrace){
                        print("Error ${error.toString()}");
                      });

                      await users.doc(_emailTextController.text).collection("symptoms").doc("periods_symptoms").set({});
                      await users.doc(_emailTextController.text).collection("symptoms").doc("pcos_symptoms").set({
                        "PeriodsRegularity":"",
                        "abortions":"",
                        "darkskin":"",
                        "fastfood":"",
                        "folliclesL":"",
                        "folliclesR":"",
                        "hairgrowth":"",
                        "hipcircumference":"",
                        "hyperandrogenism":{""," "},
                        "oligoAnovulation":"",
                        "menstrualduration":"",
                        "pimples":"",
                        "pregnancy":"",
                        "ratiohiptowaist":"",
                        "ultrasonography":{""," ","  "},
                        "waistcircumference":"",
                        "weightgain":"",
                      });
                    }}),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
