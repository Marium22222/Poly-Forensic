import 'package:flutter/material.dart';
import 'package:poly_forensic/Dialogs/periodsSymptomsDialog.dart';
import 'package:table_calendar/table_calendar.dart';

class PeriodsSymptoms extends StatefulWidget {
  const PeriodsSymptoms({Key? key}) : super(key: key);

  @override
  State<PeriodsSymptoms> createState() => _PeriodsSymptomsState();
}

class _PeriodsSymptomsState extends State<PeriodsSymptoms> {
  DateTime _selectedDay=new DateTime(2024);
  DateTime _focusedDay=new DateTime(2024);
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
        TableCalendar(
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay; // update `_focusedDay` here as well
            });
            showDialog(context: context, builder: (context) => PeriodsSymptomsDialog(dateToday: _selectedDay,),);
          },
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
        ),

          ],
        ),
      ),
    );;
  }
}
