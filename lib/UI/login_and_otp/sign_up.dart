import 'dart:ui';
import 'package:client_app/UI/widget/diloag_button.dart';
import 'package:client_app/const/color.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../const/const.dart';
import '../widget/custom_TextField.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isHidePassword = true;
  TextEditingController name = TextEditingController();
  TextEditingController nic = TextEditingController();
  TextEditingController businessName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController pEmail = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  List<String> listitems = [
    "Tokyo",
    "London",
    "New York",
    "Sanghaicsbzchbhbhabhbdhbc  s bchbscx s scsc s scbsac acnja",
    "Moscow",
    "Hong Kong"
  ];
  String? selectval;
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: white,
              )),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: AnimationLimiter(
        child: AnimationConfiguration.synchronized(
          child: Stack(
            children: [
              Stack(children: [
                SlideAnimation(
                  verticalOffset: -300.0,
                  duration: Duration(milliseconds: 1200),
                  child: Container(
                    height: h / 1.2,
                    width: w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(300)),
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
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(300)),
                        color: red),
                  ),
                ),
                Container(
                  height: h,
                  width: w,
                  color: black.withOpacity(0.5),
                ),
                SlideAnimation(
                  duration: Duration(milliseconds: 600),
                  verticalOffset: 400.0,
                  child: FadeInAnimation(
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
                              width: kIsWeb ? w : w,
                              child: Column(
                                crossAxisAlignment:
                                    ScreenSize().checkScreenType(context) ==
                                            'mobile'
                                        ? CrossAxisAlignment.start
                                        : CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 70,
                                  ),
                                  Text(
                                    'Sign Up',
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
                                    'We are happy to see you here',
                                    style: TextStyle(
                                        color: white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(
                                    height: h / 20,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                    width:
                                        ScreenSize().checkScreenType(context) ==
                                                'mobile'
                                            ? w
                                            : w / 2.5,
                                    child: CustomTextField(
                                        controller: name,
                                        icon: Icons.person,
                                        text: 'Name'),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                    width:
                                        ScreenSize().checkScreenType(context) ==
                                                'mobile'
                                            ? w
                                            : w / 2.5,
                                    child: CustomTextField(
                                        controller: name,
                                        icon: Icons.casino_rounded,
                                        text: 'NIC'),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                    width:
                                        ScreenSize().checkScreenType(context) ==
                                                'mobile'
                                            ? w
                                            : w / 2.5,
                                    child: CustomTextField(
                                        controller: name,
                                        icon: Icons.accessibility_new,
                                        text: 'Business Name'),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                    width:
                                        ScreenSize().checkScreenType(context) ==
                                                'mobile'
                                            ? w
                                            : w / 2.5,
                                    child: CustomTextField(
                                        controller: name,
                                        icon: Icons.add_business_rounded,
                                        text: 'address'),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                    width:
                                        ScreenSize().checkScreenType(context) ==
                                                'mobile'
                                            ? w
                                            : w / 2.5,
                                    child: CustomTextField(
                                        controller: name,
                                        icon: Icons.assignment_ind_outlined,
                                        text: 'User Name'),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                    width:
                                        ScreenSize().checkScreenType(context) ==
                                                'mobile'
                                            ? w
                                            : w / 2.5,
                                    child: CustomTextField(
                                        controller: name,
                                        icon: Icons.call,
                                        text: 'Mobile'),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                    width:
                                        ScreenSize().checkScreenType(context) ==
                                                'mobile'
                                            ? w
                                            : w / 2.5,
                                    child: customDropDown(
                                        Icons.local_offer_rounded,
                                        'Select District',
                                        ScreenSize().checkScreenType(context) ==
                                            'mobile'),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                    width:
                                        ScreenSize().checkScreenType(context) ==
                                                'mobile'
                                            ? w
                                            : w / 2.5,
                                    child: customDropDown(
                                        Icons.pin_drop_rounded,
                                        'Select City',
                                        ScreenSize().checkScreenType(context) ==
                                            'mobile'),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                    height: h / 14,
                                    width:
                                        ScreenSize().checkScreenType(context) ==
                                                'mobile'
                                            ? w
                                            : w / 2.5,
                                    child: TextField(
                                      style: TextStyle(color: white),
                                      obscureText: isHidePassword,
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide:
                                                  BorderSide(color: white2)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide:
                                                  BorderSide(color: white3)),
                                          hintText: 'password',
                                          hintStyle: TextStyle(color: white2),
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isHidePassword =
                                                      !isHidePassword;
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
                                  SizedBox(
                                    height: h / 14,
                                    width:
                                        ScreenSize().checkScreenType(context) ==
                                                'mobile'
                                            ? w
                                            : w / 2.5,
                                    child: TextField(
                                      style: TextStyle(color: white),
                                      obscureText: isHidePassword,
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide:
                                                  BorderSide(color: white2)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide:
                                                  BorderSide(color: white3)),
                                          hintText: 'Confirm Password',
                                          hintStyle: TextStyle(color: white2),
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isHidePassword =
                                                      !isHidePassword;
                                                });
                                              },
                                              icon: Icon(
                                                isHidePassword
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: white2,
                                              )),
                                          prefixIcon: Icon(
                                            Icons.lock_reset_sharp,
                                            color: white2,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  DialogButton(
                                      text: "Sign in ",
                                      onTap: () {},
                                      buttonHeight: h / 12,
                                      width: ScreenSize()
                                                  .checkScreenType(context) ==
                                              'mobile'
                                          ? w
                                          : w / 2.5,
                                      color: black),
                                  SizedBox(
                                    width: w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Already have an account',
                                              style: TextStyle(
                                                  color: white2,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 12,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Login',
                                                style: TextStyle(
                                                    decorationColor: white,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: white1,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                          'Need help?',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: white2,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget customDropDown(IconData icon, String text, bool isMobile) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: white2, width: 0.6)),
      child: DropdownButton(
        dropdownColor: black1,
        icon: Icon(
          Icons.arrow_drop_down_outlined,
          color: white2,
        ),
        underline: SizedBox(),
        isExpanded: true,
        padding: EdgeInsets.only(right: 20),
        alignment: AlignmentDirectional.centerEnd,
        hint: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(isMobile ? 12.0 : 8),
              child: Icon(
                icon,
                color: white2,
              ),
            ),
            Flexible(
              child: Text(
                text,
                style: TextStyle(color: white3),
              ),
            ),
          ],
        ),

        value: selectval,

        //implement initial value or selected value
        onChanged: (value) {
          setState(() {
            //set state will update UI and State of your App
            selectval = value.toString(); //change selectval to new value
          });
        },
        items: listitems.map((itemone) {
          return DropdownMenuItem(
              value: itemone,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                          ScreenSize().checkScreenType(context) == 'mobile'
                              ? 0.8
                              : 0.0),
                      child: Icon(
                        icon,
                        color: white2,
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.all(
                            ScreenSize().checkScreenType(context) == 'mobile'
                                ? 8.0
                                : 8),
                        child: Text(
                          itemone,
                          style: TextStyle(color: white2),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        }).toList(),
      ),
    );
  }
}
