import 'package:flutter/material.dart';

class StoryDialog extends StatefulWidget {
  final Map<String, dynamic> data;
  const StoryDialog({Key? key, required this.data}) : super(key: key);

  @override
  State<StoryDialog> createState() => _StoryDialogState();
}

class _StoryDialogState extends State<StoryDialog> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                height: constraints.maxHeight * 0.6,
                width: constraints.maxWidth * 0.8,
                child: Column(children: [
                  Text(
                    "${widget.data['Title']}",
                    style: TextStyle(
                        color: Colors.pink,
                        fontFamily: "Times New Roman",
                        fontSize: 20,
                        letterSpacing: 1.3,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 3.0),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "${widget.data['story']}",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Times New Roman",
                        letterSpacing: 1.3,
                        fontSize: 17,
                        wordSpacing: 3.0),
                    textAlign: TextAlign.justify,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      Column(
                        children: [
                          Text("${widget.data["Author"]}",
                          style: TextStyle(
                            color: Colors.pink
                          ),
                          ),
                          Text("${widget.data["Date"]}"),
                        ],
                      )
                    ],
                  )

                ]
                )
            ));
      },
    );
  }
}
