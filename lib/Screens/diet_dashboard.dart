import 'package:flutter/material.dart';

class DietDashboard extends StatefulWidget {
  const DietDashboard({Key? key}) : super(key: key);

  @override
  State<DietDashboard> createState() => _DietDashboardState();
}

class _DietDashboardState extends State<DietDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("Diet Dashboard"),
      ),
    );
  }
}
