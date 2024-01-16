import 'package:flutter/material.dart';

import '../../const/color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.icon,
      required this.text});
  final String text;
  final TextEditingController controller;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: h / 14,
      child: TextField(
        controller: controller,
        style: TextStyle(color: white),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: white2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: white3)),
            hintText: text,
            hintStyle: TextStyle(color: white3),
            prefixIcon: Icon(
              icon,
              color: white2,
            )),
      ),
    );
  }
}
