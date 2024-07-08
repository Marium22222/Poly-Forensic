import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:poly_forensic/Dialogs/BMIResultDialog.dart';
import 'package:poly_forensic/Dialogs/RotterdamCardDialog.dart';
import 'package:poly_forensic/Dialogs/periodsSymptomsDialog.dart';
import 'package:poly_forensic/Dialogs/storyDialog.dart';
import 'package:poly_forensic/Screens/dataPolicy.dart';
import 'package:poly_forensic/Screens/marium%20screens/rotterdam_symptoms_screen.dart';
import 'package:poly_forensic/globals.dart';
import 'package:poly_forensic/reusable_widgets/dashboardCards.dart';
import 'package:poly_forensic/reusable_widgets/rotterdamCards.dart';
import 'package:poly_forensic/reusable_widgets/sliderItem.dart';
import 'package:poly_forensic/screens/ShareExperience.dart';
import 'package:poly_forensic/screens/loginScreen.dart';
import 'package:poly_forensic/screens/marium%20screens/Awareness_blogs.dart';
import 'package:poly_forensic/screens/marium%20screens/profile_screen.dart';
import 'package:poly_forensic/screens/mitigation_dashboard.dart';
import 'package:poly_forensic/screens/periodsSymptoms.dart';
import 'package:poly_forensic/screens/symptomsTracking.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:poly_forensic/globals.dart' as globals;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isHover = false;
  String appBarText = "Dashboard";
  bool toShowDiff = false;
  late int difference;
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "POLY-FORENSIC",
            style: TextStyle(fontFamily: "Merriweather",
              shadows: [
                Shadow(
                  color: Colors.grey,
                  offset: Offset(1,1)
                )
              ]
            ),
          ),
          centerTitle: true,
          // backgroundColor: Colors.white,
        ),
        drawer: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width * 0.7,
          child: Drawer(
              backgroundColor: Colors.white,
              child: ListView(
                children: [
                  DrawerHeader(
                      child: FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection("users")
                        .doc(login)
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child:
                                CircularProgressIndicator()); //return means the bottom code wont run
                      }
                      if (snapshot.data == null || snapshot.hasError) {
                        return const Center(child: Text("DATA NOT AVAILABLE"));
                      }
                      data = snapshot.data!.data() as Map<String, dynamic>;
                      if (data['expectedPeriodDate'] == "" ||
                          data['lastPeriodDate'] == "") {
                        toShowDiff = false;
                      } else {
                        toShowDiff = true;
                        final date_today = DateTime.now();
                        final year = int.parse(
                            data['expectedPeriodDate'].substring(0, 4));
                        final month = int.parse(
                            data['expectedPeriodDate'].substring(5, 7));
                        final day = int.parse(
                            data['expectedPeriodDate'].substring(8, 10));
                        final expected_date = DateTime(year, month, day);

                        difference =
                            expected_date.difference(date_today).inDays;
                      }

                      return toShowDiff == true
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${data['username']}"),
                                Text("Periods Due In:"),
                                Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.red, width: 8)),
                                    child: Text("${difference}")),
                                Text("days"),
                              ],
                            )
                          : Text("${data['username']}");
                    },
                  )),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Dashboard(),
                          ));
                    },
                    leading: Icon(Icons.home),
                    title: Text("HOME"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ));
                    },
                    leading: Icon(Icons.person),
                    title: Text("PROFILE"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AwarenessBlogs(),
                          ));
                    },
                    leading: Icon(Icons.speaker_group),
                    title: Text("AWARENESS"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RotterdamSymptomsScreen(acneResponse: '4',),
                          ));
                    },
                    leading: Icon(Icons.online_prediction_outlined),
                    title: Text("PREDICTION"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MitigationDashboard(),
                          ));
                    },
                    leading: Icon(Icons.local_hospital),
                    title: Text("MITIGATION"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SymptomsTracking(),
                          ));
                    },
                    leading: Icon(Icons.track_changes),
                    title: Text("SYMPTOMS TRACKING"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShareExperience(
                              Name: '${data['username']}',
                            ),
                          ));
                    },
                    leading: Icon(Icons.offline_share),
                    title: Text("SHARE YOUR EXPERIENCE"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DataPolicy()
                          ));
                    },
                    leading: Icon(Icons.policy),
                    title: Text("DATA POLICY"),
                  ),
                  ListTile(
                    onTap: () async {
                      print(globals.login);
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.remove("email");
                      setState(() {});

                      FirebaseAuth.instance.signOut().then((value) {
                        print("Signed Out!");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      });
                    },
                    leading: Icon(Icons.logout),
                    title: Text("LOGOUT"),
                  ),
                ],
              )),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                  child: CarouselSlider(
                      items: [
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              8, MediaQuery.sizeOf(context).height * 0.1, 120, 8),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  opacity: 0.7,
                                  image:
                                      AssetImage("assets/images/pcosSlideBg.png"),
                                  fit: BoxFit.cover)),
                          child: Column(
                            children: [
                              Text(
                                "What Is PCOS?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "PCOS is a common hormonal condition that affects women of reproductive age.",
                                style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16,
                                    letterSpacing: 2.0,
                                    fontFamily: "Times New Roman"),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),
                        Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                            width: MediaQuery.sizeOf(context).width * 0.85,
                            // decoration: BoxDecoration(
                            //   color:Colors.lightBlue[50],
                            //     image: DecorationImage(
                            //         image: AssetImage("assets/images/randomBg.png"),
                            //         opacity: 0.5,
                            //         fit: BoxFit.cover)),
                            child: Column(
                              children: [
                                Text(
                                  "Severe Consequences",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/infertility.jpg',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.27,
                                        ),
                                        Text(
                                          "INFERTILITY",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset('assets/images/diabetes.png',
                                            width:
                                                MediaQuery.sizeOf(context).width *
                                                    0.27,
                                            height: 100),
                                        SizedBox(
                                          width: 67,
                                          child: Text(
                                            "TYPE-2 DIABETES",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Image.asset(
                                            'assets/images/uterusCancer.jpg',
                                            width:
                                                MediaQuery.sizeOf(context).width *
                                                    0.27,
                                            height: 100),
                                        SizedBox(
                                          width: 67,
                                          child: Text(
                                            "UTERINE CANCER",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )),

                        // Container(
                        //     width: MediaQuery.sizeOf(context).width * 0.9,
                        //     decoration: BoxDecoration(
                        //         image: DecorationImage(
                        //             image:
                        //                 AssetImage("assets/images/statsBg.png"))),
                        //     child: Stack(
                        //       children: [
                        //         Positioned(
                        //             left:
                        //                 MediaQuery.sizeOf(context).width * 0.235,
                        //             top: 10,
                        //             child: Text("52%",
                        //                 style: TextStyle(
                        //                     fontWeight: FontWeight.bold,
                        //                     fontSize: 20))),
                        //         Positioned(
                        //             left: MediaQuery.sizeOf(context).width * 0.4,
                        //             top: MediaQuery.sizeOf(context).height * 0.12,
                        //             child: SizedBox(
                        //                 width: MediaQuery.sizeOf(context).width *
                        //                     0.5,
                        //                 child: Text.rich(TextSpan(
                        //                     style: TextStyle(
                        //                         fontSize: 16,
                        //                         fontFamily: "Merriweather"),
                        //                     children: [
                        //                       TextSpan(
                        //                           text: "More than 52% ",
                        //                           style: TextStyle(
                        //                               fontWeight:
                        //                                   FontWeight.bold)),
                        //                       TextSpan(
                        //                           text:
                        //                               "of Pakistani Women are suffering from PCOS.")
                        //                     ]))))
                        //       ],
                        //     )),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.black12, Colors.grey],
                                  stops: [0.5, 0.5],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Unhealthy Lifestyle",
                                    style: TextStyle(
                                        fontFamily: "Times New Roman",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("")
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/images/lazy_women.png',
                                      width: 170, height: 150),
                                  Image.asset('assets/images/unhealthy_diet.png',
                                      width: 170, height: 150)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(""),
                                  Text(
                                    "Poor Diet",
                                    style: TextStyle(
                                        fontFamily: "Times New Roman",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          decoration: BoxDecoration(
                          color: Colors.red.shade200
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("PCOS SYMPTOMS",textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                color:Colors.white,
                                fontFamily: "Times New Roman",
                                shadows: [
                                  Shadow(
                                    color: Colors.white70,
                                    offset: Offset(1,2),

                                  )
                                ]
                              ),),
                            ],
                          )
                        ),

                        Container(
                          width:MediaQuery.of(context).size.width*0.9,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  opacity: 0.7,
                                  image:
                                  AssetImage("assets/images/acne.png"),
                                  fit: BoxFit.cover)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "SEVERE ACNE",
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0,
                                    fontFamily: "Times New Roman"),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),

                        Container(
                          width:MediaQuery.of(context).size.width*0.9,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  opacity: 0.7,
                                  image:
                                  AssetImage("assets/images/missedPeriods.jpg"),
                                  fit: BoxFit.cover)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "IRREGULAR PERIODS",
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0,
                                    fontFamily: "Times New Roman"),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),

                        Container(
                          width:MediaQuery.of(context).size.width*0.9,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  opacity: 0.7,
                                  image:
                                  AssetImage("assets/images/weightGain.jpg"),
                                  fit: BoxFit.cover)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "WEIGHT GAIN",
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0,
                                    fontFamily: "Times New Roman"),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),

                        Container(
                          width:MediaQuery.of(context).size.width*0.9,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  opacity: 0.7,
                                  image:
                                  AssetImage("assets/images/hirsutism.png"),
                                  fit: BoxFit.cover)),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "FACIAL HAIR",
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0,
                                    fontFamily: "Times New Roman"),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),

                        Container(
                          width:MediaQuery.of(context).size.width*0.9,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  opacity: 0.6,
                                  image:
                                  AssetImage("assets/images/infertility.webp"),
                                  fit: BoxFit.cover)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "INFERTILITY",
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0,
                                    fontFamily: "Times New Roman"),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        ),

                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            // border: Border.all(color: Colors.grey,width: 0.5),
                            gradient: LinearGradient(
                              colors: [Colors.pink.shade100,Colors.pink.shade200],
                              stops: [0,0.4],
                              begin: Alignment.topLeft,
                              end:Alignment.bottomRight
                            ),
                          ),
                          child: new CircularPercentIndicator(
                            radius: 50.0,
                            lineWidth: 13.0,
                            animation: true,
                            percent: 0.52,
                            footer: Text(
                              "More than 52% of Pakistani women are suffering from PCOS.",
                              style: TextStyle(
                                  fontFamily: "Times New Roman",
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            center: new Text(
                              "52.0%",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.pink,
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        // aspectRatio: 16 / 9,
                        viewportFraction: 0.95,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        // onPageChanged: callbackFunction,
                        scrollDirection: Axis.horizontal,
                      )),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Column(children: [
                      Text(
                        "ROTTERDAM CRITERIA",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Merriweather",
                            // fontStyle: FontStyle.italic,
                            fontSize: 20),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RotterdamCards(
                            image: 'assets/images/oligo.png',
                            caption: "Oligoanovulation",
                            color1: Colors.pink.shade300,
                            color2: Colors.pink,
                            opt: "oligo",
                          ),
                          RotterdamCards(
                            image: 'assets/images/hyper.png',
                            caption: "Hyperandrogenism",
                            color1: Colors.orange.shade300,
                            color2: Colors.orange,
                            opt: "hyper",
                          ),
                          RotterdamCards(
                            image: 'assets/images/pcom.png',
                            caption: "PCOM",
                            color1: Colors.green.shade300,
                            color2: Colors.green,
                            opt: "pcom",
                          ),
                        ],
                      )
                    ])),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: Column(
                    children: [
                      Text(
                        "WHY USE POLY-FORENSICS?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Merriweather",
                            // fontStyle: FontStyle.italic,
                            fontSize: 20),
                      ),
                      DashboardCards(
                          image: "assets/images/awareness.png",
                          title: "Awareness",
                          descritpion:
                              "Our app serves as a comprehensive resource to educate users about PCOS, offering detailed information on symptoms, treatments, and lifestyle adjustments. By providing personalized insights and interactive tools, it empowers users to take proactive steps in managing their health and spreading awareness about PCOS in their communities."),
                      DashboardCards(
                          image: "assets/images/prediction.png",
                          title: "Efficient Predictions",
                          descritpion:
                              "With advanced predictive analytics, our app enables efficient forecasting of PCOS symptom patterns and potential flare-ups. This empowers users to take timely preventive measures, enhancing their ability to manage the condition proactively."),
                      DashboardCards(
                          image: "assets/images/mitigation.png",
                          title: "Mitigation Plan",
                          descritpion:
                              "Our app equips users with tailored mitigation plans for PCOS, including diet and exercise to help manage symptoms effectively. By offering personalized strategies, it supports users in making informed decisions to improve their overall well-being.")
                    ],
                  ),
                ),
                Text(
                  "LEARN FROM OUR USERS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Merriweather",
                      // fontStyle: FontStyle.italic,
                      fontSize: 20),
                ),
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('stories')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child:
                              CircularProgressIndicator()); //return means the bottom code wont run
                    }
                    if (snapshot.data == null || snapshot.hasError) {
                      return const Center(child: Text("DATA NOT AVAILABLE"));
                    }

                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];

                        Map<String, dynamic> data =
                            documentSnapshot.data() as Map<String, dynamic>;

                        if (data['status'] == 'pending') {
                          return Text("");
                        }
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => StoryDialog(data: data),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              border: Border(
                                right: BorderSide(color: Colors.grey, width: 3),
                                bottom:
                                    BorderSide(color: Colors.grey, width: 3),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 10),
                                  padding: EdgeInsets.all(8.0),
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.2,
                                  child: Image.network(data['Image'],
                                      fit: BoxFit.cover,
                                      width: 150,
                                      height: 100),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${data["Title"]}",
                                            softWrap: true,
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "${data["Date"]}",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        "${data["story"]}",
                                        textAlign: TextAlign.justify,
                                        maxLines: 4,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(),
                                          Text(
                                            "~${data["Author"]}",
                                            style:
                                                TextStyle(color: Colors.pink),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
