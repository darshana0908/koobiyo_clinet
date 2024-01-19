import 'package:client_app/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Dec extends StatelessWidget {
  const Dec({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SlideAnimation(
      verticalOffset: -300.0,
      duration: Duration(milliseconds: 1200),
      child: Container(
        height: h / 1.2,
        width: w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(300)),
            color: const Color.fromARGB(255, 76, 145, 201)),
      ),
    );
  }
}

class Dec2 extends StatelessWidget {
  const Dec2({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SlideAnimation(
      duration: Duration(milliseconds: 1000),
      verticalOffset: -100.0,
      child: Container(
        height: h / 1.8,
        width: w,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 2000)],
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(300)),
            color: Colors.blue),
      ),
    );
  }
}

class Dec3 extends StatelessWidget {
  const Dec3({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h,
      width: w,
      color: black.withOpacity(0.5),
    );
  }
}
