import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Dialogs/meals_nutritions_dialog.dart';

class SnackPlans extends StatefulWidget {
  const SnackPlans({Key? key}) : super(key: key);

  @override
  State<SnackPlans> createState() => _BreakfastPlansState();
}

class _BreakfastPlansState extends State<SnackPlans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('cure').doc('Diet').collection('Snacks').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child:
                        CircularProgressIndicator()); //return means the bottom code wont run
                  }
                  if (snapshot.data == null || snapshot.hasError) {
                    return const Center(child: Text("DATA NOT AVAILABLE"));
                  }


                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,

                    itemBuilder: (context, index) {
                      DocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];

                      Map<String, dynamic> data =
                      documentSnapshot.data() as Map<String, dynamic>;

                      return Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                              // borderRadius: BorderRadius.circular(200),
                              child: Image.network(
                                "${data['image']}",
                                width: 90,
                                height: 90,
                              ),
                            ),
                            SizedBox(
                              width: 130,
                              child: Text(
                                "${data['name']}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Merriweather",
                                ),),
                            ),
                            GestureDetector(
                                onTap:(){
                                  showDialog(context: context, builder: (context) => MealsNutritionDialog(data: data,),);
                                },
                                child: Icon(Icons.arrow_forward_ios_rounded)
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              )
          ),
        ),
      ),
    );
  }
}
