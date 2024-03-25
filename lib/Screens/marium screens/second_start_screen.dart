import 'package:flutter/material.dart';
import 'package:poly_forensic/Screens/marium%20screens/third_start_screen.dart';

class SecondStart extends StatefulWidget {
  const SecondStart({Key? key}) : super(key: key);

  @override
  State<SecondStart> createState() => _SecondStartState();
}

class _SecondStartState extends State<SecondStart> {
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
                  width: screenWidth,
                  height: screenHeight*0.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/pcos.webp")
                      )
                  ),
                ),
                SizedBox(height: screenHeight*0.04,),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Container(
                      width: screenHeight*0.4,
                      height: screenHeight*0.08,

                      child: ElevatedButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StartThird()),
                        );
                      }, child: Text("LETS EXPLORE →",
                        style: TextStyle(color: Colors.white,
                            fontSize: 23,
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
