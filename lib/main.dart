import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:poly_forensic/Screens/marium%20screens/AdminDashboard.dart';
import 'package:poly_forensic/Screens/marium%20screens/splash_screen.dart';
import 'package:poly_forensic/screens/BlogsAdmin.dart';
import 'package:poly_forensic/screens/BmiScreen.dart';
import 'package:poly_forensic/screens/ResultsScreen.dart';
import 'package:poly_forensic/screens/SignUp.dart';
import 'package:poly_forensic/screens/dashboard.dart';
import 'package:poly_forensic/screens/diet_dashboard.dart';
import 'package:poly_forensic/screens/loginScreen.dart';
import 'package:poly_forensic/screens/periodsSymptoms.dart';
import 'package:poly_forensic/screens/symptomsTracking.dart';
import 'package:poly_forensic/Screens/marium%20screens/Prediction_Page.dart';

import 'Screens/marium screens/know_ferriman.dart';
import 'Screens/marium screens/start_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'globals.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString("email");
  login = email;

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: email == null ? SplashScreen() : Dashboard(),
  ));
}
