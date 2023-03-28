import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class TaskWidget extends StatelessWidget {
  TaskWidget({
    super.key,
    required this.taskIconColor,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  Color taskIconColor;
  IconData icon;
  String title;
  String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.whiteColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 23),
            spreadRadius: -17,
            blurRadius: 50,
            color: Colors.blueGrey,
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: ShapeDecoration(
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          color: taskIconColor,
                          shadows: [
                            BoxShadow(
                              color: taskIconColor,
                              offset: Offset(0, 10),
                              blurRadius: 7,
                              spreadRadius: -4,
                            ),
                          ]),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 18,
                      ),
                      padding: EdgeInsets.all(7),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.bold,
                            color: Constants.titleColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Constants.shadowColor,
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: [
                    Constants.whiteColor,
                    Constants.shadowColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              margin: EdgeInsets.only(bottom: 5, left: 5, right: 5),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20 - 5),
                    child: Text(
                      subTitle,
                      style: GoogleFonts.josefinSans(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
