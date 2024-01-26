import 'package:client_app/const/color.dart';
import 'package:client_app/const/const.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class CustomDialog {
  info(BuildContext context, String title, String desk, VoidCallback onTap) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    AwesomeDialog(
      width: ScreenSize().checkScreenType(context) == 'web' ? w / 3 : w,
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.rightSlide,
      title: title,
      desc: desk,
      btnCancelOnPress: () {
        // Navigator.pop(context, true);
      },
      btnOkOnPress: onTap,
    )..show();
  }

  poster(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        scrollable: true,
        actionsAlignment: MainAxisAlignment.end,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(15),
            child: Card(
              elevation: 20,
              color: appButtonColorLite,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Text(
                  'CLOSE',
                  style: TextStyle(
                      color: white,
                      fontSize: 14.dp,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        insetPadding: EdgeInsets.all(8),
        contentPadding: EdgeInsets.all(0),
        backgroundColor: backgroundColor2,
        content: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  'assets/poster.jpg',
                  width: ScreenSize().checkScreenType(context) == 'web'
                      ? w / 2
                      : w,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
