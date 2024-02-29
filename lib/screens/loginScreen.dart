import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: constraints.maxHeight * 0.5,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.4,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/loginBgRibbon.png',
                            ),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Positioned(
                        top: constraints.maxHeight * 0.17,
                        child: Container(
                          child: Image.asset('assets/doctor.webp'),
                          height: constraints.maxHeight * 0.34,
                        )),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                            fontFamily: "Times New Roman"),
                      ),
                      TextField(
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                            fontFamily: "Times New Roman"),
                      ),
                      TextField(
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width:150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    style: ButtonStyle(backgroundColor:MaterialStatePropertyAll<Color>(Colors.black)

                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
