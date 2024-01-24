import 'package:client_app/UI/login_and_otp/login.dart';
import 'package:client_app/const/const.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 3000)).then((value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        )));

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                  height: h / 5, child: Image.asset('assets/icons.PNG'))),
        ]),
      ),
    );
  }
}
