import 'package:client_app/const/color.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../../const/const.dart';
import '../../../widget/footer/footer.dart';

class MyOder extends StatefulWidget {
  const MyOder({super.key});

  @override
  State<MyOder> createState() => _MyOderState();
}

class _MyOderState extends State<MyOder> {
  List<String> listitems = [
    "Last 5 orders",
    "Last 15 orders",
    "Last 30 orders",
    "All Orders"
  ];
  String selectval = "Last 5 orders";
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: backgroundColor2,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            tabs: [
              Text(
                'All',
                style: TextStyle(
                    fontSize: 15.dp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto'),
              ),
              Text(
                'To Ship',
                style: TextStyle(
                    fontSize: 15.dp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto'),
              ),
              Text(
                'To Receive',
                style: TextStyle(
                    fontSize: 15.dp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto'),
              ),
            ],
          ),
          title: Text(
            'My Orders',
            style: TextStyle(
                fontSize: 18.dp, fontWeight: FontWeight.bold, color: black1),
          ),
        ),
        body: TabBarView(
          children: [
            allOders('Delivered', 'Placed on',
                Color.fromARGB(255, 67, 191, 131), false),
            allOders('Processing', 'Get by ', appButtonColorLite, false),
            allOders('Processing', 'Get by ', appButtonColorLite, true),
          ],
        ),
      ),
    );
  }

  Widget allOders(String status, String time, Color color, bool toReceive) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      controller: _controller,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Show :',
                    style: TextStyle(
                        fontSize: 14.dp,
                        fontWeight: FontWeight.bold,
                        color: black1),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  SizedBox(
                      width: ScreenSize().checkScreenType(context) == 'web'
                          ? w / 5
                          : w / 2,
                      height: h / 16,
                      child: customDropDown('ddd', true)),
                ],
              ),
              SizedBox(
                  child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(bottom: 120),
                itemCount: 20,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: backgroundColor2,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Order ',
                                      style: TextStyle(
                                          fontSize: 12.dp,
                                          fontWeight: FontWeight.bold,
                                          color: black2),
                                    ),
                                    Text(
                                      '#210086691242855',
                                      style: TextStyle(
                                          fontSize: 12.dp,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromARGB(255, 3, 164, 118)),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'MANAGE',
                                    style: TextStyle(
                                        fontSize: 12.dp,
                                        fontWeight: FontWeight.normal,
                                        color: Color.fromARGB(255, 2, 38, 166)),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '$time 14 Feb 2023 12:07:10',
                              style: TextStyle(
                                  fontSize: 11.dp,
                                  fontWeight: FontWeight.normal,
                                  color: black2),
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Card(
                                  color: backgroundColor2,
                                  elevation: 50,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/app_w.jpg',
                                      width: ScreenSize()
                                                  .checkScreenType(context) ==
                                              'web'
                                          ? w / 18
                                          : w / 7,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: ScreenSize()
                                                  .checkScreenType(context) ==
                                              'web'
                                          ? w / 6
                                          : w / 2,
                                      child: Text(
                                        'P47 Wireless Bluetooth Headset Foldable Hifi Stereo Noise Cancelling Bass Gaming Earphones with Mic Support TF Card',
                                        style: TextStyle(
                                            fontSize: 12.dp,
                                            fontWeight: FontWeight.normal,
                                            color: black1),
                                      ),
                                    ),
                                    ScreenSize().checkScreenType(context) !=
                                            'web'
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: w / 10,
                                                child: Text(
                                                  'Qty: 1',
                                                  style: TextStyle(
                                                      fontSize: 12.dp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: black1),
                                                ),
                                              ),
                                              time == 'Placed on'
                                                  ? Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        'Delivered on 17 Feb 2023',
                                                        style: TextStyle(
                                                            fontSize: 12.dp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: black1),
                                                      ),
                                                    )
                                                  : SizedBox(),
                                              Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Card(
                                                  elevation: 20,
                                                  color: color,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                            vertical: 4),
                                                    child: Text(
                                                      status,
                                                      style: TextStyle(
                                                          fontSize: 12.dp,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox()
                                  ],
                                ),
                                ScreenSize().checkScreenType(context) == 'web'
                                    ? SizedBox(
                                        width: w / 3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: w / 10,
                                              child: Text(
                                                'Qty: 1',
                                                style: TextStyle(
                                                    fontSize: 12.dp,
                                                    fontWeight: FontWeight.bold,
                                                    color: black1),
                                              ),
                                            ),
                                            toReceive
                                                ? Column(
                                                    children: [
                                                      Container(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Card(
                                                          elevation: 2,
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        12,
                                                                    vertical:
                                                                        4),
                                                            child: Text(
                                                              'On the way',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12.dp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color:
                                                                      black2),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(Icons
                                                              .warehouse_outlined),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Container(
                                                            height: 3,
                                                            width: w / 14,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    3,
                                                                    94,
                                                                    38),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            child: Icon(
                                                              Icons
                                                                  .local_shipping,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: w / 14,
                                                            child: DottedLine(
                                                              direction: Axis
                                                                  .horizontal,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .center,
                                                              lineLength: double
                                                                  .infinity,
                                                              lineThickness:
                                                                  1.0,
                                                              dashLength: 15.0,
                                                              dashColor:
                                                                  Colors.black,
                                                              dashRadius: 0.0,
                                                              dashGapLength:
                                                                  4.0,
                                                              dashGapColor: Colors
                                                                  .transparent,
                                                              dashGapRadius:
                                                                  0.0,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.pin_drop,
                                                            color: Colors.red,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                : Card(
                                                    elevation: 20,
                                                    color: color,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 12,
                                                              vertical: 4),
                                                      child: Text(
                                                        status,
                                                        style: TextStyle(
                                                            fontSize: 12.dp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color: white),
                                                      ),
                                                    ),
                                                  ),
                                            time == 'Placed on'
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'Delivered on 17 Feb 2023',
                                                      style: TextStyle(
                                                          fontSize: 12.dp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: black1),
                                                    ),
                                                  )
                                                : SizedBox()
                                          ],
                                        ),
                                      )
                                    : SizedBox()
                              ],
                            ),
                          ]),
                    ),
                  ),
                ),
              )),
              Footer()
            ],
          ),
        ),
      ),
    );
  }

  Widget customDropDown(String text, bool isMobile) {
    var h = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: white, width: 0.5)),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: white,
        ),
        child: DropdownButton(
          autofocus: true,
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
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(
                              ScreenSize().checkScreenType(context) == 'mobile'
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
    );
  }
}
