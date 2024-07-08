import 'package:flutter/material.dart';
import 'package:poly_forensic/screens/diet_donts.dart';
import 'package:poly_forensic/screens/diet_dos.dart';
import 'package:poly_forensic/screens/mealPlans.dart';

class DietDashboard extends StatefulWidget {
  const DietDashboard({Key? key}) : super(key: key);

  @override
  State<DietDashboard> createState() => _DietDashboardState();
}

class _DietDashboardState extends State<DietDashboard> {
  PageController pageController = new PageController();
  int optionSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Diet Recommendations",
            style: TextStyle(
                fontFamily: "Times New Roman", fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepOrange.shade200,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    pageController.animateToPage(0,
                        duration: Duration(milliseconds: 20),
                        curve: Curves.bounceIn);
                    optionSelected = 0;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.orange),
                        color:
                            optionSelected == 0 ? Colors.orange : Colors.white),
                    child: Text(
                      "Food To Avoid",
                      style: TextStyle(
                          color: optionSelected == 0
                              ? Colors.white
                              : Colors.orange),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pageController.animateToPage(1,
                        duration: Duration(milliseconds: 20),
                        curve: Curves.bounceIn);
                    optionSelected = 1;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.orange),
                        color:
                        optionSelected == 1 ? Colors.orange : Colors.white),
                    child: Text(
                      "Food To Have",
                      style: TextStyle(
                          color: optionSelected == 1
                              ? Colors.white
                              : Colors.orange),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MealPlans(),));
                    optionSelected = 2;
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.orange),
                        color:
                            optionSelected == 2 ? Colors.orange : Colors.white),
                    child: Text(
                      "Meal Plans",
                      style: TextStyle(
                          color: optionSelected == 2
                              ? Colors.white
                              : Colors.orange),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: PageView(
              onPageChanged: (value) {
                optionSelected = value;
                setState(() {});
              },
              controller: pageController,
              children: [DietRecommendationsDonts(), DietRecommendationsDos()],
            ))
          ],
        ));
  }
}
