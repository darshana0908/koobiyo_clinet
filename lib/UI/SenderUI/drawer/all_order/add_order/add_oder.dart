import 'dart:ui';

import 'package:client_app/const/color.dart';
import 'package:client_app/const/const.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:text_scroll/text_scroll.dart';
import '../../../../widget/diloag_button.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({super.key});

  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
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
              // SlideAnimation(
              //   verticalOffset: -300.0,
              //   duration: Duration(milliseconds: 1200),
              //   child: Container(
              //     height: h,
              //     width: w,
              //     decoration: BoxDecoration(
              //         borderRadius:
              //             BorderRadius.only(bottomRight: Radius.circular(300)),
              //         color: const Color.fromARGB(255, 76, 145, 201)),
              //   ),
              // ),
              // SlideAnimation(
              //   duration: Duration(milliseconds: 1000),
              //   verticalOffset: -100.0,
              //   child: Container(
              //     height: h / 1.8,
              //     width: w,
              //     decoration: BoxDecoration(
              //         boxShadow: [BoxShadow(blurRadius: 2000)],
              //         borderRadius:
              //             BorderRadius.only(bottomRight: Radius.circular(300)),
              //         color: Colors.blue),
              //   ),
              // ),
              // Container(
              //   height: h,
              //   width: w,
              //   color: black.withOpacity(0.5),
              // ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: ScreenSize().checkScreenType(context) == 'web'
                          ? 0
                          : 135,
                    ),
                    Container(
                      color: appBlue.withOpacity(0.2),
                      child: TextScroll(
                          delayBefore: Duration(seconds: 2),
                          "For Barcode Issues - Contact 011 7 886 786 Ex 1. බාර් කෝඩ් (තීරු කේත) ගැටලු සදහා 011 7 886 786 අමතා අංක 1 අමතන්න",
                          mode: TextScrollMode.endless,
                          pauseBetween: Duration(seconds: 2),
                          intervalSpaces: 200,
                          style: TextStyle(color: black2, fontSize: 18)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // ScreenSize().checkScreenType(context) == 'web'
                    //     ? SizedBox(
                    //         width: w - w / 10,
                    //         child: Padding(
                    //           padding: const EdgeInsets.all(12.0),
                    //           child: Row(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               addOder(),
                    //               Spacer(),
                    //               uploadOder(),
                    //             ],
                    //           ),
                    //         ),
                    //       )
                    //     :
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          uploadOder(),
                          SizedBox(
                            height: 12,
                          ),
                          addOder(),
                        ],
                      ),
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

  uploadOder() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Card(
        surfaceTintColor: appBlue,
        elevation: 20,
        color: white,
        child: Padding(
          padding: EdgeInsets.all(
              ScreenSize().checkScreenType(context) == 'web' ? 50.0 : 8),
          child: SizedBox(
            width: ScreenSize().checkScreenType(context) == 'web' ? w : w,
            child: Column(
              children: [
                Text(
                  'Upload New Orders',
                  style: TextStyle(
                      color: black, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 13,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            oderUploadHelp();
                          },
                          child: Text(
                            'Help ?',
                            style: TextStyle(color: black2),
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.print,
                            size: 30,
                            color: black3,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                      onTap: () {},
                      child: Card(
                        elevation: 20,
                        color: Color.fromARGB(255, 46, 229, 126),
                        child: Container(
                          width: ScreenSize().checkScreenType(context) == 'web'
                              ? w / 5
                              : w / 1.5,
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Download Template',
                                style: TextStyle(
                                    color: black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.file_download_outlined),
                            ],
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: DottedBorder(
                    color: Colors.black38,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                    padding: EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        alignment: Alignment.center,
                        height: h / 7,
                        width: ScreenSize().checkScreenType(context) == 'web'
                            ? w / 5
                            : w / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_upload_outlined,
                              size: 40,
                              color: Color.fromARGB(95, 149, 146, 146),
                            ),
                            Text('Please upload \nyour File',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black38,
                                  fontSize: 12.dp,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                DialogButton(
                    text: "Upload",
                    onTap: () {},
                    buttonHeight: h / 12,
                    width: ScreenSize().checkScreenType(context) == 'web'
                        ? w / 5
                        : w / 1.5,
                    color: appButtonColorLite),
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
      surfaceTintColor: appBlue,
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
                'Add new Orders',
                style: TextStyle(
                    color: black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          oderUploadHelp();
                        },
                        child: Text(
                          'Help ?',
                          style: TextStyle(color: black2),
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.print,
                          size: 30,
                          color: black3,
                        )),
                  ],
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      style: TextStyle(color: black),
                      decoration: InputDecoration(
                          hintText: 'Waybill Id',
                          hintStyle: TextStyle(color: black2),
                          prefixIcon: Icon(
                            Icons.person,
                            color: black2,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: TextField(
                      style: TextStyle(color: black),
                      decoration: InputDecoration(
                          hintText: 'Oder No',
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
                style: TextStyle(color: black),
                decoration: InputDecoration(
                    hintText: 'Customer Name',
                    hintStyle: TextStyle(color: black2),
                    prefixIcon: Icon(
                      Icons.person,
                      color: black2,
                    )),
              ),
              SizedBox(
                height: 13,
              ),
              TextField(
                style: TextStyle(color: black),
                decoration: InputDecoration(
                    hintText: 'Customer Address',
                    hintStyle: TextStyle(color: black2),
                    prefixIcon: Icon(
                      Icons.person,
                      color: black2,
                    )),
              ),
              SizedBox(
                height: 13,
              ),
              Flexible(
                child: TextField(
                  style: TextStyle(color: black2),
                  decoration: InputDecoration(
                      hintText: 'Phone number',
                      hintStyle: TextStyle(color: black2),
                      prefixIcon: Icon(
                        Icons.person,
                        color: black2,
                      )),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Flexible(
                child: TextField(
                  style: TextStyle(color: black2),
                  decoration: InputDecoration(
                      hintText: 'Oder Description',
                      hintStyle: TextStyle(color: black2),
                      prefixIcon: Icon(
                        Icons.person,
                        color: black2,
                      )),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              ScreenSize().checkScreenType(context) == 'web'
                  ? Row(
                      children: [
                        Flexible(
                          child: customDropDown(
                              Icons.local_offer_rounded,
                              'Select District',
                              ScreenSize().checkScreenType(context) ==
                                  'mobile'),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Flexible(
                          child: customDropDown(
                              Icons.pin_drop_rounded,
                              'Select City',
                              ScreenSize().checkScreenType(context) ==
                                  'mobile'),
                        ),
                      ],
                    )
                  : Column(children: [
                      customDropDown(
                          Icons.local_offer_rounded,
                          'Select District',
                          ScreenSize().checkScreenType(context) == 'mobile'),
                      SizedBox(
                        height: 13,
                      ),
                      customDropDown(Icons.pin_drop_rounded, 'Select City',
                          ScreenSize().checkScreenType(context) == 'mobile'),
                    ]),
              SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      style: TextStyle(color: black2),
                      decoration: InputDecoration(
                          hintText: 'Product Value',
                          hintStyle: TextStyle(color: black2),
                          prefixIcon: Icon(
                            Icons.person,
                            color: black2,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: TextField(
                      style: TextStyle(color: black2),
                      decoration: InputDecoration(
                          hintText: 'COD',
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
                style: TextStyle(color: black2),
                decoration: InputDecoration(
                    hintText: 'Note',
                    hintStyle: TextStyle(color: black2),
                    prefixIcon: Icon(
                      Icons.person,
                      color: black2,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              DialogButton(
                  text: "Save ",
                  onTap: () {},
                  buttonHeight: h / 12,
                  width: ScreenSize().checkScreenType(context) == 'mobile'
                      ? w / 1.5
                      : w / 2.5,
                  color: appButtonColorLite),
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
