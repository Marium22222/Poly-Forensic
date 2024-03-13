import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AwarenessOpening extends StatefulWidget {
  const AwarenessOpening({Key? key}) : super(key: key);

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
              Image(image: NetworkImage("https://www.shutterstock.com/image-photo/stethoscope-on-note-book-womens-260nw-572706325.jpg"))
           ,Text("Blog1 : Happy women day",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Women start their menstrual cycle when they hit puberty. A normal cycle lasts between 24 and 38 days with the menstrual flow lasting between 5 to 8 days. The cycle also comes with menstrual pain or cramps that present itself in the pelvic or lower abdominal region. There are also other discomforting symptoms of periods such as irritation, back pain, depression, diarrhea, nausea, etc. irregularity of the cycle is also another major concern that women face. However, consumption of healthy meals and an overall nutritious diet plays a crucial role in reducing the symptoms during menstruation as well as keeping the cycle regular. Hydration is an important factor of health diet thus consuming watermelon and cucumber helps with hydration alongwith satiating the sweet cravings. The iron levels in the body fall short during periods which give ways to the feeling of dizziness, fatigue and pain. Leafy green vegetables like kale or spinach increase the iron and magnesium intake helping you with its deprivation during the cycle. Turmeric with its anti-inflammatory properties is known to reduce the symptoms of periods substantially. Below given blog dives deep into the various foods to eat during periods and how it can help ease the symptoms of the cycle along with maintaining its regularity.  "),
              ),
              Text("FAQs"
                "1. What is best food during periods?"
                "Foods that reduce inflammation, have high levels of antioxidants, rich in fiber, protein, vitamins, magnesium, iron and other important minerals are considered the best during periods. These include, leafy green vegetables, fish, eggs, chicken, yogurt and low GI fruits."

               " 2. Which food is good for correct periods?"
                "There is a considerable number of women who dwell on what should we eat during periods to have a healthy and regular cycle. Foods that support estrogen levels are the ones that support the regular cycle. Foods like papaya, pineapple, carom seeds, aloe vera, cinnamon or fennels are great choices that promote a healthy menstrual cycle."

           ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("<----Previous Post"),
                  ElevatedButton(onPressed: (){}, child: Text("Rate Us")),
                  Text("Next post----->"),


                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
