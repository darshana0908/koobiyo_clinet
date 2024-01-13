import 'package:flutter/material.dart';

class ScreenSize {
  checkScreenType(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    if (screenSize.width < 600) {
      return 'mobile';
    } else if (screenSize.width >= 600 && screenSize.width < 1200) {
      return 'tab';
    } else {
      return 'web';
    }
  }
}
