import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poly_forensic/globals.dart';
import '../reusable_widgets/UserImage.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:toggle_switch/toggle_switch.dart';

class ShareExperience extends StatefulWidget {
  final String Name;
  const ShareExperience({Key? key, required this.Name}) : super(key: key);

  @override
  State<ShareExperience> createState() => _ShareExperienceState();
}

class _ShareExperienceState extends State<ShareExperience> {
  String nameofIcon = "info_outline";
  TextEditingController title = new TextEditingController();
  TextEditingController author = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController sources = new TextEditingController();
  void saveFunc() {
    print(FirebaseFirestore.instance.collection("stories").count());
  }

  String _name = "";
  bool published = false;
  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    imageUrl = null;
    published = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "SHARE YOUR EXPERIENCE",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return published == false
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                          // width: constraints.maxWidth*0.8,
                          child: Divider(
                        color: Colors.grey,
                        thickness: 2.0,
                      )),
                      Container(
                        // padding: EdgeInsets.all(2.0),
                        width: constraints.maxWidth * 0.95,
                        height: constraints.maxHeight * 0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade500),
                          // shape: BoxShape.rectangle
                        ),
                        child: UserImage(
                          onFileChanged: (imageUrl) {
                            setState(() {
                              imageUrl = imageUrl;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: constraints.maxWidth * 0.95,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Title",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.bold),
                            ),
                            TextField(
                              controller: title,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.grey[100]),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Story",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.bold),
                            ),
                            TextField(
                              controller: description,
                              maxLines: 5,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Want to share your name?",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                ToggleSwitch(
                                  customWidths: [50.0, 50.0],
                                  cornerRadius: 20.0,
                                  activeBgColors: [
                                    [Colors.indigo.shade900],
                                    [Colors.redAccent]
                                  ],
                                  activeFgColor: Colors.white,
                                  inactiveBgColor: Colors.grey,
                                  inactiveFgColor: Colors.white,
                                  totalSwitches: 2,
                                  icons: [
                                    Icons.check_outlined,
                                    Icons.cancel_sharp
                                  ],
                                  onToggle: (index) {
                                    if (index == 0) {
                                      _name = widget.Name;
                                    } else if (index == 1) {
                                      _name = "Anonymous";
                                    }
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    final ref = storage.FirebaseStorage.instance
                                        .ref()
                                        .child('images')
                                        .child(
                                            '${DateTime.now().toIso8601String() + p.basename(Picked!)}');

                                    final result =
                                        await ref.putFile(File(Picked!));
                                    final fileUrl =
                                        await result.ref.getDownloadURL();
                                    imageUrl = fileUrl;
                                    Map<String, dynamic> dataToAdd = {
                                      "Title": title.text,
                                      "Author": widget.Name,
                                      "Image": imageUrl,
                                      "story": description.text,
                                      "status": "pending",
                                      "Date":
                                          "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}"
                                    };

                                    FirebaseFirestore.instance
                                        .collection("stories")
                                        .doc(DateTime.timestamp().toString())
                                        .set(dataToAdd);

                                    Picked = "";
                                    setState(() {
                                      published = true;
                                    });
                                  },
                                  child: Text("Publish"),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.indigo[900],
                                      foregroundColor: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ): Center(
            child: Text(
              "STORY SENT FOR REVIEW",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: "Times New Roman",
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(1,1)
                    )
                  ]
              ),
            ),
          );
              // : Stack(
              //   children: [
              //     Container(
              //         width: MediaQuery.of(context).size.width,
              //         child: Image.asset("assets/images/poppers.gif",fit: BoxFit.cover,),),
              //     Center(
              //         child: Text(
              //           "STORY SENT FOR REVIEW",
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold,
              //             fontSize: 20,
              //             fontFamily: "Times New Roman",
              //             shadows: [
              //               Shadow(
              //                 color: Colors.black,
              //                 offset: Offset(1,1)
              //               )
              //             ]
              //           ),
              //         ),
              //       ),
              //   ],
              // );
        },
      ),
    );
  }
}
