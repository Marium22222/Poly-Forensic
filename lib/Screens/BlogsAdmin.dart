import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poly_forensic/globals.dart';
import 'package:poly_forensic/reusable_widgets/UserImage.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'dart:io';

class BlogsAdminScreen extends StatefulWidget {
  const BlogsAdminScreen({Key? key}) : super(key: key);

  @override
  State<BlogsAdminScreen> createState() => _BlogsAdminScreenState();
}

class _BlogsAdminScreenState extends State<BlogsAdminScreen> {
  String nameofIcon = "info_outline";
  TextEditingController title = new TextEditingController();
  TextEditingController author = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController sources = new TextEditingController();
  TextEditingController Link = new TextEditingController();
  void saveFunc() {
    print(FirebaseFirestore.instance.collection("awareness").count());
  }
@override
  void initState() {
    // TODO: implement initState
    imageUrl=null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "UPLOAD NEW ARTICLE",
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
                  height: constraints.maxHeight * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
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
                      Text("Author Name"),
                      TextField(
                        controller: author,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                      Text("Title"),
                      TextField(
                        controller: title,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                      Text("Description"),
                      TextField(
                        controller: description,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Text("Link"),
                      TextField(
                        controller: Link,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Text("Sources"),
                      TextField(
                        controller: sources,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
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
                                  "Author": author.text,
                                  "Image": imageUrl,
                                  "Description": description.text,
                                  "Sources": sources.text,
                                  "Link":Link.text
                                };

                                FirebaseFirestore.instance
                                    .collection("awareness").doc(DateTime.timestamp().toString()).set(dataToAdd);

                                Picked="";
                                imageUrl=null;
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
