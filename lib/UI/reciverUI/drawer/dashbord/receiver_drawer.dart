import 'dart:ui';
import 'package:client_app/UI/SenderUI/drawer/all_order/add_order/add_oder.dart';
import 'package:client_app/UI/SenderUI/drawer/contact/HO_contact.dart/ho_contacts.dart';
import 'package:client_app/UI/SenderUI/drawer/dashbord/dashbord.dart';
import 'package:client_app/UI/widget/drower/drower_button.dart';
import 'package:client_app/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
import '../../../../../const/color.dart';
import '../../../../../const/const.dart';
import '../my_order/my_oder.dart';
import 'ReceiverDashBoard.dart';

class ReceiverCustomDrawer extends StatefulWidget {
  const ReceiverCustomDrawer({super.key});

  @override
  State<ReceiverCustomDrawer> createState() => _ReceiverCustomDrawerState();
}

class _ReceiverCustomDrawerState extends State<ReceiverCustomDrawer> {
  bool tap = false;
  bool lite = false;
  bool en = false;
  int tileIndex = 1;

  List modeData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List drawerButtonList = [];
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1000, sigmaY: 10),
        child: Drawer(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: white.withOpacity(0.4),
            child: SingleChildScrollView(child: ReciverCustomDrawerWidget())),
      ),
    );
  }
}

class ReciverCustomDrawerWidget extends StatefulWidget {
  const ReciverCustomDrawerWidget({super.key});

  @override
  State<ReciverCustomDrawerWidget> createState() =>
      _ReciverCustomDrawerWidgetState();
}

