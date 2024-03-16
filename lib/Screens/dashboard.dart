import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:poly_forensic/reusable_widgets/sliderItem.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListView(
                children: [
                  DrawerHeader(child: Text("profile")),
                  ListTile(
                    title: Text("ITEM 1"),
                  ),
                  ListTile(
                    title: Text("ITEM 1"),
                  ),
                  ListTile(
                    title: Text("ITEM 1"),
                  ),
                  ListTile(
                    title: Text("ITEM 1"),
                  ),
                ],
              )),
        ),
        body: SafeArea(
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
                      padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                        width: MediaQuery.sizeOf(context).width * 0.85,
                        // decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //         image: AssetImage("assets/images/greyBg.jpg"),
                        //         fit: BoxFit.cover)),
                        child: Column(
                          children: [
                            Text("Severe Consequences",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Image.asset('assets/images/infertility.jpg',width: MediaQuery.sizeOf(context).width*0.27,),
                                    Text("INFERTILITY",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14
                                    ),)
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset('assets/images/diabetes.png',width: MediaQuery.sizeOf(context).width*0.27,height:100),
                                    SizedBox(
                                      width: 67,
                                      child: Text("TYPE-2 DIABETES",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14
                                      ),
                                      textAlign: TextAlign.center,),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset('assets/images/uterusCancer.jpg',width: MediaQuery.sizeOf(context).width*0.27,height:100),
                                    SizedBox(
                                      width: 67,
                                      child: Text("UTERINE CANCER",style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14
                                      ),
                                      textAlign: TextAlign.center,),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ))
                  ],
                  options: CarouselOptions(
                    // aspectRatio: 16 / 9,
                    viewportFraction: 0.9,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    // autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  )),

              Text("STORIES")
            ],
          ),
        ));
  }
}
