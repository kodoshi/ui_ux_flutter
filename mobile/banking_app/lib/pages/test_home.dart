import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:banking_app/utils/const.dart';
import 'package:banking_app/pages/my_cards.dart';
import 'package:banking_app/pages/amount_page.dart';
import 'package:banking_app/pages/exchange.dart';
import 'package:banking_app/pages/transfer.dart';
import 'package:banking_app/pages/settings.dart';
import 'package:banking_app/widgets/top_bar/home_top_bar.dart';
import 'package:banking_app/widgets/footer/footer_main.dart';
import 'package:banking_app/widgets/icon/pill_icon_widget.dart';
import 'package:banking_app/widgets/footer/footer_min.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeTopBar(
          //textBar: getText("homeText"),
          //redirect: ProfilePage(),
          ),
      backgroundColor: getTheme('backgroundColor'),
      body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: getTheme('backgroundColor'),
          ),
          child: SafeArea(
              child: ListView(
            padding:
                EdgeInsets.all(MediaQuery.of(context).size.width * (5 / 100)),
            children: [
              Stack(children: <Widget>[
                Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        getText('totalBalanceText'),
                        style: TextStyle(
                          fontSize: 20,
                          color: getTheme('grayTextColor'),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '€ 23,970',
                            style: TextStyle(
                                fontSize: 24,
                                color: getTheme('secondaryTextColor'),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '.30',
                            style: TextStyle(
                              fontSize: 24,
                              color: getTheme('secondaryTextColor'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 36),
                      Text(
                        getText('thisMonthText'),
                        style: TextStyle(
                          fontSize: 20,
                          color: getTheme('grayTextColor'),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              height: 20,
                              image:
                                  Image.memory(base64Decode(upVector)).image),
                          Text(
                            ' € 5,563',
                            style: TextStyle(
                                fontSize: 24,
                                color: getTheme('secondaryTextColor'),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '.25',
                            style: TextStyle(
                              fontSize: 24,
                              color: getTheme('secondaryTextColor'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              height: 20,
                              image:
                                  Image.memory(base64Decode(downVector)).image),
                          Text(
                            ' € 3,619',
                            style: TextStyle(
                                fontSize: 24,
                                color: getTheme('secondaryTextColor'),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '.85',
                            style: TextStyle(
                              fontSize: 24,
                              color: getTheme('secondaryTextColor'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 76),
                    ],
                  ),
                ),
              ]),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TransferPage())); //to transfers
                        },
                        child: Column(
                          children: [
                            PillIconWidget(
                              width: 110,
                              height: 40,
                              color: getTheme('tileColor'),
                              backgroundColor: getTheme('secondaryTextColor'),
                              icon: Icons
                                  .swap_horiz, //sync_alt_rounded,//wifi_protected_setup_outlined,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              getText('transferText'),
                              style: TextStyle(
                                fontSize: 20,
                                color: getTheme('grayTextColor'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CardsPage())); //to history page
                        },
                        child: Column(
                          children: [
                            PillIconWidget(
                              width: 110,
                              height: 40,
                              color: getTheme('tileColor'),
                              backgroundColor: getTheme('secondaryTextColor'),
                              icon: Icons.account_balance_wallet_outlined,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              getText('paymentsText'),
                              style: TextStyle(
                                fontSize: 20,
                                color: getTheme('grayTextColor'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      TransferPage())); //to contacts
                        },
                        child: Column(
                          children: [
                            PillIconWidget(
                              width: 110,
                              height: 40,
                              color: getTheme('tileColor'),
                              backgroundColor: getTheme('secondaryTextColor'),
                              icon: Icons.recent_actors_outlined,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              getText('contactsText'),
                              style: TextStyle(
                                fontSize: 20,
                                color: getTheme('grayTextColor'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CardsPage())); //to crypto wallet
                        },
                        child: Column(
                          children: [
                            PillIconWidget(
                              width: 110,
                              height: 40,
                              color: getTheme('tileColor'),
                              backgroundColor: getTheme('secondaryTextColor'),
                              icon: Icons.request_quote_outlined,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              getText('cryptoText'),
                              style: TextStyle(
                                fontSize: 20,
                                color: getTheme('grayTextColor'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SettingsPage())); //to payment preferences
                        },
                        child: Column(
                          children: [
                            PillIconWidget(
                              width: 110,
                              height: 40,
                              color: getTheme('tileColor'),
                              backgroundColor: getTheme('secondaryTextColor'),
                              icon: Icons.settings_applications_sharp,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              getText('preferencesText'),
                              style: TextStyle(
                                fontSize: 20,
                                color: getTheme('grayTextColor'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ExchangePage())); //to exchange
                        },
                        child: Column(
                          children: [
                            PillIconWidget(
                              width: 110,
                              height: 40,
                              color: getTheme('tileColor'),
                              backgroundColor: getTheme('secondaryTextColor'),
                              icon: Icons.euro_symbol_outlined,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              getText('exchangeText'),
                              style: TextStyle(
                                fontSize: 20,
                                color: getTheme('grayTextColor'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ))),
      bottomNavigationBar: new Footer(page: "home"),
    );
  }
}
