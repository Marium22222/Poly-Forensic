import 'package:flutter/material.dart';

class PeriodSymptomsDialogOptions extends StatefulWidget {
  final String text;
  final Color color1;
  final Color color2;
  // final int row;
  const PeriodSymptomsDialogOptions({Key? key, required this.text, required this.color1, required this.color2}) : super(key: key);

  @override
  State<PeriodSymptomsDialogOptions> createState() => _PeriodSymptomsDialogOptionsState();
}

class _PeriodSymptomsDialogOptionsState extends State<PeriodSymptomsDialogOptions> {
  bool isClicked=false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.fromLTRB(20,10,20,10),
          decoration: BoxDecoration(
              color: widget.color1,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Text("${widget.text}",style: TextStyle(color: widget.color2),),
        );
      },

    );
  }
}
