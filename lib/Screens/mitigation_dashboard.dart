import 'package:flutter/material.dart';
import 'package:poly_forensic/screens/mitigation_blogs.dart';
import 'package:poly_forensic/screens/mitigation_dashboard_options.dart';

class MitigationDashboard extends StatefulWidget {
  const MitigationDashboard({Key? key}) : super(key: key);

  @override
  State<MitigationDashboard> createState() => _MitigationDashboardState();
}

class _MitigationDashboardState extends State<MitigationDashboard> {
  PageController pageController = new PageController();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: [MitigationDashboardOptions(), MitigationBlogs()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 0) {
            pageController.animateToPage(0,
                duration: Duration(milliseconds: 20), curve: Curves.bounceIn);
            selectedIndex = value;
            setState(() {});
          }
          if (value == 1) {
            pageController.animateToPage(1,
                duration: Duration(milliseconds: 20), curve: Curves.bounceIn);
            selectedIndex = value;
            setState(() {});
          }
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Blogs"),
        ],
      ),
    );
  }
}
