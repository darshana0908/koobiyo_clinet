import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:client_app/const/color.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../../const/const.dart';
import '../../../../../provider/provider.dart';
import 'profileDetails.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  XFile? nicFront;
  XFile? nicBack;
  XFile? brCopy;
  Uint8List? registrationImage;
  Uint8List webnicFront = Uint8List(10);
  Uint8List webnicBack = Uint8List(10);
  Uint8List webbrCopy = Uint8List(10);

  final picker = ImagePicker();
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List screens = [];
  int x = 0;
  List<String> listitems = [
    "NIC",
    "BR",
  ];
  String selectval = 'NIC';
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
      body: ProfileDetails(),
    );
  }

  verify() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (context) => Consumer<ProviderS>(
        builder: (context, provider, child) =>
            StatefulBuilder(builder: (context, state) {
          return AlertDialog(
            alignment: Alignment.center,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            insetPadding: EdgeInsets.all(8),
            contentPadding: EdgeInsets.all(0),
            content: SizedBox(
              width: w / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Document Type',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: black2,
                                  fontSize: 14.dp,
                                )),
                            SizedBox(
                              width: 12,
                            ),
                            SizedBox(
                                width: w / 5, child: customDropDown1(true)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        provider.type == 'NIC'
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  nicFront == null
                                      ? imageUploadButton(() async {
                                          final ImagePicker _picker =
                                              ImagePicker();

                                          final img = await _picker.pickImage(
                                              source: ImageSource.gallery);
                                          var f = await img!.readAsBytes();
                                          state(() {
                                            webnicFront = f;
                                            nicFront = img;
                                          });
                                        }, 'UPLOAD NIC \nFRONT HERE')
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: SizedBox(
                                              height: h / 6,
                                              child: kIsWeb
                                                  ? Image.memory(webnicFront)
                                                  : Image.file(
                                                      File(nicFront!.path))),
                                        ),
                                  nicBack == null
                                      ? imageUploadButton(() async {
                                          final ImagePicker _picker =
                                              ImagePicker();
                                          final img = await _picker.pickImage(
                                              source: ImageSource.gallery);
                                          var f = await img!.readAsBytes();

                                          state(() {
                                            nicBack = img;
                                            webnicBack = f;
                                          });
                                        }, 'UPLOAD NIC \nBACK HERE')
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: SizedBox(
                                              height: h / 6,
                                              child: kIsWeb
                                                  ? Image.memory(webnicBack)
                                                  : Image.file(
                                                      File(nicBack!.path))),
                                        ),
                                ],
                              )
                            : brCopy == null
                                ? imageUploadButton(() async {
                                    final ImagePicker _picker = ImagePicker();
                                    final img = await _picker.pickImage(
                                        source: ImageSource.gallery);
                                    var f = await img!.readAsBytes();
                                    state(() {
                                      webbrCopy = f;
                                      brCopy = img;
                                    });
                                  }, 'UPLOAD BR \nCOPY HERE')
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                        height: h / 6,
                                        child: kIsWeb
                                            ? Image.memory(webbrCopy)
                                            : Image.file(File(brCopy!.path))),
                                  ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () async {
                              Navigator.pop(context);
                              verify2();
                            },
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
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  verify2() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (context) => Consumer<ProviderS>(
        builder: (context, provider, child) =>
            StatefulBuilder(builder: (context, state) {
          return AlertDialog(
            alignment: Alignment.center,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            insetPadding: EdgeInsets.all(8),
            contentPadding: EdgeInsets.all(0),
            content: SizedBox(
              width: w / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Document Type',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: black2,
                                  fontSize: 14.dp,
                                )),
                            SizedBox(
                              width: 12,
                            ),
                            SizedBox(
                                width: w / 5, child: customDropDown1(true)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              verify3();
                            },
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
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  verify3() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (context) => Consumer<ProviderS>(
        builder: (context, provider, child) =>
            StatefulBuilder(builder: (context, state) {
          return AlertDialog(
            alignment: Alignment.center,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            insetPadding: EdgeInsets.all(8),
            contentPadding: EdgeInsets.all(0),
            content: SizedBox(
              width: w / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        Text('pickup Location',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: black2,
                              fontSize: 14.dp,
                            )),
                        SizedBox(
                          height: 17,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('District',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: black2,
                                  fontSize: 14.dp,
                                )),
                            SizedBox(
                              width: 12,
                            ),
                            SizedBox(
                                width: w / 5, child: customDropDown1(true)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('City      ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: black2,
                                  fontSize: 14.dp,
                                )),
                            SizedBox(
                              width: 12,
                            ),
                            SizedBox(
                                width: w / 5, child: customDropDown1(true)),
                          ],
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                verify2();
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Card(
                                  elevation: 20,
                                  color: Colors.greenAccent,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 5),
                                    child: Text('PREVIOUS',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: black1,
                                          fontSize: 12.dp,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                verify4();
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Card(
                                  elevation: 20,
                                  color: appButtonColorLite,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 5),
                                    child: Text('NEXT',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: black1,
                                          fontSize: 12.dp,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  verify4() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (context) => Consumer<ProviderS>(
        builder: (context, provider, child) =>
            StatefulBuilder(builder: (context, state) {
          return AlertDialog(
            alignment: Alignment.center,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            insetPadding: EdgeInsets.all(8),
            contentPadding: EdgeInsets.all(0),
            content: SizedBox(
              width: w / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        Text('Business Location',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: black2,
                              fontSize: 14.dp,
                            )),
                        SizedBox(
                          height: 17,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('District',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: black2,
                                  fontSize: 14.dp,
                                )),
                            SizedBox(
                              width: 12,
                            ),
                            SizedBox(
                                width: w / 5, child: customDropDown1(true)),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('City      ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: black2,
                                  fontSize: 14.dp,
                                )),
                            SizedBox(
                              width: 12,
                            ),
                            SizedBox(
                                width: w / 5, child: customDropDown1(true)),
                          ],
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                verify3();
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Card(
                                  elevation: 20,
                                  color: Colors.greenAccent,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 5),
                                    child: Text('PREVIOUS',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: black1,
                                          fontSize: 12.dp,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Card(
                                  elevation: 20,
                                  color: appButtonColorLite,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 5),
                                    child: Text('NEXT',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: black1,
                                          fontSize: 12.dp,
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  selectImg() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    Consumer<ProviderS>(
      builder: (context, provider, child) => SizedBox(
        width: w / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Document Type',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: black2,
                            fontSize: 14.dp,
                          )),
                      SizedBox(
                        width: 12,
                      ),
                      SizedBox(width: w / 5, child: customDropDown1(true)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  provider.type == 'NIC'
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            nicFront == null
                                ? imageUploadButton(() async {
                                    final ImagePicker _picker = ImagePicker();

                                    final img = await _picker.pickImage(
                                        source: ImageSource.gallery);
                                    var f = await img!.readAsBytes();
                                    setState(() {});
                                    (() {
                                      webnicFront = f;
                                      nicFront = img;
                                    });
                                  }, 'UPLOAD NIC \nFRONT HERE')
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                        height: h / 6,
                                        child: kIsWeb
                                            ? Image.memory(webnicFront)
                                            : Image.file(File(nicFront!.path))),
                                  ),
                            nicBack == null
                                ? imageUploadButton(() async {
                                    final ImagePicker _picker = ImagePicker();
                                    final img = await _picker.pickImage(
                                        source: ImageSource.gallery);
                                    var f = await img!.readAsBytes();

                                    setState(() {
                                      nicBack = img;
                                      webnicBack = f;
                                    });
                                  }, 'UPLOAD NIC \nBACK HERE')
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                        height: h / 6,
                                        child: kIsWeb
                                            ? Image.memory(webnicBack)
                                            : Image.file(File(nicBack!.path))),
                                  ),
                          ],
                        )
                      : brCopy == null
                          ? imageUploadButton(() async {
                              final ImagePicker _picker = ImagePicker();
                              final img = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              var f = await img!.readAsBytes();
                              setState(() {
                                webbrCopy = f;
                                brCopy = img;
                              });
                            }, 'UPLOAD BR \nCOPY HERE')
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                  height: h / 6,
                                  child: kIsWeb
                                      ? Image.memory(webbrCopy)
                                      : Image.file(File(brCopy!.path))),
                            ),
                  SizedBox(
                    height: 20,
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

  Widget customDropDown1(bool isMobile) {
    return Consumer<ProviderS>(
      builder: (context, provider, child) => Container(
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: white, width: 0.6)),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: white,
          ),
          child: DropdownButton(
            style: TextStyle(backgroundColor: white),
            dropdownColor: white,
            borderRadius: BorderRadius.circular(10),
            focusColor: white,
            icon: Icon(
              Icons.arrow_drop_down_outlined,
              color: black,
            ),
            underline: SizedBox(),
            isExpanded: true,
            padding: EdgeInsets.only(right: 20),
            alignment: AlignmentDirectional.centerEnd,
            hint: Container(
              padding: EdgeInsets.only(left: 12),
              alignment: Alignment.centerLeft,
              child: Text(
                'sssss',
                style: TextStyle(
                    color: black3,
                    fontSize: 14.dp,
                    fontWeight: FontWeight.normal),
              ),
            ),

            value: provider.type,

            //implement initial value or selected value
            onChanged: (value) {
              setState(() {
                //set state will update UI and State of your App
                Provider.of<ProviderS>(context, listen: false).type =
                    value.toString(); //change selectval to new value
              });
            },
            items: listitems.map((itemone) {
              return DropdownMenuItem(
                  value: itemone,
                  child: Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          // child: Icon(
                          //   ico,
                          //   color: black,
                          // ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.all(
                                ScreenSize().checkScreenType(context) ==
                                        'mobile'
                                    ? 8.0
                                    : 8),
                            child: Text(
                              itemone,
                              style: TextStyle(color: black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            }).toList(),
          ),
        ),
      ),
    );
  }

  Future getImageFromGallery(int img) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (img == 1) {
        if (pickedFile != null) {
          nicFront = pickedFile;
        }
      } else if (img == 2) {
        if (pickedFile != null) {
          nicBack = pickedFile;
        }
      } else if (img == 3) {
        if (pickedFile != null) {
          brCopy = pickedFile;
        }
      }
    });
  }

  imageUploadButton(VoidCallback onTap, String text) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
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
            width:
                ScreenSize().checkScreenType(context) == 'web' ? w / 6 : w / 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cloud_upload_outlined,
                  size: 40,
                  color: Color.fromARGB(95, 149, 146, 146),
                ),
                Text(text,
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
    );
  }
}
