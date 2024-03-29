import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poly_forensic/Dialogs/periodsSymptomsDialog.dart';
import 'package:poly_forensic/globals.dart';
import 'package:table_calendar/table_calendar.dart';

class PeriodsSymptoms extends StatefulWidget {
  const PeriodsSymptoms({Key? key}) : super(key: key);

  @override
  State<PeriodsSymptoms> createState() => _PeriodsSymptomsState();
}

class _PeriodsSymptomsState extends State<PeriodsSymptoms> {
  DateTime _selectedDay=new DateTime(2024);
  DateTime _focusedDay=new DateTime(2024);
  // late Stream<DocumentSnapshot> docsnapshot;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          children: [
            Divider(),

        TableCalendar(
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            // CollectionReference periodsTracking=FirebaseFirestore.instance.collection("users");
            // String dateNow="${_selectedDay.day}-${_selectedDay.month}-${_selectedDay.year}";
            //  docsnapshot=periodsTracking.doc(login).collection("symptoms").doc(dateNow).snapshots();
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
            // StreamBuilder(stream: docsnapshot, builder: (context, snapshot) {
            //   objectsList[1]=snapshot.data.data().
            //   return Text("Fetch Completed");
            // },)
          ],
        ),
      ),
    );;
  }
}
