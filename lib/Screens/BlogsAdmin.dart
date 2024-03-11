import 'package:flutter/material.dart';
import 'package:poly_forensic/reusable_widgets/UserImage.dart';

class BlogsAdminScreen extends StatefulWidget {
  const BlogsAdminScreen({Key? key}) : super(key: key);

  @override
  State<BlogsAdminScreen> createState() => _BlogsAdminScreenState();
}

class _BlogsAdminScreenState extends State<BlogsAdminScreen> {
  String imageUrl = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "UPLOAD NEW ARTICLE",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
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
                      this.imageUrl = imageUrl;
                    });
                  },
                ),
              ),
              Container(
                width: constraints.maxWidth*0.95,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Title"),
                    TextField()
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
