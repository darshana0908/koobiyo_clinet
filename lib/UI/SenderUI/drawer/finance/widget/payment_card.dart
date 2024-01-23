import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../../const/color.dart';
import '../../../../../const/const.dart';

class PaymentCard extends StatefulWidget {
  const PaymentCard(
      {super.key,
      required this.color,
      required this.icon,
      required this.text,
      required this.text2,
      required this.text3});
  final Color color;
  final IconData icon;
  final String text;
  final String text2;
  final String text3;

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return AnimationLimiter(
      child: AnimationConfiguration.synchronized(
        child: Card(
          elevation: 20,
          color: black.withOpacity(0.7),
          child: Card(
            color: const Color.fromARGB(255, 10, 38, 86).withOpacity(0.7),
            elevation: 50,
            margin: EdgeInsets.all(0),
            child: Container(
              alignment: Alignment.center,
              width: ScreenSize().checkScreenType(context) == 'web'
                  ? w / 5
                  : w / 2.2,
              child: Padding(
                padding: EdgeInsets.all(
                    ScreenSize().checkScreenType(context) == 'web' ? 20 : 8.0),
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SlideAnimation(
                            horizontalOffset: -200,
                            duration: Duration(milliseconds: 900),
                            child: Card(
                              color: widget.color,
                              child: Padding(
                                padding: EdgeInsets.all(w / 100),
                                child: Icon(
                                  widget.icon,
                                  color: white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SlideAnimation(
                                  verticalOffset: 100,
                                  duration: Duration(milliseconds: 900),
                                  child: SizedBox(
                                    child: Text(
                                      widget.text,
                                      style: TextStyle(
                                        fontSize: 12.dp,
                                        color: white3,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                                SlideAnimation(
                                  verticalOffset: -100,
                                  duration: Duration(milliseconds: 900),
                                  child: Text(
                                    widget.text2,
                                    style: TextStyle(
                                      fontSize: 14.dp,
                                      color: white2,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Text(
                        widget.text3,
                        style: TextStyle(
                          fontSize: 12.dp,
                          color: white2,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
