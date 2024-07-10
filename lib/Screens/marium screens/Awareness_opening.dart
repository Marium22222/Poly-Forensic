import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AwarenessOpening extends StatefulWidget {
  final Map<String, dynamic> data;
  const AwarenessOpening({Key? key, required this.data}) : super(key: key);

  @override
  State<AwarenessOpening> createState() => _AwarenessOpeningState();
}

class _AwarenessOpeningState extends State<AwarenessOpening> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("PCOS Blogs"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(image: NetworkImage(widget.data["Image"]),height: 200,
              width: 200,),
              Divider(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "${widget.data['Title']}",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: "Times New Roman"),
                ),

              ),
              Divider(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  widget.data["Description"],
                  style: TextStyle(
                    fontFamily: "Times New Roman"
                  ),
                  textAlign: TextAlign.justify,

                ),
              ),
Divider(
  height: 100,
),
              Text(
                "Written By : " + widget.data["Author"],
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 15),
              ),
              Text(
                "Sources : " + widget.data["Sources"],
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Divider(
                height: 50,
              ),
              Text("Was this helpful?"),
              ElevatedButton(
                  onPressed: () async {
                    final Uri url = Uri.parse(widget.data['Link']);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(0xfffFF91A4),
                  ),
                  child: Text("Learn More",
                  style: TextStyle(
                    color: Colors.white
                  ),)),
            ],
          ),
        ),
      ),
    );
  }
}
