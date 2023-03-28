import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
import '../utils/constants.dart';

class TransactionWidget extends StatelessWidget {
  TransactionWidget({
    super.key,
    required this.itemColor,
    required this.itemIcon,
    required this.title,
    required this.hour,
    required this.minute,
    required this.price,
  });

  Color itemColor;
  IconData itemIcon;
  String title;
  int hour;
  int minute;
  double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          badges.Badge(
            badgeContent: Icon(
              price < 0 ? Icons.arrow_downward : Icons.arrow_upward,
              color: Colors.white,
              size: 10,
            ),
            child: Container(
              decoration: ShapeDecoration(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  color: itemColor,
                  shadows: [
                    BoxShadow(
                      color: itemColor,
                      offset: Offset(0, 10),
                      blurRadius: 7,
                      spreadRadius: -4,
                    ),
                  ]),
              child: Icon(
                itemIcon,
                color: Colors.white,
                size: 23,
              ),
              padding: EdgeInsets.all(12),
            ),
            badgeStyle: badges.BadgeStyle(
              badgeColor: price < 0 ? Colors.red : Colors.green,
            ),
          ),
          SizedBox(width: 10),
          Column(
            children: [
              Text(
                title,
                style: GoogleFonts.josefinSans(
                  fontWeight: FontWeight.bold,
                  color: Constants.titleColor,
                ),
              ),
              SizedBox(height: 7),
              Text(
                minute < 10 ? '$hour:0$minute' : '$hour:$minute',
                style: GoogleFonts.josefinSans(
                  color: Colors.grey,
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          Spacer(),
          Text(
            price < 0
                ? '-\$' + (-price).toStringAsFixed(2)
                : '+\$' + price.toStringAsFixed(2),
            style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.w700,
              fontSize: 17,
              color: price < 0 ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Constants.whiteColor,
            Constants.shadowColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.85],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 23),
            spreadRadius: -17,
            blurRadius: 50,
            color: Colors.blueGrey,
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 10),
    );
  }
}
