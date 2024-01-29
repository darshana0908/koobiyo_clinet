import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:client_app/UI/widget/dashbord/dashbord_card.dart';
import 'package:client_app/const/color.dart';
import 'package:client_app/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../../class/dialog.dart';

class ReceiverDashBoard extends StatefulWidget {
  const ReceiverDashBoard({super.key});

  @override
  State<ReceiverDashBoard> createState() => _ReceiverDashBoardState();
}

class _ReceiverDashBoardState extends State<ReceiverDashBoard> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> images = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => CustomDialog().poster(context));
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: backgroundColor2,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: h / 1.8,
                child: CarouselSlider.builder(
                  itemBuilder: (context, index, realIndex) {
                    return AnimationConfiguration.synchronized(
                        child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          child: Image.network(images[index],
                              height: h / 3, fit: BoxFit.cover, width: w / 2),
                        ),
                      ),
                    ));
                  },
                  itemCount: images.length,
                  // carouselController: _controller,
                  options: CarouselOptions(
                      // padEnds: true,
                      aspectRatio: 5.0,
                      autoPlay: true,
                      disableCenter: true,
                      viewportFraction: 0.7,
                      enlargeFactor: 0.4,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20,
              ),
              ScreenSize().checkScreenType(context) == 'mobile'
                  ? mobile()
                  : ScreenSize().checkScreenType(context) == 'web'
                      ? web()
                      : tab(),
            ],
          ),
        ));
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
                Flexible(
                  child: DashboardCard(
                      color: Colors.brown,
                      icon: Icons.pix_rounded,
                      text: 'Processing',
                      text2: '100'),
                ),
                Flexible(
                  child: DashboardCard(
                      text: 'Collected',
                      text2: '20',
                      color: Color.fromARGB(255, 184, 179, 88),
                      icon: Icons.card_travel),
                )
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
          ],
        ),
      ),
    );
  }
}
