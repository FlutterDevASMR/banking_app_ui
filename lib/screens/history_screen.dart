import 'dart:math';

import 'package:banking_app_ui/utils/constants.dart';
import 'package:banking_app_ui/widgets/transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key, required this.controller});

  ScrollController controller;

  @override
  Widget build(BuildContext context) {
    String history = '25 Nov';

    List<String> transactions = [
      'Shopping',
      'Sami Ahmed',
      'Taxi',
      'Food',
      'David William',
      'Trading',
      'Insurance',
      'Salary',
      'Investing',
      'Hotel',
      'Uber',
      'New Smarthphone'
    ];

    List<IconData> transactionsIcons = [
      Icons.shopping_cart,
      Icons.person,
      Icons.local_taxi,
      Icons.restaurant,
      Icons.person,
      Icons.currency_exchange,
      Icons.minor_crash,
      Icons.money,
      Icons.sell,
      Icons.hotel,
      Icons.car_rental,
      Icons.smartphone,
    ];

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      child: Scaffold(
        backgroundColor: Constants.whiteColor,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Constants.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  )),
              margin: EdgeInsets.only(top: 150),
            ),
            CustomScrollView(
              controller: controller,
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          width: 30,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              'History',
                              style: GoogleFonts.josefinSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Constants.titleColor,
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.keyboard_arrow_up,
                                color: Colors.white,
                                size: 18,
                              ),
                              decoration: BoxDecoration(
                                color: Constants.titleColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.all(5),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(height: 20),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: CreditCardWidget(
                            cardNumber: '1234567890000000',
                            expiryDate: '12/24',
                            cardHolderName: 'Adom Shafi',
                            cvvCode: '0000',
                            showBackView: false,
                            onCreditCardWidgetChange: (p0) {},
                            height: 230,
                            cardBgColor: Color(0xff8b9ffe),
                            padding: 0,
                            cardType: CardType.mastercard,
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Text(
                              'Transactions',
                              style: GoogleFonts.josefinSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Constants.titleColor,
                              ),
                            ),
                            Text(
                              history,
                              style: GoogleFonts.josefinSans(
                                color: Constants.titleColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => TransactionWidget(
                        itemColor:
                            Color((Random().nextDouble() * 0xffffff).toInt())
                                .withOpacity(1),
                        itemIcon: transactionsIcons[index],
                        title: transactions[index],
                        hour: 1 + Random().nextInt(12),
                        minute: 1 + Random().nextInt(60),
                        price: Random().nextBool()
                            ? -1
                            : 1 * Random().nextDouble() * 200,
                      ),
                      childCount: transactions.length,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
