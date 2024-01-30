import 'package:client_app/UI/SenderUI/drawer/drawer.dart';
import 'package:client_app/UI/SenderUI/drawer/notification/notification.dart';
import 'package:client_app/UI/reciverUI/drawer/dashbord/receiver_drawer.dart';
import 'package:client_app/class/dialog.dart';
import 'package:client_app/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:provider/provider.dart';
import '../../const/color.dart';
import '../../const/const.dart';

class ReceiverUI extends StatelessWidget {
  ReceiverUI({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Consumer<ProviderS>(
      builder: (context, provider, child) => Scaffold(
        backgroundColor: brown,
        appBar: ScreenSize().checkScreenType(context) == 'web'
            ? null
            : AppBar(
                actionsIconTheme: IconThemeData(
                    size: ScreenSize().checkScreenType(context) == 'small'
                        ? 10
                        : 20),
                iconTheme: IconThemeData(
                    color: white2,
                    size: ScreenSize().checkScreenType(context) == 'small'
                        ? 10
                        : 20),
                backgroundColor: Color.fromARGB(255, 6, 61, 145),
                actions: appBarButtonn(context),
              ),
        drawer: ScreenSize().checkScreenType(context) == 'web'
            ? null
            : ReceiverCustomDrawer(),
        body: SizedBox(
            width: w,
            child: ScreenSize().checkScreenType(context) == 'web'
                ? Row(
                    children: [
                      Flexible(
                        child: ReceiverCustomDrawer(),
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
                                    child: provider.receiverSelectWidget),
                              ),
                            ),
                            Container(
                              height: 50,
                              color: appBarColor,
                              width: w - w / 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                      width: w / 5, child: serchBarr(context)),
                                  Row(
                                    children: appBarButtonn(context),
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
                : SizedBox(height: h, child: provider.receiverSelectWidget)),
      ),
    );
  }

  appBarButtonn(BuildContext context) {
    List<Widget> appBarButton = [
      IconButton(
          autofocus: true,
          padding: ScreenSize().checkScreenType(context) == 'small'
              ? EdgeInsets.all(2)
              : null,
          onPressed: () {
            Provider.of<ProviderS>(context, listen: false).selectedWidet =
                NotificationScreen();
          },
          icon: FittedBox(
            child: Icon(
              size:
                  ScreenSize().checkScreenType(context) == 'small' ? 10 : 20.dp,
              Icons.notification_important_sharp,
              color: white2,
            ),
          )),
      IconButton(
          autofocus: true,
          padding: ScreenSize().checkScreenType(context) == 'small'
              ? EdgeInsets.all(2)
              : null,
          onPressed: () {
            // Provider.of<ProviderS>(context, listen: false).selectedWidet =
            //     OTP();
          },
          icon: FittedBox(
            child: Icon(
              size:
                  ScreenSize().checkScreenType(context) == 'small' ? 10 : 20.dp,
              Icons.person,
              color: white2,
            ),
          )),
    ];
    return appBarButton;
  }

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
