import 'dart:ui';

import 'package:client_app/const/color.dart';
import 'package:client_app/const/const.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:text_scroll/text_scroll.dart';
import '../../../../widget/diloag_button.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  TextEditingController billId = TextEditingController();
  TextEditingController oderId = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController addres = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController cod = TextEditingController();
  TextEditingController note = TextEditingController();
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
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: AnimationLimiter(
            child: AnimationConfiguration.synchronized(
          child: Container(
            width: w,
            height: h,
            child: Stack(children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: ScreenSize().checkScreenType(context) == 'web'
                          ? 0
                          : 135,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ScreenSize().checkScreenType(context) == 'web'
                        ? Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: w / 2,
                                  child: addOder(),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Flexible(child: profileVerify())
                              ],
                            ),
                          )
                        : Column(
                            children: [profileVerify(), addOder()],
                          )
                  ],
                ),
              )
            ]),
          ),
        )),
      ),
    );
  }

  Widget profileVerify() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Card(
          elevation: 20,
          color: Colors.orangeAccent,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'OTP Verification',
                    style: TextStyle(
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Enable or Disable Finance OTP',
                          style: TextStyle(
                              color: black1,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Card(
          elevation: 20,
          color: Colors.orangeAccent,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profile Verification',
                    style: TextStyle(
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Pending Verification',
                          style: TextStyle(
                              color: black1,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        uploadOder()
      ],
    );
  }

  uploadOder() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Card(
        elevation: 20,
        color: backgroundColor2,
        child: SizedBox(
          width: w,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Security',
                  style: TextStyle(
                      color: black, fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Change your Password',
                  style: TextStyle(
                      color: black1, fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  style: TextStyle(color: black, fontSize: 12),
                  decoration: InputDecoration(
                      hintText: 'Old Password',
                      hintStyle: TextStyle(color: black2),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: black2,
                      )),
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  style: TextStyle(color: black, fontSize: 12),
                  decoration: InputDecoration(
                      hintText: 'New Password',
                      hintStyle: TextStyle(color: black2),
                      prefixIcon: Icon(
                        Icons.zoom_out_map,
                        color: black2,
                      )),
                ),
                SizedBox(
                  height: 12,
                ),
                TextField(
                  style: TextStyle(color: black, fontSize: 12),
                  decoration: InputDecoration(
                      hintText: 'New Password',
                      hintStyle: TextStyle(color: black2),
                      prefixIcon: Icon(
                        Icons.devices_other_sharp,
                        color: black2,
                      )),
                ),
                SizedBox(
                  height: 12,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 20,
                  child: DialogButton(
                      text: "CHANGE PASSWORD",
                      onTap: () {},
                      buttonHeight: h / 13,
                      width: w,
                      color: red),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  addOder() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Card(
      elevation: 20,
      // surfaceTintColor: appBlue,
      color: backgroundColor2,
      child: Padding(
        padding: EdgeInsets.all(
            ScreenSize().checkScreenType(context) == 'web' ? 50.0 : 8),
        child: SizedBox(
          width: ScreenSize().checkScreenType(context) == 'web' ? w : w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Edit Profile',
                style: TextStyle(
                    color: black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Business Details( Store)',
                  style: TextStyle(
                      color: black2, fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      style: TextStyle(color: black, fontSize: 12),
                      decoration: InputDecoration(
                          hintText: 'Business Name',
                          hintStyle: TextStyle(color: black2),
                          prefixIcon: Icon(
                            Icons.home,
                            color: black2,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: TextField(
                      style: TextStyle(color: black, fontSize: 12),
                      decoration: InputDecoration(
                          hintText: 'User Name',
                          hintStyle: TextStyle(color: black2),
                          prefixIcon: Icon(
                            Icons.person,
                            color: black2,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              TextField(
                style: TextStyle(color: black, fontSize: 12),
                decoration: InputDecoration(
                    hintText: 'Business Address',
                    hintStyle: TextStyle(color: black2),
                    prefixIcon: Icon(
                      Icons.add_business_outlined,
                      color: black2,
                    )),
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      style: TextStyle(color: black, fontSize: 12),
                      decoration: InputDecoration(
                          hintText: 'Primary Phone',
                          hintStyle: TextStyle(color: black2),
                          prefixIcon: Icon(
                            Icons.call,
                            color: black2,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: TextField(
                      style: TextStyle(color: black, fontSize: 12),
                      decoration: InputDecoration(
                          hintText: 'Primary Email',
                          hintStyle: TextStyle(color: black2),
                          prefixIcon: Icon(
                            Icons.email,
                            color: black2,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pickup Details',
                  style: TextStyle(
                      color: black2, fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      style: TextStyle(color: black, fontSize: 12),
                      decoration: InputDecoration(
                          hintText: 'Pickup Address',
                          hintStyle: TextStyle(color: black2),
                          prefixIcon: Icon(
                            Icons.home_max_rounded,
                            color: black2,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: TextField(
                      style: TextStyle(color: black, fontSize: 12),
                      decoration: InputDecoration(
                          hintText: 'Pickup Phone',
                          hintStyle: TextStyle(color: black2),
                          prefixIcon: Icon(
                            Icons.call_end_outlined,
                            color: black2,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      style: TextStyle(color: black, fontSize: 12),
                      decoration: InputDecoration(
                          hintText: 'Delivery Email',
                          hintStyle: TextStyle(color: black2),
                          prefixIcon: Icon(
                            Icons.attach_email_outlined,
                            color: black2,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: TextField(
                      style: TextStyle(color: black, fontSize: 12),
                      decoration: InputDecoration(
                          hintText: 'Delivery Phone No',
                          hintStyle: TextStyle(color: black2),
                          prefixIcon: Icon(
                            Icons.call_sharp,
                            color: black2,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Bank Account Details',
                  style: TextStyle(
                      color: black2, fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Flexible(
                child: TextField(
                  style: TextStyle(color: black, fontSize: 12),
                  decoration: InputDecoration(
                      hintText: 'Account Holder Name',
                      hintStyle: TextStyle(color: black2),
                      prefixIcon: Icon(
                        Icons.person_2_outlined,
                        color: black2,
                      )),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      style: TextStyle(color: black, fontSize: 12),
                      decoration: InputDecoration(
                          hintText: 'Branch Name',
                          hintStyle: TextStyle(color: black2),
                          prefixIcon: Icon(
                            Icons.add_chart_outlined,
                            color: black2,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: TextField(
                      style: TextStyle(color: black, fontSize: 12),
                      decoration: InputDecoration(
                          hintText: 'Account No',
                          hintStyle: TextStyle(color: black2),
                          prefixIcon: Icon(
                            Icons.add_to_photos_sharp,
                            color: black2,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      style: TextStyle(color: black, fontSize: 12),
                      decoration: InputDecoration(
                          hintText: 'Bank Name',
                          hintStyle: TextStyle(color: black2),
                          prefixIcon: Icon(
                            Icons.apps_outage,
                            color: black2,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: TextField(
                      style: TextStyle(color: black, fontSize: 12),
                      decoration: InputDecoration(
                          hintText: 'Vat Account Details',
                          hintStyle: TextStyle(color: black2),
                          prefixIcon: Icon(
                            Icons.add_reaction_sharp,
                            color: black2,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 20,
                child: DialogButton(
                    text: "UPDATE PROFILE",
                    onTap: () {},
                    buttonHeight: h / 12,
                    width: ScreenSize().checkScreenType(context) == 'mobile'
                        ? w / 1.5
                        : w / 2.5,
                    color: const Color.fromARGB(255, 4, 181, 95)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  oderUploadHelp() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.all(0),
        insetPadding: EdgeInsets.all(0),
        content: Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.close))),
              Text(
                'Note',
                style: TextStyle(
                    color: black1, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Icon(Icons.circle),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Waybill Id - Barcode no',
                    style: TextStyle(
                        color: black1,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Icon(Icons.circle),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    ' COD - Item value + Delivery Charge',
                    style: TextStyle(
                        color: black1,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
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
                color: black1,
              ),
            ),
            Flexible(
              child: Text(
                text,
                style: TextStyle(color: black1),
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
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: white,
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(
                          ScreenSize().checkScreenType(context) == 'mobile'
                              ? 8.0
                              : 8),
                      child: Text(
                        itemone,
                        style: TextStyle(color: white),
                      ),
                    ),
                  ),
                ],
              ));
        }).toList(),
      ),
    );
  }
}
