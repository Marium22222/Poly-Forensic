import 'package:flutter/material.dart';

class StartThird extends StatefulWidget {
  const StartThird({Key? key}) : super(key: key);

  @override
  State<StartThird> createState() => _StartThirdState();
}

class _StartThirdState extends State<StartThird> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(70.0),
              child: Text("Congratz You made the right choice!", style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 35)),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: [
                  Text("Check PCOS now!", style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
                  Image.asset("images/3d-removebg-preview.png")
                ],
              ),
            ),
            SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Container(
                  width: 200,
                  height: 50,
        
                  child: ElevatedButton(onPressed: (){
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const StartThird()),
                    // );
                  }, child: Text("GET STARTED→",
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
