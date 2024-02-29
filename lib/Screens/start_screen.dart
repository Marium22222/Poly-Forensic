import 'package:flutter/material.dart';
import 'package:poly_forensic/Screens/second_start_screen.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              width: 410,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/poly.png",
                    ),fit: BoxFit.cover

                  )
                ),
              child: Text(''),),
            ),
    Text("Welcome",
    style: TextStyle(
      color: Colors.white,
      fontSize: 40
    ),),
            Padding(
              padding: const EdgeInsets.fromLTRB(100,30,20,0),
              child: Text("Lets Fight PCOS together!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30
                ),),
            ),
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.only(left: 120.0),
              child: Container(
                width: 150,
                  height: 50,

                  child: ElevatedButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SecondStart()),
                    );
                  }, child: Text("NEXT →",
                  style: TextStyle(color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xffD660CA)),)),
            )
          ],
        ),
      ),
    );
  }
}
