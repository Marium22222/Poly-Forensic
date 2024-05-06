import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MealPlans extends StatefulWidget {
  const MealPlans({Key? key}) : super(key: key);

  @override
  State<MealPlans> createState() => _MealPlansState();
}

class _MealPlansState extends State<MealPlans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              height: constraints.maxHeight,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: constraints.maxWidth,
                    height: constraints.maxHeight*0.4,
                    decoration: BoxDecoration(
                      color: Colors.teal[300],
                    ),
                    child: Text("Meal Plans",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: "Times New Roman"
                    ),),
                  ),
                  Positioned(
                    top: constraints.maxHeight*0.25,
                    child: Container(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(90)),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                            padding: EdgeInsets.all(20),
                            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                              stream: FirebaseFirestore.instance
                                  .collection('cure').doc('Diet').collection('MealPlans').snapshots(),
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
                                        children: [
                                          ClipRRect(
                                            // borderRadius: BorderRadius.circular(200),
                                            child: Image.network(
                                              "${data['image']}",
                                              width: 90,
                                              height: 90,
                                            ),
                                          ),
                                          SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                          SizedBox(
                                            width: 130,
                                            child: Text(
                                              "${data['name']}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: "Merriweather",
                                              ),),
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
                  )
                ],
              ),
            );
          },
        
        ),
      ),
    );
  }
}
