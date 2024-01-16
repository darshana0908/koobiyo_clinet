import 'package:client_app/const/const.dart';
import 'package:flutter/material.dart';
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
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: ScreenSize().checkScreenType(context) == 'mobile'
              ? mobile()
              : ScreenSize().checkScreenType(context) == 'tab'
                  ? web()
                  : tab()),
    );
  }

  mobile() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: 85,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [DashboardCard(), DashboardCard()],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [DashboardCard(), DashboardCard()],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [DashboardCard(), DashboardCard()],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [DashboardCard(), DashboardCard()],
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Card(
                elevation: 20,
                child: SizedBox(height: h / 3, child: CustomChart())),
            Card(
                elevation: 20,
                child: SizedBox(height: h / 3, child: CustomChart())),
            Card(
                elevation: 20,
                child: SizedBox(height: h / 3, child: CustomChart())),
          ],
        )
      ],
    );
  }

  web() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DashboardCard(),
            DashboardCard(),
            DashboardCard(),
            DashboardCard()
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DashboardCard(),
            DashboardCard(),
            DashboardCard(),
            DashboardCard()
          ],
        ),
        Row(
          children: [
            Flexible(
              child: Card(
                  elevation: 20,
                  child: SizedBox(height: h / 2.5, child: CustomChart())),
            ),
            Flexible(
              child: Card(
                  elevation: 20,
                  child: SizedBox(height: h / 2.5, child: CustomChart())),
            ),
            Flexible(
              child: Card(
                  elevation: 20,
                  child: SizedBox(height: h / 2.5, child: CustomChart())),
            ),
          ],
        )
      ],
    );
  }

  tab() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DashboardCard(),
            DashboardCard(),
            DashboardCard(),
            DashboardCard()
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DashboardCard(),
            DashboardCard(),
            DashboardCard(),
            DashboardCard()
          ],
        ),
        Row(
          children: [
            Flexible(
              child: Card(
                  elevation: 20,
                  child: SizedBox(height: h / 2.5, child: CustomChart())),
            ),
            Flexible(
              child: Card(
                  elevation: 20,
                  child: SizedBox(height: h / 2.5, child: CustomChart())),
            ),
            Flexible(
              child: Card(
                  elevation: 20,
                  child: SizedBox(height: h / 2.5, child: CustomChart())),
            ),
          ],
        )
      ],
    );
  }
}
