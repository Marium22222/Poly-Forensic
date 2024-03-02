import 'package:flutter/material.dart';

class PeriodsSymptoms extends StatefulWidget {
  const PeriodsSymptoms({Key? key}) : super(key: key);

  @override
  State<PeriodsSymptoms> createState() => _PeriodsSymptomsState();
}

class _PeriodsSymptomsState extends State<PeriodsSymptoms> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          children: [
            Divider(),
            Text(
              "TRACK PERIODS CYCLE",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );;
  }
}
