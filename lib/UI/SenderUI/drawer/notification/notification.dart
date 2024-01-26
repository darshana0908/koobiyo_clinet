import 'package:flutter/material.dart';

import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../../const/color.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Notification',
            style: TextStyle(
              fontSize: 18.dp,
              color: black,
              fontWeight: FontWeight.bold,
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        backgroundColor: white,
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: backgroundColor2,
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Koombiyo Delivery ',
                        style: TextStyle(
                          fontSize: 18.dp,
                          color: black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Koombiyo Delivery ,Koombiyo Delivery  Koombiyo Delivery  Koombiyo Delivery Koombiyo Delivery Koombiyo Delivery Koombiyo Delivery Koombiyo Delivery ',
                      style: TextStyle(
                        fontSize: 12.dp,
                        color: black1,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '2024/02/22',
                        style: TextStyle(
                          fontSize: 12.dp,
                          color: black2,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
