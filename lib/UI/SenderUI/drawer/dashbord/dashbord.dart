import 'package:client_app/UI/widget/dashbord/chart3.dart';
import 'package:client_app/const/color.dart';
import 'package:client_app/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../widget/dashbord/char.dart';
import '../../../widget/dashbord/dashbord_card.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenSize().checkScreenType(context) == 'mobile'
          ? mobile()
          : ScreenSize().checkScreenType(context) == 'web'
              ? web()
              : tab(),
    );
  }

  mobile() {
    var h = MediaQuery.of(context).size.height;

    return Container(
      color: backgroundColor.withOpacity(0.9),
      height: h,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 135,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashboardCard(
                    color: Colors.brown,
                    icon: Icons.pix_rounded,
                    text: 'Processing',
                    text2: '100'),
                DashboardCard(
                    text: 'Collected',
                    text2: '20',
                    color: Color.fromARGB(255, 184, 179, 88),
                    icon: Icons.card_travel)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashboardCard(
                    text: 'Dispatch to Destination',
                    text2: '100',
                    color: const Color.fromARGB(255, 19, 6, 1),
                    icon: Icons.no_crash_outlined),
                DashboardCard(
                    text: 'Out for Delivery',
                    text2: '20',
                    color: Color.fromARGB(255, 6, 102, 4),
                    icon: Icons.airplanemode_active_sharp)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashboardCard(
                    text: 'Resheduled',
                    text2: '20',
                    color: Color.fromARGB(255, 11, 11, 109),
                    icon: Icons.query_builder),
                DashboardCard(
                    text: 'Return to Client',
                    text2: '20',
                    color: Color.fromARGB(255, 40, 4, 9),
                    icon: Icons.add_circle_rounded)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashboardCard(
                    text: 'Total Orders',
                    text2: '20',
                    color: Color.fromARGB(255, 2, 64, 69),
                    icon: Icons.info),
                DashboardCard(
                    text: 'Total Delivered',
                    text2: '200',
                    color: const Color.fromARGB(255, 157, 50, 11),
                    icon: Icons.check)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Card(color: black, elevation: 20, child: CustomChart()),
            Card(color: black, elevation: 20, child: CustomChart2()),
            Card(color: black, elevation: 20, child: CustomChart2()),
          ],
        ),
      ),
    );
  }

  web() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return AnimationLimiter(
      child: Stack(
        children: [
          Container(
            color: backgroundColor.withOpacity(0.9),
            height: h,
            child: SingleChildScrollView(
              child: AnimationConfiguration.synchronized(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SlideAnimation(
                              horizontalOffset: -200,
                              child: DashboardCard(
                                  color: Colors.brown,
                                  icon: Icons.pix_rounded,
                                  text: 'Processing',
                                  text2: '100')),
                          SlideAnimation(
                              horizontalOffset: 200,
                              child: DashboardCard(
                                  text: 'Collected',
                                  text2: '20',
                                  color: Color.fromARGB(255, 184, 179, 88),
                                  icon: Icons.card_travel)),
                          SlideAnimation(
                            horizontalOffset: -200,
                            child: DashboardCard(
                                text: 'Dispatch to Destination',
                                text2: '100',
                                color: const Color.fromARGB(255, 19, 6, 1),
                                icon: Icons.no_crash_outlined),
                          ),
                          SlideAnimation(
                            horizontalOffset: 200,
                            child: DashboardCard(
                                text: 'Out for Delivery',
                                text2: '20',
                                color: Color.fromARGB(255, 6, 102, 4),
                                icon: Icons.airplanemode_active_sharp),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SlideAnimation(
                              horizontalOffset: 200,
                              child: DashboardCard(
                                  text: 'Resheduled',
                                  text2: '20',
                                  color: Color.fromARGB(255, 11, 11, 109),
                                  icon: Icons.query_builder)),
                          SlideAnimation(
                              horizontalOffset: 200,
                              child: DashboardCard(
                                  text: 'Return to Client',
                                  text2: '20',
                                  color: Color.fromARGB(255, 40, 4, 9),
                                  icon: Icons.add_circle_rounded)),
                          SlideAnimation(
                              horizontalOffset: 200,
                              child: DashboardCard(
                                  text: 'Total Orders',
                                  text2: '20',
                                  color: Color.fromARGB(255, 2, 64, 69),
                                  icon: Icons.info)),
                          SlideAnimation(
                              horizontalOffset: 200,
                              child: DashboardCard(
                                  text: 'Total Delivered',
                                  text2: '200',
                                  color: const Color.fromARGB(255, 157, 50, 11),
                                  icon: Icons.check))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                color: black,
                                elevation: 20,
                                child: SizedBox(
                                    height: h / 2.5, child: CustomChart())),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                color: black,
                                elevation: 20,
                                child: SizedBox(
                                    height: h / 2.5, child: CustomChart2())),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                color: black,
                                elevation: 20,
                                child: SizedBox(
                                    height: h / 2.5, child: CustomChart2())),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  tab() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        color: black.withOpacity(0.2),
        child: Column(
          children: [
            SizedBox(height: 135),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashboardCard(
                    color: Colors.brown,
                    icon: Icons.pix_rounded,
                    text: 'Processing',
                    text2: '100'),
                DashboardCard(
                    text: 'Collected',
                    text2: '20',
                    color: Color.fromARGB(255, 184, 179, 88),
                    icon: Icons.card_travel)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashboardCard(
                    text: 'Dispatch to Destination',
                    text2: '100',
                    color: const Color.fromARGB(255, 19, 6, 1),
                    icon: Icons.no_crash_outlined),
                DashboardCard(
                    text: 'Out for Delivery',
                    text2: '20',
                    color: Color.fromARGB(255, 6, 102, 4),
                    icon: Icons.airplanemode_active_sharp)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashboardCard(
                    text: 'Resheduled',
                    text2: '20',
                    color: Color.fromARGB(255, 11, 11, 109),
                    icon: Icons.query_builder),
                DashboardCard(
                    text: 'Return to Client',
                    text2: '20',
                    color: Color.fromARGB(255, 40, 4, 9),
                    icon: Icons.add_circle_rounded)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashboardCard(
                    text: 'Total Orders',
                    text2: '20',
                    color: Color.fromARGB(255, 2, 64, 69),
                    icon: Icons.info),
                DashboardCard(
                    text: 'Total Delivered',
                    text2: '200',
                    color: const Color.fromARGB(255, 157, 50, 11),
                    icon: Icons.check)
              ],
            ),
            Card(color: black, elevation: 20, child: CustomChart()),
            Card(color: black, elevation: 20, child: CustomChart2()),
            Card(color: black, elevation: 20, child: CustomChart2()),
          ],
        ),
      ),
    );
  }
}
