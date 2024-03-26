import 'package:flutter/material.dart';

class RotterdamCards extends StatefulWidget {
  final String image;
  final String caption;
  final Color color1;
  final Color color2;
  const RotterdamCards({Key? key, required this.image, required this.caption, required this.color1, required this.color2}) : super(key: key);

  @override
  State<RotterdamCards> createState() => _RotterdamCardsState();
}

class _RotterdamCardsState extends State<RotterdamCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width*0.26,
      height: MediaQuery.sizeOf(context).height*0.2,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            colors: [widget.color1,widget.color2],
          stops: [0.1,0.4],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),
      ),
      child: Column(
        children: [
          Image.asset(widget.image,width: 80,height: 80,),
          SizedBox(
              width:80,
              child: Text("${widget.caption}",textAlign: TextAlign.center,),)
        ],
      ),
    );
  }
}
