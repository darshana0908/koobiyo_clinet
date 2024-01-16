import 'package:client_app/UI/SenderUI/drawer/drawer.dart';
import 'package:flutter/material.dart';

import '../../const/const.dart';
import 'drawer/dashbord/dashbord.dart';

class SenderHome extends StatelessWidget {
  const SenderHome({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: ScreenSize().checkScreenType(context) == 'web'
          ? null
          : AppBar(
              automaticallyImplyLeading:
                  ScreenSize().checkScreenType(context) == 'tab' ? false : true,
            ),
      drawer: ScreenSize().checkScreenType(context) == 'mobile'
          ? customDrawer()
          : null,
      endDrawer: ScreenSize().checkScreenType(context) == 'tab'
          ? customDrawer()
          : null,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
              width: w,
              child: ScreenSize().checkScreenType(context) == 'web'
                  ? Row(
                      children: [
                        ScreenSize().checkScreenType(context) == 'web'
                            ? Flexible(
                                child: Container(
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(blurRadius: 200)
                                    ]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CustomDrawerWidget(),
                                    )))
                            : SizedBox(),
                        SizedBox(
                            width: w - w / 5, height: h, child: DashBoard())
                      ],
                    )
                  : SizedBox()),
          ScreenSize().checkScreenType(context) == 'mobile'
              ? SizedBox(width: w, height: h, child: DashBoard())
              : SizedBox()
        ]),
      ),
    );
  }
}
