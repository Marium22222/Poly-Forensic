import 'package:flutter/material.dart';
import 'package:poly_forensic/Dialogs/RotterdamCardDialog.dart';

class RotterdamCards extends StatefulWidget {
  final String image;
  final String caption;
  final Color color1;
  final Color color2;
  final String opt;
  const RotterdamCards(
      {Key? key,
      required this.image,
      required this.caption,
      required this.color1,
      required this.color2,
      required this.opt})
      : super(key: key);

  @override
  State<RotterdamCards> createState() => _RotterdamCardsState();
}

class _RotterdamCardsState extends State<RotterdamCards> {
  List<String> texts = [
    "Oligoanovulation is a condition that causes irregular or infrequent periods. While women with an average menstrual cycle typically have periods every 28 to 32 days, women experiencing oligoovulation generally have eight or fewer periods each year.",
    "Hyperandrogenism is any state with an excess production of “male” hormones, although these hormones are normally found in women at lower levels. \t Signs- hirsutism, acne, androgenic alopecia, and virilization",
    "Polycystic ovary morphology (PCOM) is an ultrasonographic finding that can be present in women with ovulatory disorder and oligomenorrhea due to hypothalamic, pituitary, and ovarian dysfunction."
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.opt == "oligo") {
          showDialog(
            context: context,
            builder: (context) => RotterdamCardDialog(
              text: texts[0], color1: widget.color1,color2: widget.color2,
            ),
          );
        } else if (widget.opt == "hyper") {
          showDialog(
            context: context,
            builder: (context) => RotterdamCardDialog(
              text: texts[1],color1: widget.color1,color2: widget.color2,
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => RotterdamCardDialog(
              text: texts[2],color1: widget.color1,color2: widget.color2,
            ),
          );
        }
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.28,
        height: MediaQuery.sizeOf(context).height * 0.2,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0)],
          gradient: LinearGradient(
              colors: [widget.color1, widget.color2],
              stops: [0.1, 0.4],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Column(
          children: [
            Image.asset(
              widget.image,
              width: 80,
              height: 80,
            ),
            SizedBox(
              width: 80,
              child: Text(
                "${widget.caption}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
