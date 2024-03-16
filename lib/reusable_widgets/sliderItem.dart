import 'package:flutter/material.dart';

class SliderItem extends StatelessWidget {
  final String question;
  final String answer;
  final String image;

  const SliderItem({Key? key, required this.question, required this.answer, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, MediaQuery.sizeOf(context).height*0.1, 120, 8),
      decoration: BoxDecoration(
          image: DecorationImage(
              opacity: 0.7,
              image: AssetImage(image),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          Text(question,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          Text(
              answer,
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 16,
            letterSpacing: 2.0,
            fontFamily: "Merriweather"
          ),
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
