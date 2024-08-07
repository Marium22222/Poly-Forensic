import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poly_forensic/Screens/BlogsAdmin.dart';
import 'package:poly_forensic/Screens/loginScreen.dart';
import 'package:poly_forensic/Screens/marium%20screens/Approval_userStories.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Admin Dashboard"),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ApprovalUserStory()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color:
                    Color(0xfffFF91A4),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),



                child: ListTile(
                  title: Text("User story Approval Screen",
                    style: TextStyle(
                        color: Colors.white
                    ),),
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BlogsAdminScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color:
    Color(0xfffFF91A4),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),

                child: ListTile(
                  title: Text("Upload Blogs",
                    style: TextStyle(
                        color: Colors.white
                    ),),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color:
    Color(0xfffFF91A4),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),

                child: ListTile(
                  title: Text("Logout",
                  style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
