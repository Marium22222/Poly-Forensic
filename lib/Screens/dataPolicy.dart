import 'package:flutter/material.dart';

class DataPolicy extends StatefulWidget {
  const DataPolicy({super.key});

  @override
  State<DataPolicy> createState() => _DataPolicyState();
}

class _DataPolicyState extends State<DataPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("DATA POLICY"),
      ),
      body: SingleChildScrollView(
        child: Text("bh"),
      )
    );
  }
}
