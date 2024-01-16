import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../const/color.dart';
import '../../../const/const.dart';
import '../../widget/drower/drower_button.dart';

class customDrawer extends StatefulWidget {
  const customDrawer({super.key});

  @override
  State<customDrawer> createState() => _customDrawerState();
}

class _customDrawerState extends State<customDrawer> {
  bool tap = false;
  bool lite = false;
  bool en = false;

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
            child: SingleChildScrollView(child: CustomDrawerWidget())),
      ),
    );
  }
}

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      width: ScreenSize().checkScreenType(context) == 'mobile' ? w : w / 5,
      child: Stack(
        children: [
          SizedBox(
              height: h,
              width: w,
              child: Image.asset(
                'assets/lap.PNG',
                fit: BoxFit.cover,
              )),
          Container(
            height: h,
            width: w,
            color: white.withOpacity(0.8),
          ),
          Column(
            // Important: Remove any padding from the ListView.
            children: [
              SizedBox(
                height: 15,
              ),
              ScreenSize().checkScreenType(context) != 'web'
                  ? Container(
                      alignment: ScreenSize().checkScreenType(context) == 'tab'
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            color: black2,
                          )),
                    )
                  : SizedBox(),
              SizedBox(
                height: h / 30,
              ),
              Text(
                'Koobiyo Delivery',
                style: TextStyle(
                  fontSize: 22.dp,
                  color: black2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomDrawerButton(
                isTap: true,
                onTap: () {},
                icon: Icons.grid_view_rounded,
                myPage: SizedBox(),
                text: 'DashBoard',
              ),
              CustomDrawerButton(
                isTap: true,
                onTap: () {},
                icon: Icons.shopping_cart_checkout_rounded,
                myPage: SizedBox(),
                text: 'All Orders',
              ),
              CustomDrawerButton(
                isTap: true,
                onTap: () {},
                icon: Icons.home_outlined,
                myPage: SizedBox(),
                text: 'Finance',
              ),
              CustomDrawerButton(
                isTap: true,
                onTap: () {},
                icon: Icons.copy,
                myPage: SizedBox(),
                text: 'Reports',
              ),
              CustomDrawerButton(
                isTap: true,
                onTap: () {},
                icon: Icons.money_off,
                myPage: SizedBox(),
                text: 'Delivery Rates',
              ),
              CustomDrawerButton(
                isTap: true,
                onTap: () {},
                icon: Icons.info,
                myPage: SizedBox(),
                text: 'Issues',
              ),
              CustomDrawerButton(
                isTap: true,
                onTap: () {},
                icon: Icons.call,
                myPage: SizedBox(),
                text: 'Requests',
              ),
              CustomDrawerButton(
                isTap: true,
                onTap: () {},
                icon: Icons.contact_phone_rounded,
                myPage: SizedBox(),
                text: 'Contacts',
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
