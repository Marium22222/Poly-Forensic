import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:poly_forensic/Dialogs/BMIResultDialog.dart';
import 'package:poly_forensic/Dialogs/RotterdamCardDialog.dart';
import 'package:poly_forensic/Dialogs/periodsSymptomsDialog.dart';
import 'package:poly_forensic/Dialogs/storyDialog.dart';
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

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isHover = false;
  String appBarText = "Dashboard";
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "POLY-FORENSIC",
            style: TextStyle(fontFamily: "MarckScript"),
          ),
          centerTitle: true,
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
                      return Text("${data['username']}");
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
                            builder: (context) => RotterdamSymptomsScreen(),
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
                CarouselSlider(
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
                                  fontFamily: "Merriweather"),
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
                      Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/statsBg.png"))),
                          child: Stack(
                            children: [
                              Positioned(
                                  left:
                                      MediaQuery.sizeOf(context).width * 0.235,
                                  top: 10,
                                  child: Text("52%",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20))),
                              Positioned(
                                  left: MediaQuery.sizeOf(context).width * 0.4,
                                  top: MediaQuery.sizeOf(context).height * 0.12,
                                  child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      child: Text.rich(TextSpan(
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Merriweather"),
                                          children: [
                                            TextSpan(
                                                text: "More than 52% ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                                text:
                                                    "of Pakistani Women are suffering from PCOS.")
                                          ]))))
                            ],
                          ))
                    ],
                    options: CarouselOptions(
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.9,
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
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Column(children: [
                      Text(
                        "ROTTERDAM CRITERIA",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Merriweather",
                            // fontStyle: FontStyle.italic,
                            fontSize: 20),
                      ),
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
                              "Tracking your periods and ovulation with Flo can help you calculate and predict symptoms ahead of time, getting you prepared for the days ahead."),
                      DashboardCards(
                          image: "assets/images/prediction.png",
                          title: "Efficient Predictions",
                          descritpion:
                              "Tracking your periods and ovulation with Flo can help you calculate and predict symptoms ahead of time, getting you prepared for the days ahead."),
                      DashboardCards(
                          image: "assets/images/mitigation.png",
                          title: "Mitigation Plan",
                          descritpion:
                              "Tracking your periods and ovulation with Flo can help you calculate and predict symptoms ahead of time, getting you prepared for the days ahead.")
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
                                left: BorderSide(color: Colors.grey, width: 3),
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
                                  margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
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
