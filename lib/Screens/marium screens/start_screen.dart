import 'package:flutter/material.dart';
import 'package:poly_forensic/Screens/marium%20screens/second_start_screen.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();

}

class _StartState extends State<Start> {
  double screenWidth = 0.0;
  double screenHeight = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Get the screen size
      Size screenSize = MediaQuery.of(context).size;
      setState(() {
        screenWidth = screenSize.width;
        screenHeight = screenSize.height;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                SizedBox(
                  height: screenHeight*0.5,
                  width: screenWidth,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/poly.png",
                            ), fit: BoxFit.cover

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
                  padding: const EdgeInsets.fromLTRB(100, 30, 20, 0),
                  child: Text("Lets Fight PCOS together!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30
                    ),),
                ),
                SizedBox(height: screenHeight*0.1,),
                Padding(
                  padding: const EdgeInsets.only(left: 120.0),
                  child: Container(
                      width: screenHeight*0.2,
                      height: screenHeight*0.06,

                      child: ElevatedButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondStart()),
                        );
                      }, child: Text("NEXT →",
                        style: TextStyle(color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffD660CA)),)),
                )
              ],
            );

          },
        ),
      ),
    );
  }
}
