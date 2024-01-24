import 'package:flutter/material.dart';

import '../../const/color.dart';

class DialogButton2 extends StatefulWidget {
  const DialogButton2(
      {super.key,
      required this.text,
      required this.onTap,
      required this.buttonHeight,
      required this.width,
      required this.color,
      required this.color2});
  final String text;
  final VoidCallback onTap;
  final double buttonHeight;
  final double width;
  final Color color;
  final Color color2;

  @override
  State<DialogButton2> createState() => _DialogButton2State();
}

class _DialogButton2State extends State<DialogButton2> {
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTapDown: (_) {
        setState(() {
          tap = true;
        });
      },
      onSecondaryTapDown: (_) {
        setState(() {
          tap = true;
        });
      },
      onSecondaryTapUp: (_) {
        setState(() {
          tap = false;
        });
      },
      onTapUp: (_) {
        setState(() {
          tap = false;
        });
      },
      onTapCancel: () {
        setState(() {
          tap = false;
        });
      },
      onTap: widget.onTap,
      mouseCursor: MouseCursor.defer,
      child: AnimatedOpacity(
        opacity: tap ? 0.2 : 1,
        duration: Duration(milliseconds: 60),
        child: Container(
          padding: EdgeInsets.all(4),
          alignment: Alignment.center,
          height: widget.buttonHeight,
          width: widget.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [widget.color, widget.color2]),
            color: widget.color,
            borderRadius: BorderRadius.circular(15),
            // gradient: LinearGradient(colors: [appBlue, Color.fromARGB(31, 35, 38, 238)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Text(widget.text,
              style: TextStyle(
                  color: white, fontSize: 17, fontWeight: FontWeight.normal)),
        ),
      ),
    );
  }
}
