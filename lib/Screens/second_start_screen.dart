import 'package:flutter/material.dart';
import 'package:poly_forensic/Screens/third_start_screen.dart';

class SecondStart extends StatefulWidget {
  const SecondStart({Key? key}) : super(key: key);

  @override
  State<SecondStart> createState() => _SecondStartState();
}

class _SecondStartState extends State<SecondStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text("being a female isn't dangerous but being "
                  "an unhealthy one is!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),),
            ),
            Container(
              width: 410,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/pcos.webp")
                )
              ),
            ),
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Container(
                  width: 250,
                  height: 50,
        
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StartThird()),
                    );
                  }, child: Text("LETS EXPLORE →",
                    style: TextStyle(color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),),
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xffD660CA)),)),
            )
          ],
        ),
      ),
    );
  }
}
