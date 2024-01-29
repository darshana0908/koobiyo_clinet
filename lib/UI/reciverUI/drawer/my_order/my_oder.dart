import 'package:client_app/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../../const/const.dart';

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
                style: TextStyle(fontSize: 12.dp),
              ),
              Text(
                'To Ship',
                style: TextStyle(fontSize: 12.dp),
              ),
              Text(
                'To Receive',
                style: TextStyle(fontSize: 12.dp),
              ),
            ],
          ),
          title: Text(
            'View Orders',
            style: TextStyle(
                fontSize: 18.dp, fontWeight: FontWeight.bold, color: black1),
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                controller: _controller,
                child: Card(
                  elevation: 20,
                  color: backgroundColor2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
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
                                width: w / 5,
                                height: h / 15,
                                child: customDropDown('ddd', true)),
                          ],
                        ),
                        SizedBox(
                            height: h,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(bottom: 120),
                              itemCount: 20,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  color: backgroundColor2,
                                  elevation: 20,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Card(
                                                color: backgroundColor2,
                                                elevation: 15,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.asset(
                                                    'assets/app_w.jpg',
                                                    width: w / 20,
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: w / 6,
                                                child: Text(
                                                  'P47 Wireless Bluetooth Headset Foldable Hifi Stereo Noise Cancelling Bass Gaming Earphones with Mic Support TF Card',
                                                  style: TextStyle(
                                                      fontSize: 12.dp,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: black1),
                                                ),
                                              ),
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
                                              Card(
                                                elevation: 20,
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 4),
                                                  child: Text(
                                                    'Delivered',
                                                    style: TextStyle(
                                                        fontSize: 12.dp,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: black1),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                child: Text(
                                                  'Delivered on 17 Feb 2023',
                                                  style: TextStyle(
                                                      fontSize: 12.dp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: black1),
                                                ),
                                              )
                                            ],
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
          ],
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
