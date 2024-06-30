import 'package:flutter/material.dart';
import 'package:poly_forensic/Screens/marium%20screens/Exercise_Screen.dart';
import 'package:poly_forensic/screens/diet_dashboard.dart';

class MitigationDashboardOptions extends StatefulWidget {
  const MitigationDashboardOptions({Key? key}) : super(key: key);

  @override
  State<MitigationDashboardOptions> createState() =>
      _MitigationDashboardOptionsState();
}

class _MitigationDashboardOptionsState
    extends State<MitigationDashboardOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        return SafeArea(
          child: Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Stack(
              children: [
                Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange.shade300,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 50, 0, 0),
                  child: Text(
                    "MITIGATION PLANS",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                      shadows: [
                        Shadow(
                          color: Colors.grey,
                          offset: Offset(0,1),
                          blurRadius: 3
                        )
                      ]
                    ),
                  ),
                ),
                Positioned(
                  top: constraints.maxHeight * 0.3,
                  child: Container(
                    width: constraints.maxWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DietDashboard(),));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: constraints.maxWidth * 0.4,
                            height: constraints.maxHeight*0.35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset:
                                      Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/diet.png",
                                  width: 120,
                                  height: 120,
                                ),
                                Text(
                                  "Diet \nRecommendations",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ExerciseScreen(),));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: constraints.maxWidth * 0.4,
                            height: constraints.maxHeight*0.35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset:
                                      Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/exercise.png",
                                  width: 120,
                                  height: 120,
                                ),
                                Text(
                                  "Exercise \nRoutine",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
