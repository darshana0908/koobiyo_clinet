import 'package:client_app/UI/widget/diloag_button.dart';
import 'package:client_app/const/color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UserCheck extends StatelessWidget {
  const UserCheck({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: w,
        child: Column(
          children: [
            Lottie.asset('assets/intro3.json'),
            Text(
              "Choose you'r account",
              style: TextStyle(
                  decorationColor: white,
                  decoration: TextDecoration.underline,
                  color: white1,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            DialogButton(
                text: 'I am Sender',
                onTap: () {},
                buttonHeight: h / 9,
                width: w,
                color: black),
            DialogButton(
                text: 'I am Sender',
                onTap: () {},
                buttonHeight: h / 9,
                width: w,
                color: black)
          ],
        ),
      ),
    );
  }
}
