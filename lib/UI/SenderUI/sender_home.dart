import 'package:client_app/UI/SenderUI/drawer/drawer.dart';
import 'package:client_app/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';

import '../../const/color.dart';
import '../../const/const.dart';
import 'drawer/dashbord/dashbord.dart';

class SenderHome extends StatelessWidget {
  SenderHome({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Consumer<ProviderS>(
      builder: (context, provider, child) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: brown,
        appBar: ScreenSize().checkScreenType(context) == 'web'
            ? null
            : AppBar(
                iconTheme: IconThemeData(color: white2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                backgroundColor: Color.fromARGB(255, 52, 2, 67),
                actions: appBarButton,
                bottom: PreferredSize(
                    preferredSize: Size(w, h / 15),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: SizedBox(
                          width: ScreenSize().checkScreenType(context) == 'tab'
                              ? w / 2
                              : w,
                          child: serchBarr(context)),
                    )),
              ),
        drawer: ScreenSize().checkScreenType(context) == 'web'
            ? null
            : customDrawer(),
        body: SizedBox(
            width: w,
            child: ScreenSize().checkScreenType(context) == 'web'
                ? Row(
                    children: [
                      Flexible(
                        child: CustomDrawerWidget(),
                      ),
                      SingleChildScrollView(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: SingleChildScrollView(
                                child: Container(
                                    width: w - w / 5,
                                    height: h,
                                    child: provider.selectedWidet),
                              ),
                            ),
                            Container(
                              height: 50,
                              color: Color.fromARGB(255, 52, 2, 67),
                              width: w - w / 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                      width: w / 5, child: serchBarr(context)),
                                  Row(
                                    children: appBarButton,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                : SizedBox(height: h, child: provider.selectedWidet)),
      ),
    );
  }

  List<Widget> appBarButton = [
    IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.grid_view_outlined,
          color: white2,
          size: 20,
        )),
    IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.directions_subway_filled_rounded,
          color: white2,
          size: 20,
        )),
    IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.view_list_sharp,
          color: white2,
          size: 20,
        )),
    IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.notification_important_sharp,
          color: white2,
          size: 20,
        )),
  ];

  Widget serchBarr(BuildContext con) {
    var h = MediaQuery.of(con).size.height;
    var w = MediaQuery.of(con).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: h / 15,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                onChanged: (value) {},
                // controller: search,
                style: TextStyle(color: black, fontSize: 13.dp),
                validator: (value) {},
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        // color: pink.withOpacity(0.1),
                        ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(fontSize: 13.dp),
                  hintText: 'Search',
                  fillColor: white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
