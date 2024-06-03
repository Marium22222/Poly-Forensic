import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poly_forensic/Dialogs/meals_nutritions_dialog.dart';
import 'package:poly_forensic/screens/breakfast.dart';
import 'package:poly_forensic/screens/dinner.dart';
import 'package:poly_forensic/screens/lunch.dart';
import 'package:poly_forensic/screens/snacks.dart';

class MealPlans extends StatefulWidget {
  const MealPlans({Key? key}) : super(key: key);

  @override
  State<MealPlans> createState() => _MealPlansState();
}

class _MealPlansState extends State<MealPlans> {
  PageController pageController = new PageController();
  int value=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              height: constraints.maxHeight,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.17,
                    decoration: BoxDecoration(
                      color: Colors.teal[300],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],

                            shape: BoxShape.circle,
                          ),
                          child: Text("M",style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[900]
                          ),),
                        ), Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],

                            shape: BoxShape.circle,
                          ),
                          child: Text("E",style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[900]
                          ),),
                        ), Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],

                            shape: BoxShape.circle,
                          ),
                          child: Text("A",style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[900]
                          ),),
                        ), Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],

                            shape: BoxShape.circle,
                          ),
                          child: Text("L",style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[900]
                          ),),
                        ), Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],

                            shape: BoxShape.circle,
                          ),
                          child: Text("P",style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[900]
                          ),),
                        ), Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],

                            shape: BoxShape.circle,
                          ),
                          child: Text("L",style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[900]
                          ),),
                        ), Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],

                            shape: BoxShape.circle,
                          ),
                          child: Text("A",style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[900]
                          ),),
                        ), Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],

                            shape: BoxShape.circle,
                          ),
                          child: Text("N",style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[900]
                          ),),
                        ),Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],

                            shape: BoxShape.circle,
                          ),
                          child: Text("S",style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Times New Roman",
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[900]
                          ),),
                        ),
                      ],
                    ),
                    // child: Text(
                    //   "Meal Plans",
                    //   style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 30,
                    //       fontFamily: "Times New Roman"),
                    // ),
                  ),
                  Positioned(
                      top: constraints.maxHeight * 0.175,
                      // left: constraints.maxWidth * 0.03,
                      // right: constraints.maxWidth * 0.03,
                      child: Container(
                        width: constraints.maxWidth,

                        // color: Colors.teal[300],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: value==0?Colors.teal[300]:Colors.grey[50],
                                ),
                                child: getOption("Breakfast",0)),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: value==1?Colors.teal[300]:Colors.grey[50],
                                ),
                                child: getOption("Lunch",1)),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: value==2?Colors.teal[300]:Colors.grey[50],
                                ),
                                child: getOption("Dinner",2)),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: value==3?Colors.teal[300]:Colors.grey[50],
                                ),
                                child: getOption("Snacks",3)),
                          ],
                        ),
                      )),
                  Positioned(
                      top: constraints.maxHeight * 0.2290,
                      child: Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.teal[300],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(90),
                              bottomRight: Radius.circular(90)),
                        ),
                      )),
                  Positioned(
                    top: constraints.maxHeight * 0.29,
                    child: Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(90)),
                        ),
                        child: PageView(
                          onPageChanged: (page){
                            value=page;
                            setState(() {

                            });
                          },
                          controller: pageController,
                          children: [BreakfastPlans(),LunchPlans(),DinnerPlans(),SnackPlans()],
                        )),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  GestureDetector getOption(text,page) {
    return GestureDetector(
      onTap: (){
        pageController.animateToPage(page, duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
        value=page;
        setState(() {

        });
      },
      child: Container(
        padding: EdgeInsets.all(8),
        // margin: EdgeInsets.symmetric(horizontal: 5,vertical: 0),
        // width: MediaQuery.of(context).size.width*0.2,
        child: Text(
          "${text}",
          style: TextStyle(
              fontSize: 16,
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.bold,
              color: Colors.teal[900]
          ),
        ),
      ),
    );
  }
}
