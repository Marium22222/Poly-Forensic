import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Dialogs/storyDialog.dart';

class ApprovalUserStory extends StatefulWidget {
  const ApprovalUserStory({Key? key}) : super(key: key);

  @override
  State<ApprovalUserStory> createState() => _ApprovalUserStoryState();
}

class _ApprovalUserStoryState extends State<ApprovalUserStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
          Text("Approval User Story")),
      body:  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('stories')
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

            itemBuilder: (context, index) {
              DocumentSnapshot documentSnapshot =
              snapshot.data!.docs[index];

              Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

              if(data['status']=='approved')
              {
                return Text("");
              }
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => StoryDialog(data: data),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    border:Border(
                      left: BorderSide(
                          color: Colors.grey,
                          width: 3
                      ),  bottom: BorderSide(
                        color: Colors.grey,
                        width: 3
                    ),

                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        height:
                        MediaQuery.sizeOf(context).height * 0.2,
                        child: Image.network(data['Image'],
                            fit: BoxFit.cover,
                            width: 150,
                            height: 100),
                      ),
                      Container(
                        width:
                        MediaQuery.sizeOf(context).width * 0.52,
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${data["Title"]}",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${data["Date"]}",
                                  style:
                                  TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Text(
                              "${data["story"]}",
                              textAlign: TextAlign.justify,
                              maxLines: 4,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(data['status']),
                                SizedBox(),
                                Text(
                                  "~${data["Author"]}",
                                  style:
                                  TextStyle(color: Colors.pink),
                                )
                              ],
                            ),
                            ElevatedButton(onPressed: (){
                              FirebaseFirestore.instance
                                  .collection("stories")
                                  .doc(documentSnapshot.id)
                                  .set({"status": "approved"},
                                  SetOptions(merge: true));
                            }, child: Text("Approve")),
                            ElevatedButton(onPressed: (){
                              FirebaseFirestore.instance
                                  .collection("stories")
                                  .doc(documentSnapshot.id)
                                  .set({"status": "Disapproved"},
                                  SetOptions(merge: true));
                            }, child: Text("Disapprove"))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
