import 'package:flutter/material.dart';
import 'package:poly_forensic/Screens/marium%20screens/ferriman_hirsutism_screen.dart';

class KnowFerriman extends StatefulWidget {
  const KnowFerriman({Key? key}) : super(key: key);

  @override
  State<KnowFerriman> createState() => _KnowFerrimanState();
}

class _KnowFerrimanState extends State<KnowFerriman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Know ferriman"),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "Ferriman Gallwey Score",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: "Times New Roman"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(),
                    ),
                    child: Text(
                      "The Ferriman-Gallway Score can help identify "
                      "hirsuitism in women through ratings of 0-4 in nine "
                      "different locations of the body. The Ferriman–Gallwey "
                      "score is a method of evaluating and quantifying hirsutism "
                      "in women. The method was originally published in 1961 by "
                      "D. Ferriman and J.D. Gallwey in the Journal of Clinical "
                      "Endocrinology.In the modified method, hair growth "
                      "is rated from 0 (no growth of terminal hair) to 4 "
                      "(extensive hair growth) in each of the nine locations."
                      " A patient’s score may therefore range from a minimum "
                      "score of 0 to a maximum score of 36. In Caucasian women, "
                      "a score of 8 or higher is regarded as indicative of androgen "
                      "excess. With other ethnic groups, the amount of hair expected for "
                      "that ethnicity should be considered. "
                      "The test below will help you determine if you might be hirsute.",
                      style: TextStyle(
                          fontSize: 20, fontFamily: "Times New Roman"),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FerrimanGallwey()));
                  },
                  child: Text("Check Hirsutism"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffffd6ef)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
