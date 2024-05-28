import 'package:flutter/material.dart';

class YogaScreen extends StatefulWidget {
  final Map<String, dynamic> data;
  const YogaScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<YogaScreen> createState() => _YogaScreenState();
}

class _YogaScreenState extends State<YogaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title:Text(widget.data['Text'],style: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [

              // Text(widget.data['Text'],style: TextStyle(
              //     fontSize: 22,
              //     color: Colors.black,
              //     fontWeight: FontWeight.bold
              // ),),
            //  Image.asset("assets/images/pcos yoga.webp"),
              Image.network(widget.data['Image']),
              Text("Description",style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),),
              Text(widget.data['Description'],style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  //fontWeight: FontWeight.bold
              ),),
              Text("How to do it",style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),),
              Text(widget.data['How to do it'],style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  //fontWeight: FontWeight.bold
              ),),


              // Text("Yoga Technique No: 2",style: TextStyle(
              //     fontSize: 20,
              //     color: Colors.purple,
              //     fontWeight: FontWeight.bold
              // ),),
              // SizedBox(height: 20,),
              //
              // Image.asset("assets/images/pcosyoga2.webp"),
              // Text("Yoga Technique No: 3",style: TextStyle(
              //     fontSize: 20,
              //     color: Colors.purple,
              //     fontWeight: FontWeight.bold
              // ),),
              // SizedBox(height: 20,),
              // Image.asset("assets/images/yoga.gif"),
              // Text("Yoga Technique No: 4",style: TextStyle(
              //     fontSize: 20,
              //     color: Colors.purple,
              //     fontWeight: FontWeight.bold
              // ),),
              // Image.asset("assets/images/lowerBackWorkout.webp"),
              // SizedBox(height: 100,),
              // Text("Some more yoga poses to get you in shape",style: TextStyle(
              //     fontSize: 20,
              //     color: Colors.purple,
              //     fontWeight: FontWeight.bold
              // ),),
              // SizedBox(height: 20,),
              // Image.asset("assets/images/yogaposes.jpg")
            ],
          ),
        ),
      ),
    );
  }
}
