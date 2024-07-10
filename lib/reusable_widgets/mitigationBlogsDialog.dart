import 'package:flutter/material.dart';

class MitigationBlogsDialog extends StatefulWidget {
  final Map<String, dynamic> data;
  const MitigationBlogsDialog({Key? key, required this.data}) : super(key: key);

  @override
  State<MitigationBlogsDialog> createState() => _MitigationBlogsDialogState();
}

class _MitigationBlogsDialogState extends State<MitigationBlogsDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.35,
                decoration: BoxDecoration(
                  color: widget.data['Image']==""?Colors.pink.shade100:Colors.white,
                  image: DecorationImage(
                    image: NetworkImage("${widget.data['Image']}"),
                    opacity: 0.73,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.data['Title']}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: "Times New Roman",
                          shadows: [
                            Shadow(
                                color: Colors.black54,
                                blurRadius: 5,
                                offset: Offset(0, 2))
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${widget.data['Author']}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        fontFamily: "Times New Roman"),
                  ),
                  Text("${widget.data['Date']}",style: TextStyle(
                    // fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade500,
                      fontFamily: "Times New Roman"
                  ),),
                ],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text(
                  "${widget.data['Details']}",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15,
                    wordSpacing: 5,
                    letterSpacing: 2,
                    height: 2,
                    fontFamily: "Times New Roman"
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
