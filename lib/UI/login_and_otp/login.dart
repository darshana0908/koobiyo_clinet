import 'dart:ui';

import 'package:client_app/UI/SenderUI/sender_home.dart';
import 'package:client_app/UI/login_and_otp/sign_up.dart';
import 'package:client_app/UI/userCheck/user_check.dart';
import 'package:client_app/UI/widget/diloag_button.dart';
import 'package:client_app/const/color.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';

import '../../const/const.dart';
import '../widget/dialog)button2.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isHidePassword = true;
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
      body: AnimationLimiter(
        child: AnimationConfiguration.synchronized(
          child: Stack(children: [
            SlideAnimation(
              verticalOffset: -300.0,
              duration: Duration(milliseconds: 1200),
              child: Container(
                height: h / 1.2,
                width: w,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(300)),
                    color: brown),
              ),
            ),
            SlideAnimation(
              duration: Duration(milliseconds: 1000),
              verticalOffset: -100.0,
              child: Container(
                height: h / 1.8,
                width: w,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 2000)],
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(300)),
                    color: red),
              ),
            ),
            Container(
              height: h,
              width: w,
              color: black.withOpacity(0.5),
            ),
            SlideAnimation(
              duration: Duration(milliseconds: 1000),
              verticalOffset: 400.0,
              child: Container(
                alignment: kIsWeb ? Alignment.center : null,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kIsWeb ? black1.withOpacity(0.2) : null,
                    ),
                    child: SingleChildScrollView(
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
                                  ScreenSize().checkScreenType(context) ==
                                          'mobile'
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
                              height: 12,
                            ),
                            SizedBox(
                              width: ScreenSize().checkScreenType(context) ==
                                      'mobile'
                                  ? w
                                  : w / 2.5,
                              child: TextField(
                                style: TextStyle(color: white),
                                decoration: InputDecoration(
                                    hintText: 'user name',
                                    hintStyle: TextStyle(color: white2),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: white2,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              width: ScreenSize().checkScreenType(context) ==
                                      'mobile'
                                  ? w
                                  : w / 2.5,
                              child: TextField(
                                style: TextStyle(color: white),
                                obscureText: isHidePassword,
                                decoration: InputDecoration(
                                    hintText: 'password',
                                    hintStyle: TextStyle(color: white2),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isHidePassword = !isHidePassword;
                                          });
                                        },
                                        icon: Icon(
                                          isHidePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: white2,
                                        )),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: white2,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              width: ScreenSize().checkScreenType(context) ==
                                      'mobile'
                                  ? w
                                  : w / 2.5,
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  'Forget Password',
                                  style: TextStyle(
                                      color: white2,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Spacer(),
                            DialogButton(
                                text: "Sign in ",
                                onTap: () {
                                  userCheck();
                                },
                                buttonHeight: h / 12,
                                width: ScreenSize().checkScreenType(context) ==
                                        'mobile'
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't have an account ?",
                                        style: TextStyle(
                                            color: white2,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => SignUp(),
                                              ));
                                        },
                                        child: Text(
                                          'Create account',
                                          style: TextStyle(
                                              decorationColor: white,
                                              decoration:
                                                  TextDecoration.underline,
                                              color: white1,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
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
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  userCheck() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        scrollable: true,
        content: SizedBox(
          width: ScreenSize().checkScreenType(context) == 'mobile' ? w : w / 3,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                      height: h / 2.2,
                      child: Lottie.asset('assets/intro3.json')),
                  Text(
                    "Choose you'r account",
                    style: TextStyle(
                        color: black1,
                        fontSize: 18.dp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Users want before login choose the account type",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: black3,
                        fontSize: 12.dp,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  DialogButton2(
                      color2: Colors.blueGrey,
                      text: 'Sender',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SenderHome(),
                            ));
                      },
                      buttonHeight: h / 10,
                      width: ScreenSize().checkScreenType(context) == 'mobile'
                          ? w
                          : w / 2.5,
                      color: Color.fromARGB(255, 2, 25, 64)),
                  SizedBox(
                    width: w / 2.5,
                    child: Row(
                      children: [
                        Flexible(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "or",
                            style: TextStyle(
                                decorationColor: white,
                                decoration: TextDecoration.underline,
                                color: black2,
                                fontSize: 18.dp,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Flexible(child: Divider()),
                      ],
                    ),
                  ),
                  DialogButton2(
                    text: 'Receiver',
                    onTap: () {},
                    buttonHeight: h / 10,
                    width: ScreenSize().checkScreenType(context) == 'mobile'
                        ? w
                        : w / 2.5,
                    color: black,
                    color2: Colors.blueGrey,
                  )
                ],
              ),
              Positioned(
                  right: 0,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close))),
            ],
          ),
        ),
      ),
    );
  }
}
