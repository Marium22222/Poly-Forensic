import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poly_forensic/reusable_widgets/mitigationBlogsDialog.dart';
import 'dart:math' as math;

class MitigationBlogs extends StatefulWidget {
  const MitigationBlogs({Key? key}) : super(key: key);

  @override
  State<MitigationBlogs> createState() => _MitigationBlogsState();
}

class _MitigationBlogsState extends State<MitigationBlogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "BLOGS",
          style: TextStyle(
              fontSize: 16,
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.bold,
              color: Colors.teal[900],
              letterSpacing: 3),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection("cure")
              .doc("Blogs")
              .collection("Blogs")
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
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  // Color rand_color = Color.fromRGBO(
                  //   math.Random().nextInt(255),
                  //   math.Random().nextInt(255),
                  //   math.Random().nextInt(255),
                  //   math.Random().nextDouble(),
                  // );
                  DocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                  Map<String, dynamic> data =
                      documentSnapshot.data() as Map<String, dynamic>;
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MitigationBlogsDialog(data: data),
                      ));
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: MediaQuery.sizeOf(context).height * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.23,
                            height: MediaQuery.sizeOf(context).height * 0.12,
                            margin: EdgeInsets.symmetric(
                                horizontal: 2, vertical: 14),
                            // decoration: BoxDecoration(color: rand_color),
                            decoration: BoxDecoration(color: Colors.pink.shade100),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 25),
                            width: MediaQuery.sizeOf(context).width * 0.85,
                            height: MediaQuery.sizeOf(context).height * 0.15,
                            decoration: BoxDecoration(color: Colors.white),
                            child: Row(
                              children: [
                                data['Image'] == ""
                                    ? SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: Icon(Icons.image,size:100,color: Colors.grey,))
                                    : Image.network(
                                        '${data['Image']}',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      child: Text(
                                        "${data['Title']}",
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "${data['Date']}",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text("${data['Author']}"),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
