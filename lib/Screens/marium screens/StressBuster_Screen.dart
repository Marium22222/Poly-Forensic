import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StressBusterScreen extends StatefulWidget {
  const StressBusterScreen({Key? key}) : super(key: key);

  @override
  State<StressBusterScreen> createState() => _StressBusterScreenState();
}

class _StressBusterScreenState extends State<StressBusterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stress Busters"
        ),
        
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('cure').doc('exercises')
              .collection('stressBusters').snapshots(),
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
      DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];

      Map<String, dynamic> data =
      documentSnapshot.data() as Map<String, dynamic>;
          return Column(
            children: [
              Divider(height: 30,),
              ListTile(
                title: Row(
                  children: [
                    // Half image
                    Expanded(
                      child: Container(
                        height: 100.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(data['Image']),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0), // Space between image and text
                    // Half text
                    Expanded(
                      child: Text(
                        data['Text'],

                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold

                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );


      });
      },

          ),
    );
  }
}
