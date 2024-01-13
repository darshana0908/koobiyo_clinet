import 'dart:ui';

import 'package:client_app/UI/widget/diloag_button.dart';
import 'package:client_app/const/color.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../const/const.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3));

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Container(
          height: h / 1.2,
          width: w,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(300)),
              color: brown),
        ),
        Container(
          height: h / 1.8,
          width: w,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 2000)],
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(300)),
              color: red),
        ),
        Container(
          height: h,
          width: w,
          color: black.withOpacity(0.5),
        ),
        Container(
          alignment: kIsWeb ? Alignment.center : null,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kIsWeb ? black1.withOpacity(0.2) : null,
              ),
              child: SizedBox(
                height: h,
                width: kIsWeb ? w : w,
                child: Column(
                  crossAxisAlignment:
                      ScreenSize().checkScreenType(context) == 'mobile'
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      ScreenSize().checkScreenType(context) == 'mobile'
                          ? 'Welcome \nBack!'
                          : 'Welcome Back!',
                      textAlign:
                          ScreenSize().checkScreenType(context) == 'mobile'
                              ? null
                              : TextAlign.center,
                      style: TextStyle(
                          color: white,
                          fontSize: 35.dp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Hay good to see you again',
                      style: TextStyle(
                          color: white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: h / 7,
                    ),
                    Text(
                      'Sign in',
                      style: TextStyle(
                          color: white,
                          fontSize: 20.dp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: ScreenSize().checkScreenType(context) == 'mobile'
                          ? w
                          : w / 2.5,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'user name',
                            hintStyle: TextStyle(color: white2),
                            prefixIcon: Icon(
                              Icons.person,
                              color: white2,
                            )),
                      ),
                    ),
                    Spacer(),
                    DialogButton(
                        text: "Sign in me",
                        onTap: () {},
                        buttonHeight: h / 12,
                        width: ScreenSize().checkScreenType(context) == 'mobile'
                            ? w
                            : w / 2.5,
                        color: black),
                    SizedBox(
                      width: w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Already have and account',
                            style: TextStyle(
                                color: white2,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Need help?',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: white2,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
