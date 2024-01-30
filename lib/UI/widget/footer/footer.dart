import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../../../const/color.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Koombiyo Delivery',
              style: TextStyle(
                  fontSize: 12.dp,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 21, 94)),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              '2024 © All Rights Reserved',
              style: TextStyle(
                  fontSize: 12.dp,
                  fontWeight: FontWeight.normal,
                  color: black1),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(3),
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 9, 85, 215),
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.thumb_up_alt,
                        color: white,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Follow',
                        style: TextStyle(
                            fontSize: 12.dp,
                            fontWeight: FontWeight.bold,
                            color: white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(3),
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 9, 85, 215),
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.share,
                        color: white,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Share',
                        style: TextStyle(
                            fontSize: 12.dp,
                            fontWeight: FontWeight.bold,
                            color: white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
      ]),
    );
  }
}
