import 'package:flutter/material.dart';

class RotterdamCardDialog extends StatefulWidget {
  final String text;
  const RotterdamCardDialog({Key? key, required this.text}) : super(key: key);

  @override
  State<RotterdamCardDialog> createState() => _StoryDialogState();
}

class _StoryDialogState extends State<RotterdamCardDialog> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurpleAccent.shade100,
                      Colors.purple.shade200,
                    ],
                    stops: [0.1,0.4],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                ),
                padding: EdgeInsets.all(10),
                height: constraints.maxHeight * 0.5,
                width: constraints.maxWidth * 0.8,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      Column(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.cancel,
                                size: 30,
                              ))
                        ],
                      )
                    ],
                  ),
                  Text(
                      "${widget.text}",
                    style:TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ) ,textAlign: TextAlign.justify,)
                ])));
      },
    );
  }
}
