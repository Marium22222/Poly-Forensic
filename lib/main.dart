import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:poly_forensic/Screens/marium%20screens/AdminDashboard.dart';
import 'package:poly_forensic/screens/BlogsAdmin.dart';
import 'package:poly_forensic/screens/BmiScreen.dart';
import 'package:poly_forensic/screens/ResultsScreen.dart';
import 'package:poly_forensic/screens/SignUp.dart';
import 'package:poly_forensic/screens/dashboard.dart';
import 'package:poly_forensic/screens/loginScreen.dart';
import 'package:poly_forensic/screens/periodsSymptoms.dart';
import 'package:poly_forensic/screens/symptomsTracking.dart';

import 'Screens/marium screens/know_ferriman.dart';
import 'Screens/marium screens/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Dashboard(),));
}
