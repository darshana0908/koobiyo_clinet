import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../const/color.dart';
import '../../../const/const.dart';

class DashboardCard extends StatefulWidget {
  const DashboardCard({super.key});

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Card(
      child: Card(
        elevation: 20,
        margin: EdgeInsets.all(0),
        child: Container(
          alignment: Alignment.center,
          width:
              ScreenSize().checkScreenType(context) == 'web' ? w / 6 : w / 2.5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Card(
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.account_balance_wallet_sharp,
                          size: 45,
                          color: white,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Koobiyo Delivery',
                            style: TextStyle(
                              fontSize: 12.dp,
                              color: black2,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            '100',
                            style: TextStyle(
                              fontSize: 22.dp,
                              color: black2,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 6,
                  width: w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color.fromARGB(255, 46, 5, 2),
                      const Color.fromARGB(255, 4, 52, 92)
                    ]),
                    color: red,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
