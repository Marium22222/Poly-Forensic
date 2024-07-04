import 'package:flutter/material.dart';
import 'package:poly_forensic/globals.dart' as globals;
import 'package:poly_forensic/screens/mitigation_dashboard.dart';

class ResultsScreen extends StatefulWidget {
  final String result;
  const ResultsScreen({Key? key, required this.result}) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Stack(
                  children: [
                    Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * 0.36,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "assets/images/doctorReport.webp"),
                                opacity: 0.75))),
                    Icon(
                      Icons.arrow_back_ios_sharp,
                      size: 25,
                    ),
                    Positioned(
                        top: constraints.maxHeight * 0.27,
                        left: constraints.maxWidth * 0.03,
                        child: Text(
                          "RESULT",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            fontFamily: "Times New Roman",
                            shadows: [
                              Shadow(color: Colors.grey,offset: Offset(0,3),blurRadius: 2),
                            ]
                          ),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListTile(
                    leading: Text(
                      "PREDICTION:",
                      style:
                          TextStyle(fontSize: 18, fontFamily: "Times New Roman",fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      widget.result == '1' ? "POSITIVE" : "NEGATIVE",
                      style: TextStyle(fontSize: 18,fontFamily: "Times New Roman"),
                    ),
                  ),
                ),
                // SizedBox(height:MediaQuery.sizeOf(context).height*0.3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Want to access the cure? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MitigationDashboard()));
                      },
                      child: const Text(
                        ' Mitigation Plan',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text("SYMPTOMS LIST"),
                //       Column(
                //         children: [
                //           Text('SYMPTOM1'),
                //           Text('SYMPTOM1'),
                //           Text('SYMPTOM1'),
                //           Text('SYMPTOM1'),
                //         ],
                //       )
                //     ],
                //   ),
                // ),
                // Text("ADVICE",style: TextStyle(
                //   fontWeight: FontWeight.bold,
                //   fontSize: 18
                // ),),
                // Container(
                //   width: constraints.maxWidth*0.9,
                //   height: constraints.maxHeight*0.3,
                //   padding: EdgeInsets.all(20),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //
                //     gradient: LinearGradient(
                //       colors: [
                //         Colors.grey.shade100.withOpacity(0.8),
                //         Colors.grey.shade200.withOpacity(0.8),
                //         Colors.grey.shade300.withOpacity(0.8)
                //         ,
                //       ],
                //       begin: Alignment.topLeft,
                //       end: Alignment.bottomRight
                //     )
                //   ),
                //   child: Text("ADVICED MATERIAL HERE"),
                // ),
                // ElevatedButton(onPressed: (){}, child: Text("CONTINUE"))
              ],
            );
          },
        ),
      ),
    );
  }
}
