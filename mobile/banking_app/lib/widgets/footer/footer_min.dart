import 'package:flutter/material.dart';

import 'package:banking_app/utils/const.dart';
import 'package:banking_app/pages/test_home.dart';
import 'package:banking_app/pages/my_cards.dart';
import 'package:banking_app/pages/amount_page.dart';
import 'package:banking_app/pages/exchange.dart';
import 'package:banking_app/pages/transfer.dart';
import 'package:banking_app/pages/settings.dart';

class Footer extends StatelessWidget {
  final String? page;

  final indexArray = ["home", "cards", "transfer", "settings", "exchange", "amount"];
  final redirectArray = [HomePage(),  CardsPage(),TransferPage(), SettingsPage(), ExchangePage(), AmountPage()];
  Footer({this.page});

  @override
  Widget build(BuildContext context) {
    void handleRedirectFooter(int index) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => redirectArray[index]),
      );
    }

    return BottomNavigationBar(
      selectedItemColor: getTheme('accentColor'),
      unselectedItemColor: getTheme('secondaryTextColor'),
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), label: getText("homeText")),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card_outlined),
          label: getText("myCardsText"),
        ),
      ],
      currentIndex: indexArray.indexOf(page!),
      onTap: handleRedirectFooter,
    );
  }
}