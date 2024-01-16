import 'dart:developer';

import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
List imglist = [
  'assets/j1.jpg',
  'assets/j2.jpg',
  'assets/j3.jpg',
  'assets/j4.jpg',
  'assets/j.jpg',
];

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  bool iconSize1 = false;
  bool iconSize2 = false;
  bool iconSize3 = false;
  AnimationController? _controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List iconList = [Icons.abc, Icons.abc, Icons.abc];
  static List<Widget> _pages = <Widget>[
    Icon(Icons.abc_outlined),
    Icon(Icons.abc_outlined),
    Icon(Icons.abc_outlined)
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      log(_selectedIndex.toString());
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  back() {
    showAlertDialog(BuildContext context) {
      // set up the button
      Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () {},
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("My title"),
        content: Text("This is my message."),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false, // prevent back
        onPopInvoked: (pop) async {
          print('sdfddddddddddddddd');
          // This can be async and you can check your condition
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          key: _scaffoldKey,
          // drawer: customDrawer(),
          extendBody: true,
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.call),
                label: 'Calls',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                label: 'Camera',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chats',
              ),
            ],
          ),

          body: Center(
            child: _pages.elementAt(_selectedIndex), //New
          ),
        ));
  }
}
