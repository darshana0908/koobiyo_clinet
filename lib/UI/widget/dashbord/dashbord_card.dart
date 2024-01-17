import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../const/color.dart';
import '../../../const/const.dart';

class DashboardCard extends StatefulWidget {
  const DashboardCard({super.key, required this.color, required this.icon, required this.text, required this.text2});
  final Color color;
  final IconData icon;
  final String text;
  final String text2;

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return AnimationLimiter(
      child: AnimationConfiguration.synchronized(
        child: Card(
          color: black.withOpacity(0.7),
          child: Card(
            color: black.withOpacity(0.7),
            elevation: 50,
            margin: EdgeInsets.all(0),
            child: Container(
              alignment: Alignment.center,
              width: ScreenSize().checkScreenType(context) == 'web' ? w / 6 : w / 2.5,
              child: Padding(
                padding: EdgeInsets.all(ScreenSize().checkScreenType(context) == 'web' ? 20 : 8.0),
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
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(
                                widget.icon,
                                color: white,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SlideAnimation(
                                verticalOffset: 100,
                                duration: Duration(milliseconds: 900),
                                child: Text(
                                  widget.text,
                                  style: TextStyle(
                                    fontSize: 12.dp,
                                    color: white3,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              SlideAnimation(
                                verticalOffset: -100,
                                duration: Duration(milliseconds: 900),
                                child: Text(
                                  widget.text2,
                                  style: TextStyle(
                                    fontSize: 22.dp,
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
