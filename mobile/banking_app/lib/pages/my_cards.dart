import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:banking_app/utils/const.dart';
import 'package:banking_app/pages/component/card_scroller.dart';
import 'package:banking_app/widgets/icon/pill_icon_widget.dart';
import 'package:banking_app/widgets/icon/icon_widget.dart';
import 'package:banking_app/widgets/footer/footer_min.dart';

class CardsPage extends StatefulWidget {
  CardsPage({Key? key}) : super(key: key);

  @override
  _CardsPage createState() => _CardsPage();
}

class _CardsPage extends State<CardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getTheme('backgroundColor'),
      appBar: AppBar(
        leading: BackButton(
          color: getTheme('secondaryTextColor'),
        ),
        title: Text(
          getText('myCardsText'),
          style: TextStyle(
            color: getTheme('secondaryTextColor'),
          ),
        ),
        centerTitle: true,
        backgroundColor: getTheme('backgroundColor'),
        actions: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 6, 18, 6),
            child: IconWidget(
                color: getTheme('tileColor'),
                backgroundColor: getTheme('secondaryTextColor'),
                icon: Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //width: MediaQuery.of(context).size.width,
              height: 230,
              decoration: BoxDecoration(
                color: getTheme('backgroundColor'),
              ),
              child: CardScroller(),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      PillIconWidget(
                        width: 110,
                        height: 40,
                        color: getTheme('tileColor'),
                        backgroundColor: getTheme('secondaryTextColor'),
                        icon: Icons
                            .sync_disabled_outlined, //sync_alt_rounded,//wifi_protected_setup_outlined,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        getText('freezeCardText'),
                        style: TextStyle(
                          fontSize: 20,
                          color: getTheme('grayTextColor'),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      PillIconWidget(
                        width: 110,
                        height: 40,
                        color: getTheme('tileColor'),
                        backgroundColor: getTheme('secondaryTextColor'),
                        icon: Icons.palette_outlined,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        getText('customizeText'),
                        style: TextStyle(
                          fontSize: 20,
                          color: getTheme('grayTextColor'),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      PillIconWidget(
                        width: 110,
                        height: 40,
                        color: getTheme('tileColor'),
                        backgroundColor: getTheme('secondaryTextColor'),
                        icon: Icons.dashboard_customize_outlined,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        getText('manageText'),
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
            const SizedBox(height: 36),
            Text(
              getText('transactionHistoryText'),
              style: TextStyle(
                fontSize: 24,
                color: getTheme('secondaryTextColor'),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    height: 20,
                    image: Image.memory(base64Decode(upVector)).image),
                Text(
                  ' 1882 8245 9831 0505   ',
                  style: TextStyle(
                      fontSize: 17,
                      color: getTheme('grayTextColor'),),
                ),
                Text(
                  ' € 792.00',
                  style: TextStyle(
                      fontSize: 24,
                      color: getTheme('secondaryTextColor'),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    height: 20,
                    image: Image.memory(base64Decode(upVector)).image),
                Text(
                  ' 4120 8530 4021 8218   ',
                  style: TextStyle(
                      fontSize: 17,
                      color: getTheme('grayTextColor'),),
                ),
                Text(
                  ' \$ 151.75',
                  style: TextStyle(
                      fontSize: 24,
                      color: getTheme('secondaryTextColor'),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    height: 20,
                    image: Image.memory(base64Decode(downVector)).image),
                Text(
                  ' 7228 9021 3300 1502   ',
                  style: TextStyle(
                      fontSize: 17,
                      color: getTheme('grayTextColor'),),
                ),
                Text(
                  ' £ 879.99',
                  style: TextStyle(
                      fontSize: 24,
                      color: getTheme('secondaryTextColor'),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    height: 20,
                    image: Image.memory(base64Decode(downVector)).image),
                Text(
                  ' 5590 1245 4510 0317   ',
                  style: TextStyle(
                      fontSize: 17,
                      color: getTheme('grayTextColor'),),
                ),
                Text(
                  ' £ 233.00',
                  style: TextStyle(
                      fontSize: 24,
                      color: getTheme('secondaryTextColor'),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    height: 20,
                    image: Image.memory(base64Decode(downVector)).image),
                Text(
                  ' 1882 8245 9831 0505   ',
                  style: TextStyle(
                      fontSize: 17,
                      color: getTheme('grayTextColor'),),
                ),
                Text(
                  ' ¥ 200.11',
                  style: TextStyle(
                      fontSize: 24,
                      color: getTheme('secondaryTextColor'),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
      
      bottomNavigationBar: Footer(page: "cards"),
    );
  }
}
