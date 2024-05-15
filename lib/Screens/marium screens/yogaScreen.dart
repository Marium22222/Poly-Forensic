import 'package:flutter/material.dart';

class YogaScreen extends StatefulWidget {
  const YogaScreen({Key? key}) : super(key: key);

  @override
  State<YogaScreen> createState() => _YogaScreenState();
}

class _YogaScreenState extends State<YogaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yoga"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Some effective yoga exercises for PCOS",style: TextStyle(
              fontSize: 20,
              color: Colors.purple,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 50,),
            Text("Yoga Technique No: 1",style: TextStyle(
                fontSize: 20,
                color: Colors.purple,
                fontWeight: FontWeight.bold
            ),),
            Image.asset("assets/images/pcos yoga.webp"),
            Text("Yoga Technique No: 2",style: TextStyle(
                fontSize: 20,
                color: Colors.purple,
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 20,),

            Image.asset("assets/images/pcosyoga2.webp"),
            Text("Yoga Technique No: 3",style: TextStyle(
                fontSize: 20,
                color: Colors.purple,
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 20,),
            Image.asset("assets/images/yoga.gif"),
            Text("Yoga Technique No: 4",style: TextStyle(
                fontSize: 20,
                color: Colors.purple,
                fontWeight: FontWeight.bold
            ),),
            Image.asset("assets/images/lowerBackWorkout.webp"),
            SizedBox(height: 100,),
            Text("Some more yoga poses to get you in shape",style: TextStyle(
                fontSize: 20,
                color: Colors.purple,
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 20,),
            Image.asset("assets/images/yogaposes.jpg")
          ],
        ),
      ),
    );
  }
}
