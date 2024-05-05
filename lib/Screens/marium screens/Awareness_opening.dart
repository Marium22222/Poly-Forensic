import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
appBar: AppBar(title: Text("Awareness Dialogue"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image(image: NetworkImage(widget.data["Image"]))
           ,Text(  "${widget.data['Title']}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text( widget.data["Description"]),
              ),
           //    Text("FAQs"
           //      "1. What is best food during periods?"
           //      "Foods that reduce inflammation, have high levels of antioxidants, rich in fiber, protein, vitamins, magnesium, iron and other important minerals are considered the best during periods. These include, leafy green vegetables, fish, eggs, chicken, yogurt and low GI fruits."
           //
           //     " 2. Which food is good for correct periods?"
           //      "There is a considerable number of women who dwell on what should we eat during periods to have a healthy and regular cycle. Foods that support estrogen levels are the ones that support the regular cycle. Foods like papaya, pineapple, carom seeds, aloe vera, cinnamon or fennels are great choices that promote a healthy menstrual cycle."
           //
           // ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("AUTHOR: " +widget.data["Author"]),
                  Text("SOURCE: "+widget.data["Sources"]),


                ],
              ),
              ElevatedButton(onPressed: (){

              }, child: Text("Rate Us")),
            ],
          ),
        ),
      ),
    );
  }
}
