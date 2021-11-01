import 'package:flutter/material.dart';
import 'package:banking_app/utils/const.dart';
import 'package:banking_app/pages/component/card_scroller.dart';
import 'package:banking_app/pages/amount_page.dart';
import 'package:banking_app/widgets/footer/footer_min.dart';
import 'package:banking_app/widgets/icon/icon_widget.dart';
import 'package:banking_app/pages/component/header_profile.dart';

class TransferPage extends StatefulWidget {
  TransferPage({Key? key}) : super(key: key);

  @override
  _TransferPage createState() => _TransferPage();
}

class _TransferPage extends State<TransferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getTheme('backgroundColor'),
      appBar: AppBar(
        leading: BackButton(
          color: getTheme('secondaryTextColor'),
        ),
        title: Text(
          getText('transferToCardText'),
          style: TextStyle(
            color: getTheme('secondaryTextColor'),
          ),
        ),
        centerTitle: true,
        backgroundColor: getTheme('backgroundColor'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Text(
              getText('fromTheCardText'),
              style: TextStyle(
                fontSize: 20,
                color: getTheme('secondaryTextColor'),
              ),
            ),
            Container(
              //width: MediaQuery.of(context).size.width,
              height: 170,
              decoration: BoxDecoration(
                color: getTheme('backgroundColor'),
              ),
              child: CardScroller(),
            ),
            Text(
              getText('toTheCardText'),
              style: TextStyle(
                fontSize: 20,
                color: getTheme('secondaryTextColor'),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: const EdgeInsets.only(top: 10.0),
                  alignment: Alignment.center,
                  child: const TextField(
                    decoration: InputDecoration(
                        //border: OutlineInputBorder(),
                        hintText: '_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _'),
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AmountPage())); //to payment preferences
                    },
                    child: IconWidget(
                        color: getTheme('accentColor'),
                        backgroundColor: getTheme('secondaryTextColor'),
                        icon: Icons.arrow_forward),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              getText('chooseContactText'),
              style: TextStyle(
                fontSize: 20,
                color: getTheme('secondaryTextColor'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AmountPage())); //to payment preferences
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: SizedBox(
                  height: 140.0,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment(-0.9, 0.3),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/image/profile_pict.jpg"),
                          radius: 32.5,
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.35, 0),
                        child: Text(
                          'Maria Callas',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.16, 0.35),
                        child: Text(
                          '5812 9023 8431 1323',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.28, 0.35) + Alignment(0.80, 0),
                        child: Image.asset(
                          "assets/image/Mastercard-logo.png",
                          width: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(page: "home"),
    );
  }
}
