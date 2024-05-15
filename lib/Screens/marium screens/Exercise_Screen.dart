import 'package:flutter/material.dart';
import 'package:poly_forensic/Screens/marium%20screens/StressBuster_Screen.dart';
import 'package:poly_forensic/Screens/marium%20screens/basic_pcos_exercise.dart';
import 'package:poly_forensic/Screens/marium%20screens/yogaScreen.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({Key? key}) : super(key: key);

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercise Screen"),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => YogaScreen(),));
            },
            child: Container(
              color: Colors.blue,
              child: ListTile(

                leading: Icon(
                  Icons.mediation
                ),
                title: Text("Yoga for PCOS"),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => StressBusterScreen(),));
            },
            child: Container(
              color: Colors.blue,
              child: ListTile(

                leading: Icon(
                    Icons.mediation
                ),
                title: Text("Stress Busters for PCOS"),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => BasicExercises(),));
            },
            child: Container(
              color: Colors.blue,
              child: ListTile(

                leading: Icon(
                    Icons.mediation
                ),
                title: Text("Basic Exercises for PCOS"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
