import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poly_forensic/globals.dart';
import '../reusable_widgets/UserImage.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart' as storage;

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SHARE YOUR EXPERIENCE",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
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
                      Text("Title",style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.bold
                      ),),
                      TextField(
                        controller: title,
                        decoration:
                        InputDecoration(border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 20,),
                      Text("Story",style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Times New Roman",
                          fontWeight: FontWeight.bold
                      ),),
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
                          ElevatedButton(
                            onPressed: () async{
                              final ref = storage.FirebaseStorage.instance.ref()
                                  .child('images')
                                  .child('${DateTime.now().toIso8601String() + p.basename(Picked!)}');

                              final result = await ref.putFile(File(Picked!));
                              final fileUrl = await result.ref.getDownloadURL();
                              imageUrl=fileUrl;
                              Map<String, dynamic> dataToAdd = {
                                "Title": title.text,
                                "Author": widget.Name,
                                "Image": imageUrl,
                                "story": description.text,
                                "status": "pending",
                                "Date":"${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}"
                              };


                              FirebaseFirestore.instance
                                  .collection("stories").doc(DateTime.timestamp().toString()).set(dataToAdd);

                              Picked="";
                            },
                            child: Text("Publish"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigo[900],
                                foregroundColor: Colors.white
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
