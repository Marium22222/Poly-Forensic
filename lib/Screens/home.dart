import 'package:flutter/material.dart';
import 'package:poly_forensic/screens/BlogsAdmin.dart';
import 'package:poly_forensic/screens/dashboard.dart';
import 'package:poly_forensic/screens/symptomsTracking.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController=new PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
                controller: pageController,
                children: [
                  Dashboard(),
                  SymptomsTracking(),
                  BlogsAdminScreen()
                ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value){
          // if(value==0)
          //   {
              pageController.animateToPage(value, duration: Duration(milliseconds: 20), curve: Curves.bounceIn);
          //   }
          // else if(value==1)
          //   {
          //     pageController.animateToPage(, duration: Duration(milliseconds: 3), curve: Curves.bounceIn);
          //   }
          // else if(value==2)
          //   {
          //     pageController.animateToPage(2, duration: Duration(milliseconds: 3), curve: Curves.bounceIn);
          //   }
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "HOME"),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "SYMPTOMS"),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "BLOGS"),
        ],
      ),
    );
  }
}



