import 'package:flutter/material.dart';

class BasicExercises extends StatefulWidget {
  const BasicExercises({Key? key}) : super(key: key);

  @override
  State<BasicExercises> createState() => _BasicExercisesState();
}

class _BasicExercisesState extends State<BasicExercises> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic PCOS Exercises"),
      ),
      body: Image.asset("assets/images/lowerBackWorkout.webp"),
    );
  }
}

