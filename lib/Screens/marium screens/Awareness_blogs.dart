import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poly_forensic/Screens/marium%20screens/Awareness_opening.dart';

class AwarenessBlogs extends StatefulWidget {
  const AwarenessBlogs({Key? key}) : super(key: key);

  @override
  State<AwarenessBlogs> createState() => _AwarenessBlogsState();
}

class _AwarenessBlogsState extends State<AwarenessBlogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "PCOS Awareness Blogs",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('awareness').snapshots(),
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
                return InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AwarenessOpening(
                        data: data,
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                       color: Colors.pink[200],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,

                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ListTile(
                          leading: Image(
                            image: NetworkImage(data["Image"]),
                            height: 100,
                            width: 100,
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(

                                data['Title'],

                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 25),
                              ),
                              Text(
                                "Author: "+data["Author"],
                                style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,

                                    fontSize: 17),

                              ),
                              Text(
                                "Sources: "+data["Sources"],
                                style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold,

                                    fontSize: 17),
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Icon(
                                    //   Icons.star,
                                    //   color: Colors.yellow,
                                    // ),
                                    // Text("4.5",
                                    //     style: TextStyle(color: Colors.white)),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.pinkAccent),
                                      onPressed: () {},
                                      child: Text(
                                        "Read More",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ]),
                            ],
                          )),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
