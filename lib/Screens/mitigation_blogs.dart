import 'package:flutter/material.dart';

class MitigationBlogs extends StatefulWidget {
  const MitigationBlogs({Key? key}) : super(key: key);

  @override
  State<MitigationBlogs> createState() => _MitigationBlogsState();
}

class _MitigationBlogsState extends State<MitigationBlogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("Mitigation Blogs"),
      ),
    );
  }
}