class _ReciverCustomDrawerWidgetState extends State<ReciverCustomDrawerWidget> {
  bool isTap = false;
  int selectedIndex = 1;
  List buttonList = [
    {'icon': Icons.grid_view_rounded, 'text': 'DashBoard', 'id': 1},
    {'icon': Icons.shopping_cart_checkout_rounded, 'text': 'My Oder', 'id': 2},
    {'icon': Icons.home_outlined, 'text': 'Finance', 'id': 3},
    {'icon': Icons.copy, 'text': 'Reports', 'id': 4},
    {'icon': Icons.money_off, 'text': 'Delivery Rates', 'id': 5},
    {'icon': Icons.info, 'text': 'Issues', 'id': 6},
    {'icon': Icons.call, 'text': 'Requests', 'id': 7},
    {'icon': Icons.contact_emergency_rounded, 'text': 'Contacts', 'id': 8},
  ];
  bool select = false;
  bool select2 = false;
  bool select3 = false;
  bool select4 = false;
  bool select5 = false;
  bool select6 = false;
  bool select7 = false;
  bool button = false;
  int titleIndex = 1;
  int x = 0;
  int y = 0;
  String key = '';
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      width: ScreenSize().checkScreenType(context) == 'mobile' ? w : w / 5,
      child: Stack(
        children: [
          Container(
            height: h / 1.2,
            width: w,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 2000)],
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(300)),
                color: stackColor1),
          ),
          Container(
            height: h / 1.8,
            width: w,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 2000)],
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(300)),
                color: stackColor2),
          ),
          Container(
            height: h,
            width: w,
            color: black.withOpacity(0.5),
          ),
          SizedBox(
            height: h,
            child: SingleChildScrollView(
              child: Column(
                // Important: Remove any padding from the ListView.
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  ScreenSize().checkScreenType(context) != 'web'
                      ? Container(
                          alignment:
                              ScreenSize().checkScreenType(context) == 'tab'
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                color: white2,
                              )),
                        )
                      : SizedBox(),
                  SizedBox(
                    height: h / 30,
                  ),
                  Text(
                    'Koombiyo Delivery',
                    style: TextStyle(
                      fontSize: 22.dp,
                      color: white1,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: h,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: buttonList.length,
                      itemBuilder: (context, index) {
                        return CustomDrawerButton(
                            firstIndex: buttonList[index]['id'],
                            isTap: titleIndex == buttonList[index]['id'],
                            onTap: () {
                              print(buttonList[index]['id']);
                              if (buttonList[index]['id'] == 1) {
                                BackDrawer().back(context);
                                Provider.of<ProviderS>(context, listen: false)
                                    .receiverSelectWidget = ReceiverDashBoard();
                                setState(() {
                                  key = '100';
                                });
                              }
                              if (buttonList[index]['id'] == 2) {
                                BackDrawer().back(context);
                                Provider.of<ProviderS>(context, listen: false)
                                    .receiverSelectWidget = MyOder();
                                setState(() {
                                  key = '200';
                                });
                              }
                              setState(() {
                                if (titleIndex == buttonList[index]['id']) {
                                  // If the tapped item is already selected, unselect it
                                  titleIndex = 1;
                                } else {
                                  // Otherwise, select the tapped item
                                  titleIndex = buttonList[index]['id'];
                                }
                              });
                            },
                            list: titleIndex == 0
                                ? SizedBox()
                                : titleIndex == 1
                                    ? SizedBox()
                                    : titleIndex == 2
                                        ? Column(children: [
                                            tileButton('Add Orders', () {
                                              BackDrawer().back(context);
                                              Provider.of<ProviderS>(context,
                                                      listen: false)
                                                  .selectedWidet = AddOrder();
                                              setState(() {
                                                key = '1';
                                              });
                                            }, '1', key),
                                            tileButton('Upload Orders', () {
                                              BackDrawer().back(context);
                                              // Provider.of<ProviderS>(context,
                                              //             listen: false)
                                              //         .selectedWidet =
                                              //     // DataTableScreen();

                                              setState(() {
                                                key = '2';
                                              });
                                            }, '2', key),
                                            tileButton('View Orders', () {
                                              BackDrawer().back(context);
                                              // Provider.of<ProviderS>(context,
                                              //         listen: false)
                                              //     .selectedWidet = ViewOrders();
                                              setState(() {
                                                key = '3';
                                              });
                                            }, '3', key),
                                            tileButton('Return Receive', () {
                                              BackDrawer().back(context);
                                              // Provider.of<ProviderS>(context,
                                              //             listen: false)
                                              //         .selectedWidet =
                                              //     ReturnReceive();

                                              setState(() {
                                                key = '4';
                                              });
                                            }, '4', key)
                                          ])
                                        : titleIndex == 3
                                            ? Column(children: [
                                                tileButton('Payment Summary',
                                                    () {
                                                  BackDrawer().back(context);
                                                  // Provider.of<ProviderS>(
                                                  //             context,
                                                  //             listen: false)
                                                  //         .selectedWidet =
                                                  //     PaymentSummery();

                                                  setState(() {
                                                    key = '5';
                                                  });
                                                }, '5', key),
                                                tileButton('Received COD', () {
                                                  BackDrawer().back(context);
                                                  // Provider.of<ProviderS>(
                                                  //             context,
                                                  //             listen: false)
                                                  //         .selectedWidet =
                                                  //     ReceivedCOD();
                                                  setState(() {
                                                    key = '6';
                                                  });
                                                }, '6', key),
                                              ])
                                            : titleIndex == 4
                                                ? Column(children: [
                                                    tileButton('Oder Report',
                                                        () {
                                                      BackDrawer()
                                                          .back(context);
                                                      // Provider.of<ProviderS>(
                                                      //             context,
                                                      //             listen: false)
                                                      //         .selectedWidet =
                                                      //     OderReportScreen();
                                                      setState(() {
                                                        key = '7';
                                                      });
                                                    }, '7', key),
                                                    tileButton(
                                                        'Delivery Report', () {
                                                      BackDrawer()
                                                          .back(context);
                                                      // Provider.of<ProviderS>(
                                                      //             context,
                                                      //             listen: false)
                                                      //         .selectedWidet =
                                                      //     DeliveryReport();
                                                      setState(() {
                                                        key = '8';
                                                      });
                                                    }, '8', key),
                                                    tileButton(
                                                        'Complete Orders', () {
                                                      BackDrawer()
                                                          .back(context);
                                                      // Provider.of<ProviderS>(
                                                      //             context,
                                                      //             listen: false)
                                                      //         .selectedWidet =
                                                      //     CompleteOrder();
                                                      setState(() {
                                                        key = '9';
                                                      });
                                                    }, '9', key),
                                                  ])
                                                : titleIndex == 5
                                                    ? Column(children: [
                                                        tileButton('Rate Card',
                                                            () {
                                                          BackDrawer()
                                                              .back(context);
                                                          // Provider.of<ProviderS>(
                                                          //             context,
                                                          //             listen: false)
                                                          //         .selectedWidet =
                                                          //     DeliveryRates();

                                                          setState(() {
                                                            key = '10';
                                                          });
                                                        }, '10', key),
                                                      ])
                                                    : titleIndex == 6
                                                        ? Column(children: [
                                                            tileButton(
                                                                'Create issues',
                                                                () {
                                                              BackDrawer().back(
                                                                  context);
                                                              // Provider.of<ProviderS>(
                                                              //             context,
                                                              //             listen:
                                                              //                 false)
                                                              //         .selectedWidet =
                                                              //     CreateIssues();
                                                              setState(() {
                                                                key = '11';
                                                              });
                                                            }, '11', key),
                                                            tileButton(
                                                                'All Issues',
                                                                () {
                                                              BackDrawer().back(
                                                                  context);
                                                              // Provider.of<ProviderS>(
                                                              //             context,
                                                              //             listen:
                                                              //                 false)
                                                              //         .selectedWidet =
                                                              //     AllIssues();
                                                              setState(() {
                                                                key = '12';
                                                              });
                                                            }, '12', key),
                                                            tileButton(
                                                                'Resolved Issues',
                                                                () {
                                                              BackDrawer().back(
                                                                  context);
                                                              // Provider.of<ProviderS>(
                                                              //             context,
                                                              //             listen:
                                                              //                 false)
                                                              //         .selectedWidet =
                                                              //     ResolvedIssues();
                                                              setState(() {
                                                                key = '13';
                                                              });
                                                            }, '13', key),
                                                          ])
                                                        : titleIndex == 7
                                                            ? Column(children: [
                                                                tileButton(
                                                                    'Barcodes',
                                                                    () {
                                                                  BackDrawer()
                                                                      .back(
                                                                          context);
                                                                  // Provider.of<ProviderS>(
                                                                  //         context,
                                                                  //         listen:
                                                                  //             false)
                                                                  //     .selectedWidet = Barcode();
                                                                  setState(() {
                                                                    key = '14';
                                                                  });
                                                                }, '14', key),
                                                                tileButton(
                                                                    'Pickup Requests',
                                                                    () {
                                                                  BackDrawer()
                                                                      .back(
                                                                          context);
                                                                  // Provider.of<ProviderS>(
                                                                  //         context,
                                                                  //         listen:
                                                                  //             false)
                                                                  //     .selectedWidet = PickupRequest();
                                                                  setState(() {
                                                                    key = '15';
                                                                  });
                                                                }, '15', key),
                                                              ])
                                                            : Column(children: [
                                                                tileButton(
                                                                    'HO Contacts',
                                                                    () {
                                                                  BackDrawer()
                                                                      .back(
                                                                          context);
                                                                  Provider.of<ProviderS>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .selectedWidet = HOContact();
                                                                  setState(() {
                                                                    key = '16';
                                                                  });
                                                                }, '16', key),
                                                                tileButton(
                                                                    'Branch Contacts',
                                                                    () {
                                                                  BackDrawer()
                                                                      .back(
                                                                          context);
                                                                  // Provider.of<ProviderS>(
                                                                  //         context,
                                                                  //         listen:
                                                                  //             false)
                                                                  //     .selectedWidet = BranchContact();
                                                                  setState(() {
                                                                    key = '17';
                                                                  });
                                                                }, '17', key),
                                                              ]),
                            color: buttonList[index]['id'] == 0
                                ? white.withOpacity(0.2)
                                : titleIndex == buttonList[index]['id']
                                    ? white.withOpacity(0.2)
                                    : Color.fromARGB(255, 3, 2, 14)
                                        .withOpacity(0.5),
                            icon: buttonList[index]['icon'],
                            text: buttonList[index]['text']);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  tileButton(String text, VoidCallback onTap, String key, String selectIndex) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: onTap,
        child: Card(
          margin: EdgeInsets.all(0),
          key: Key(key),
          color:
              key == selectIndex ? appButtonColorLite : black.withOpacity(0.2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Container(
            width: w,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text,
                      style: TextStyle(
                        color: white,
                        fontSize: 12.sp,
                      )),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: white1,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackDrawer {
  back(BuildContext context) {
    ScreenSize().checkScreenType(context) != 'web'
        ? Navigator.pop(context, true)
        : null;
  }
}
