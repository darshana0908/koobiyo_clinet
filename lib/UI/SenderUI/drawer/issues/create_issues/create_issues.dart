import 'package:client_app/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../../../const/const.dart';

class CreateIssues extends StatefulWidget {
  const CreateIssues({super.key});

  @override
  State<CreateIssues> createState() => _CreateIssuesState();
}

class _CreateIssuesState extends State<CreateIssues> {
  bool isCheck = false;
  List<String> listitems = [
    "Tokyo",
    "London",
    "New York",
    "Sanghaicsbzchbhbhabhbdhbc  s bchbscx s scsc s scbsac acnja",
    "Moscow",
    "Hong Kong"
  ];
  String? selectval;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Create Issue',
          style: TextStyle(
              fontSize: 18.dp, fontWeight: FontWeight.bold, color: black1),
        ),
      ),
      // backgroundColor: const Color.fromARGB(255, 207, 212, 215),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: w,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'With this * mark all fields are required',
                              style: TextStyle(
                                  fontSize: 12.dp,
                                  fontWeight: FontWeight.bold,
                                  color: black1),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Do You Have A Tracking ID ?',
                                  style: TextStyle(
                                      fontSize: 12.dp,
                                      fontWeight: FontWeight.bold,
                                      color: black1),
                                ),
                                Checkbox(
                                  value: isCheck,
                                  onChanged: (value) {},
                                ),
                                Text(
                                  'yes',
                                  style: TextStyle(
                                      fontSize: 12.dp,
                                      fontWeight: FontWeight.bold,
                                      color: black1),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'Without Tracking ID',
                              style: TextStyle(
                                  fontSize: 12.dp,
                                  fontWeight: FontWeight.bold,
                                  color: black1),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            customDropDown(Icons.circle_outlined, 'dd', true),
                            SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              height: h / 5,
                              child: TextField(
                                maxLines: null,
                                expands: true,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  filled: true,
                                  hintText: 'Enter a message',
                                  fillColor: Colors.black12,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: black3, width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: black3, width: 0.5)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget customDropDown(IconData icon, String text, bool isMobile) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: white2, width: 0.6)),
      child: DropdownButton(
        dropdownColor: white,
        icon: Icon(
          Icons.arrow_drop_down_outlined,
          color: white2,
        ),
        underline: SizedBox(),
        isExpanded: true,
        padding: EdgeInsets.only(right: 20),
        alignment: AlignmentDirectional.centerEnd,
        hint: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(isMobile ? 12.0 : 8),
              child: Icon(
                icon,
                color: black,
              ),
            ),
            Flexible(
              child: Text(
                text,
                style: TextStyle(color: black),
              ),
            ),
          ],
        ),

        value: selectval,

        //implement initial value or selected value
        onChanged: (value) {
          setState(() {
            //set state will update UI and State of your App
            selectval = value.toString(); //change selectval to new value
          });
        },
        items: listitems.map((itemone) {
          return DropdownMenuItem(
              value: itemone,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      icon,
                      color: black,
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(
                          ScreenSize().checkScreenType(context) == 'mobile'
                              ? 8.0
                              : 8),
                      child: Text(
                        itemone,
                        style: TextStyle(color: black),
                      ),
                    ),
                  ),
                ],
              ));
        }).toList(),
      ),
    );
  }
}
