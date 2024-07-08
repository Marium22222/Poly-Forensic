import 'package:cloud_firestore/cloud_firestore.dart';
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
        title: Text("DATA POLICY",
          style: TextStyle(
              fontFamily: "Times New Roman",
            fontWeight: FontWeight.bold
          ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('data_policy')
              .snapshots(),
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
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                DocumentSnapshot documentSnapshot =
                snapshot.data!.docs[index];

                Map<String, dynamic> data =
                documentSnapshot.data() as Map<String, dynamic>;

                return Column(
                  children: [
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.check_box,color: Colors.green,),
                      title:  Text('${data['policy']}',
                        style: TextStyle(
                            fontFamily: "Times New Roman",
                            fontSize: 15
                        ),textAlign: TextAlign.justify,),
                    ),
                    Divider()
                  ],
                );
              },
            );
          },
        ),
      )
    );
  }
}
