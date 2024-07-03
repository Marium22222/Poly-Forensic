import 'package:flutter/material.dart';

class DashboardCards extends StatefulWidget {
  final String image;
  final String title;
  final String descritpion;
  const DashboardCards(
      {Key? key, required this.image, required this.descritpion, required this.title})
      : super(key: key);

  @override
  State<DashboardCards> createState() => _DashboardCardsState();
}

class _DashboardCardsState extends State<DashboardCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0,vertical: 20),
      child: Column(
        children: [
          Image.asset(
            widget.image,
            width: 100,
            height: 100,
          ),
          Text(widget.title,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),),
          SizedBox(
            width: MediaQuery.sizeOf(context).width*0.6,
              child: Text(widget.descritpion,textAlign: TextAlign.justify,)
          )
        ],
      ),
    );
  }
}
