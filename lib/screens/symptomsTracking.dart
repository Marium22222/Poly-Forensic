import 'package:flutter/material.dart';

class SymptomsTracking extends StatefulWidget {
  const SymptomsTracking({Key? key}) : super(key: key);

  @override
  State<SymptomsTracking> createState() => _SymptomsTrackingState();
}

class _SymptomsTrackingState extends State<SymptomsTracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TRACK YOUR SYMPTOMS',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontFamily: "Times New Roman"),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              children: [
                Text("Track BMI",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.black,
                        width: 8
                      )
                    )
                  ),
                  child: Column(
                    children: [
                      Text("WEIGHT"),
                      Text("HEIGHT")
                    ],
                  ),
                ),
              ],
            ),
            Text("GRAPH")
          ],
        ),
      ),
    );
  }
}
