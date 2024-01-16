import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:page_transition/page_transition.dart';

import '../../../const/color.dart';
import '../../../const/const.dart';

class CustomDrawerButton extends StatefulWidget {
  const CustomDrawerButton(
      {super.key,
      required this.icon,
      required this.myPage,
      required this.text,
      required this.isTap,
      required this.onTap});
  final String text;
  final IconData icon;
  final Widget myPage;
  final bool isTap;
  final VoidCallback onTap;

  @override
  State<CustomDrawerButton> createState() => _CustomDrawerButtonState();
}

class _CustomDrawerButtonState extends State<CustomDrawerButton> {
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: widget.onTap,
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
      child: AnimatedOpacity(
        opacity: tap ? 0.2 : 1,
        duration: Duration(milliseconds: 60),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: white.withOpacity(0.9),
          child: SizedBox(
            height: h / 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  widget.icon,
                  color: black2,
                ),
                SizedBox(
                  width: ScreenSize().checkScreenType(context) == 'web'
                      ? w / 30
                      : w / 15,
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 12.dp,
                    color: black2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
