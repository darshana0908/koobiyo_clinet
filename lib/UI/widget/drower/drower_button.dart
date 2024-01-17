import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:page_transition/page_transition.dart';

import '../../../const/color.dart';
import '../../../const/const.dart';

class CustomDrawerButton extends StatefulWidget {
  const CustomDrawerButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.color,
      required this.list,
      required this.onTap,
      required this.isTap,
      required this.firstIndex});
  final String text;
  final IconData icon;
  final Color color;
  final Widget list;
  final VoidCallback onTap;
  final bool isTap;
  final int firstIndex;

  @override
  State<CustomDrawerButton> createState() => _CustomDrawerButtonState();
}

class _CustomDrawerButtonState extends State<CustomDrawerButton> {
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return AnimatedOpacity(
      opacity: tap ? 0.2 : 1,
      duration: Duration(milliseconds: 60),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: widget.color,
          child: SizedBox(
            child: Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: widget.onTap,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      width: w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Icon(
                            widget.icon,
                            color: white,
                          ),
                          SizedBox(
                            width:
                                ScreenSize().checkScreenType(context) == 'web'
                                    ? w / 30
                                    : w / 15,
                          ),
                          Text(
                            widget.text,
                            style: TextStyle(
                              fontSize: 12.dp,
                              color: white1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          // Icon(
                          //   widget.isTap
                          //       ? Icons.keyboard_arrow_up_rounded
                          //       : Icons.keyboard_arrow_down_rounded,
                          //   color: white,
                          // ),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                widget.isTap
                    ? widget.firstIndex == 1
                        ? SizedBox()
                        : Divider()
                    : SizedBox(),
                widget.isTap
                    ? widget.firstIndex == 1
                        ? SizedBox()
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: widget.list,
                          )
                    : SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
