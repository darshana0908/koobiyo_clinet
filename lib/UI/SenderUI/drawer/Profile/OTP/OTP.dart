import 'package:client_app/UI/widget/diloag_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../../const/color.dart';
import '../../../../../const/const.dart';
import '../../../../../provider/provider.dart';
import '../profile/profile.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  style() {
    List<TextStyle?> otpTextStyles = [];
    return otpTextStyles = [
      createStyle(accentPurpleColor),
      createStyle(accentYellowColor),
      createStyle(accentDarkGreenColor),
      createStyle(accentOrangeColor),
      createStyle(accentPinkColor),
    ];
  }

  TextStyle? createStyle(Color color) {
    ThemeData theme = Theme.of(context);
    return theme.textTheme.headline3?.copyWith(color: color);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: w,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: ScreenSize().checkScreenType(context) == 'web'
                      ? w / 3
                      : w,
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 40,
                    borderOnForeground: true,
                    surfaceTintColor: appBlue,
                    // color: appBlue,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Text(
                          'Enter OTP',
                          style: TextStyle(
                              fontSize: 27.dp,
                              color: black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter'),
                        ),
                        Text(
                          " Check your sms box get the verification \ncode of your account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12.dp,
                              color: black2,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter'),
                        ),
                        SizedBox(
                            height: h / 4,
                            child: Lottie.asset('assets/enter_otp.json')),
                        Flexible(
                          child: OtpTextField(
                            numberOfFields: 5,
                            borderColor: black,
                            focusedBorderColor: black,
                            disabledBorderColor: black2,
                            fillColor: black,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: black1))),
                            styles: style(),
                            showFieldAsBox: false,
                            enabledBorderColor: black3,

                            borderWidth: 2.0,
                            //runs when a code is typed in
                            onCodeChanged: (String code) {
                              //handle validation or checks here if necessary
                            },
                            //runs when every textfield is filled
                            onSubmit: (String verificationCode) {},
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DialogButton(
                            text: 'VERIFY',
                            onTap: () {
                              Provider.of<ProviderS>(context, listen: false)
                                  .selectedWidet = Profile();
                            },
                            buttonHeight: h / 13,
                            width:
                                ScreenSize().checkScreenType(context) == 'web'
                                    ? w / 4
                                    : w,
                            color: appButtonColorLite),
                        SizedBox(
                          height: 20,
                        )
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
