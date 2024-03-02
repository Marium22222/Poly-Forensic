import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:poly_forensic/screens/symptomsTracking.dart';

import 'Screens/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: SymptomsTracking(),));
}
