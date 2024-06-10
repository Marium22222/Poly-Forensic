import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:poly_forensic/Custom%20Widgets/periodsSymptomDialogOptions.dart';
import 'package:poly_forensic/Dialogs/trial.dart';
import 'package:poly_forensic/globals.dart' as globals;

import '../globals.dart';

class PeriodsSymptomsDialog extends StatefulWidget {
  final DateTime dateToday;
  const PeriodsSymptomsDialog({Key? key, required this.dateToday})
      : super(key: key);

  @override
  State<PeriodsSymptomsDialog> createState() => _PeriodsSymptomsDialogState();
}

class _PeriodsSymptomsDialogState extends State<PeriodsSymptomsDialog> {
  Map<String, dynamic> values = {
    "_num11": "Heavy",
    "_num12": "Medium",
    "_num13": "Light",
    "_num21": "Severe",
    "_num22": "Moderate",
    "_num23": "Normal",
    "_num31": "Good",
    "_num32": "Oily",
    "_num33": "Dry",
    "_num34": "Acne"
  };

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
      stream: FirebaseFirestore.instance.collection("users").doc(login).collection("symptoms").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child:
              CircularProgressIndicator()); //return means the bottom code wont run
        }
        if (snapshot.data == null || snapshot.hasError) {
          return const Center(child: Text("DATA NOT AVAILABLE"));
        }
        String formatDate="${widget.dateToday.day}-${widget.dateToday.month}-${widget.dateToday.year}";
        return LayoutBuilder(
          builder: (context, constraints)
        {
          Map<String, dynamic> symptoms = snapshot.data!.docs[0].data() as Map<
              String,
              dynamic>;
          print(symptoms["notes"]);
          DocumentSnapshot documentSnapshot = snapshot.data!.docs[1];
          CollectionReference collectionReference =
          documentSnapshot.reference.collection("${formatDate}");
          print(collectionReference);

          return SingleChildScrollView(
              child: Center(
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: constraints.maxWidth * 0.9,
                    height: constraints.maxHeight *0.9,
                    child: Column(
                      children: [
                        SizedBox(
                          height: constraints.maxHeight*0.9,
                            child: Trial(collectionReference: collectionReference, doc: formatDate, dateToday: widget.dateToday,))
                      ],
                    ),

                          ),
              )
          );
          },
        );
      },
    );
  }
}
