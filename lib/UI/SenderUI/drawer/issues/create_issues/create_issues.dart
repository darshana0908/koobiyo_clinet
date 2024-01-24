import 'package:client_app/UI/widget/diloag_button.dart';
import 'package:client_app/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../const/const.dart';
import '../../../../widget/custom_TextField.dart';

class CreateIssues extends StatefulWidget {
  const CreateIssues({super.key});

  @override
  State<CreateIssues> createState() => _CreateIssuesState();
}

class _CreateIssuesState extends State<CreateIssues> {
  TextEditingController trackingId = TextEditingController();
  bool isCheck = false;
  XFile? image;
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: w,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        color: backgroundColor2,
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'With this * mark all fields are required',
                                  style: TextStyle(
                                      fontSize: 12.dp,
                                      fontWeight: FontWeight.normal,
                                      color: black3),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Do You Have A Tracking ID ?',
                                    style: TextStyle(
                                        fontSize: 12.dp,
                                        fontWeight: FontWeight.bold,
                                        color: black2),
                                  ),
                                  Checkbox(
                                    value: isCheck,
                                    onChanged: (value) {
                                      setState(() {
                                        isCheck = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'yes',
                                    style: TextStyle(
                                        fontSize: 12.dp,
                                        fontWeight: FontWeight.bold,
                                        color: black2),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              isCheck
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Tracking ID',
                                          style: TextStyle(
                                              fontSize: 12.dp,
                                              fontWeight: FontWeight.bold,
                                              color: black2),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        SizedBox(
                                          height: h / 13,
                                          width: w / 4,
                                          child: TextField(
                                            keyboardType:
                                                TextInputType.multiline,
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide:
                                                      BorderSide(color: white)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide:
                                                      BorderSide(color: white)),
                                              border: InputBorder.none,
                                              filled: true,
                                              hintText: 'Enter ID',
                                              fillColor: white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox(),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Complain Type',
                                style: TextStyle(
                                    fontSize: 12.dp,
                                    fontWeight: FontWeight.bold,
                                    color: black),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                  width: w / 4,
                                  height: h / 13,
                                  child: customDropDown(
                                      Icons.circle_outlined, 'Select', true)),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Remark',
                                style: TextStyle(
                                    fontSize: 12.dp,
                                    fontWeight: FontWeight.bold,
                                    color: black),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                height: h / 5,
                                child: TextField(
                                  maxLines: 20,
                                  minLines: 10,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    filled: true,
                                    hintText: 'Enter a message',
                                    fillColor: white,
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: white)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: white)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Proof Image',
                                style: TextStyle(
                                    fontSize: 12.dp,
                                    fontWeight: FontWeight.bold,
                                    color: black2),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      final ImagePicker _picker = ImagePicker();
                                      final img = await _picker.pickImage(
                                          source: ImageSource.gallery);
                                      setState(() {
                                        image = img;
                                      });
                                    },
                                    child: Card(
                                      color: Colors.blueAccent,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Browse Image',
                                              style: TextStyle(
                                                  fontSize: 12.dp,
                                                  fontWeight: FontWeight.normal,
                                                  color: white),
                                            ),
                                            SizedBox(width: 8),
                                            Icon(Icons.photo, color: white)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  image == null
                                      ? Text(
                                          'No Image',
                                          style: TextStyle(
                                              fontSize: 12.dp,
                                              fontWeight: FontWeight.normal,
                                              color: black3),
                                        )
                                      : Row(
                                          children: [
                                            Icon(
                                              Icons.image,
                                              color: Colors.black12,
                                            ),
                                            Text(
                                              image!.name,
                                              style: TextStyle(
                                                  fontSize: 12.dp,
                                                  fontWeight: FontWeight.normal,
                                                  color: black3),
                                            ),
                                          ],
                                        )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  DialogButton(
                                      text: 'Reset',
                                      onTap: () {},
                                      buttonHeight: h / 13,
                                      width: ScreenSize()
                                                  .checkScreenType(context) !=
                                              'web'
                                          ? w / 4
                                          : w / 10,
                                      color: Color.fromARGB(255, 168, 57, 24)),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  DialogButton(
                                      text: 'Save',
                                      onTap: () {},
                                      buttonHeight: h / 13,
                                      width: ScreenSize()
                                                  .checkScreenType(context) !=
                                              'web'
                                          ? w / 4
                                          : w / 10,
                                      color: Color.fromARGB(255, 12, 128, 16))
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customDropDown(IconData icon, String text, bool isMobile) {
    return Container(
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: white, width: 0.6)),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: white,
        ),
        child: DropdownButton(
          style: TextStyle(backgroundColor: white),
          dropdownColor: white,
          borderRadius: BorderRadius.circular(10),
          focusColor: white,
          icon: Icon(
            Icons.arrow_drop_down_outlined,
            color: black,
          ),
          underline: SizedBox(),
          isExpanded: true,
          padding: EdgeInsets.only(right: 20),
          alignment: AlignmentDirectional.centerEnd,
          hint: Container(
            padding: EdgeInsets.only(left: 12),
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: TextStyle(
                  color: black3,
                  fontSize: 14.dp,
                  fontWeight: FontWeight.normal),
            ),
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
                child: Container(
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
                  ),
                ));
          }).toList(),
        ),
      ),
    );
  }
}
