import 'package:carousel_slider/carousel_slider.dart';
import 'package:client_app/UI/widget/diloag_button.dart';
import 'package:client_app/const/color.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../../const/const.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List screens = [];
  int x = 0;
  List<String> listitems = [
    "NIC",
    "BR",
  ];
  String? selectval;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => verify());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      body: Column(children: []),
    );
  }

  verify() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        insetPadding: EdgeInsets.all(8),
        contentPadding: EdgeInsets.all(0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Customer Verification Process',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: black,
                        fontSize: 20.dp,
                      )),
                  SizedBox(
                    height: 17,
                  ),
                  Row(
                    children: [
                      Text('Document Type',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: black,
                            fontSize: 12.dp,
                          )),
                      SizedBox(
                        width: 12,
                      ),
                      SizedBox(
                          width: w / 2,
                          height: h / 13,
                          child: customDropDown('ssss', true)),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      imageUploadButton(),
                      imageUploadButton(),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Card(
                      elevation: 20,
                      color: appButtonColorLite,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        child: Text('Next',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: black1,
                              fontSize: 12.dp,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            )

            // CarouselSlider.builder(
            //   itemBuilder: (context, index, realIndex) {
            //     return Column(
            //       children: [
            //         Text('Customer Verification Process',
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //               fontWeight: FontWeight.bold,
            //               color: black,
            //               fontSize: 18.dp,
            //             )),
            //         Row(
            //           children: [
            //             Text('Document Type',
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   fontWeight: FontWeight.normal,
            //                   color: black1,
            //                   fontSize: 12.dp,
            //                 )),
            //             SizedBox(
            //               width: 12,
            //             ),
            //             DialogButton(
            //                 text: 'NIC',
            //                 onTap: () {},
            //                 buttonHeight: h / 13,
            //                 width: w / 5,
            //                 color: appButtonColorLite),
            //             SizedBox(
            //               width: 12,
            //             ),
            //             DialogButton(
            //                 text: 'BR',
            //                 onTap: () {},
            //                 buttonHeight: h / 13,
            //                 width: w / 5,
            //                 color: appButtonColorLite)
            //           ],
            //         ),
            //       ],
            //     );
            //   },
            //   itemCount: 10,
            //   carouselController: _controller,
            //   options: CarouselOptions(
            //       padEnds: true,
            //       aspectRatio: 2.0,
            //       autoPlay: false,
            //       disableCenter: true,
            //       viewportFraction: 1,
            //       enlargeCenterPage: false,
            //       onPageChanged: (index, reason) {
            //         setState(() {
            //           // _current = index;
            //         });
            //       }),
            // ),
          ],
        ),
      ),
    );
  }

  Widget customDropDown(String text, bool isMobile) {
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
            // Padding(
            //   padding: EdgeInsets.all(isMobile ? 12.0 : 8),
            //   child: Icon(
            //     icon,
            //     color: black1,
            //   ),
            // ),
            Text(
              text,
              style: TextStyle(color: black1),
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
                  Padding(
                    padding: EdgeInsets.all(
                        ScreenSize().checkScreenType(context) == 'mobile'
                            ? 8.0
                            : 8),
                    child: Text(
                      itemone,
                      style: TextStyle(color: white),
                    ),
                  ),
                ],
              ));
        }).toList(),
      ),
    );
  }

  imageUploadButton() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return DottedBorder(
      color: Colors.black38,
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      padding: EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          alignment: Alignment.center,
          height: h / 7,
          width: ScreenSize().checkScreenType(context) == 'web' ? w / 5 : w / 4,
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
    );
  }
}
