import 'package:flutter/material.dart';
import 'package:banking_app/utils/const.dart';
import 'package:banking_app/widgets/icon/icon_widget.dart';
import 'package:banking_app/widgets/footer/footer_min.dart';

class ExchangePage extends StatefulWidget {
  ExchangePage({Key? key}) : super(key: key);

  @override
  _ExchangePage createState() => _ExchangePage();
}

class _ExchangePage extends State<ExchangePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getTheme('backgroundColor'),
      appBar: AppBar(
        leading: BackButton(
          color: getTheme('secondaryTextColor'),
        ),
        title: Text(
          getText('exchangeText'),
          style: TextStyle(
            color: getTheme('secondaryTextColor'),
          ),
        ),
        centerTitle: true,
        backgroundColor: getTheme('backgroundColor'),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Text(
              getText('serviceRatesText'),
              style: TextStyle(
                fontSize: 24,
                color: getTheme('secondaryTextColor'),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      getText('coinText'),
                      style: TextStyle(
                        fontSize: 17,
                        color: getTheme('grayTextColor'),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconWidget(
                          color: Colors.blue[700],
                          backgroundColor: getTheme('secondaryTextColor'),
                          icon: Icons.euro_rounded,
                        ),
                        Text(
                          ' EUR',
                          style: TextStyle(
                            fontSize: 20,
                            color: getTheme('secondaryTextColor'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconWidget(
                          color: Colors.blue[900],
                          backgroundColor: getTheme('secondaryTextColor'),
                          icon: Icons.attach_money_rounded,
                        ),
                        Text(
                          ' GBP',
                          style: TextStyle(
                            fontSize: 20,
                            color: getTheme('secondaryTextColor'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconWidget(
                          color: Colors.blue[300],
                          backgroundColor: getTheme('secondaryTextColor'),
                          icon: Icons.attach_money_rounded,
                        ),
                        Text(
                          ' AUD',
                          style: TextStyle(
                            fontSize: 20,
                            color: getTheme('secondaryTextColor'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconWidget(
                          color: Colors.red[200],
                          backgroundColor: getTheme('secondaryTextColor'),
                          icon: Icons.attach_money_rounded,
                        ),
                        Text(
                          ' CAD',
                          style: TextStyle(
                            fontSize: 20,
                            color: getTheme('secondaryTextColor'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconWidget(
                          color: Colors.red,
                          backgroundColor: getTheme('secondaryTextColor'),
                          icon: Icons.attach_money_rounded,
                        ),
                        Text(
                          ' YEN',
                          style: TextStyle(
                            fontSize: 20,
                            color: getTheme('secondaryTextColor'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconWidget(
                          color: Colors.yellow[900],
                          backgroundColor: getTheme('secondaryTextColor'),
                          icon: Icons.attach_money_rounded,
                        ),
                        Text(
                          ' BTC',
                          style: TextStyle(
                            fontSize: 20,
                            color: getTheme('secondaryTextColor'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconWidget(
                          color: Colors.yellow[700],
                          backgroundColor: getTheme('secondaryTextColor'),
                          icon: Icons.attach_money_rounded,
                        ),
                        Text(
                          ' ETH',
                          style: TextStyle(
                            fontSize: 20,
                            color: getTheme('secondaryTextColor'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconWidget(
                          color: Colors.yellow[700],
                          backgroundColor: getTheme('secondaryTextColor'),
                          icon: Icons.attach_money_rounded,
                        ),
                        Text(
                          ' XRP',
                          style: TextStyle(
                            fontSize: 20,
                            color: getTheme('secondaryTextColor'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconWidget(
                          color: Colors.yellow[700],
                          backgroundColor: getTheme('secondaryTextColor'),
                          icon: Icons.attach_money_rounded,
                        ),
                        Text(
                          ' UNI',
                          style: TextStyle(
                            fontSize: 20,
                            color: getTheme('secondaryTextColor'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      getText('sellText'),
                      style: TextStyle(
                        fontSize: 17,
                        color: getTheme('grayTextColor'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '119.80',
                      style: TextStyle(
                        fontSize: 20,
                        color: getTheme('secondaryTextColor'),
                      ),
                    ),
                    const SizedBox(height: 26),
                    Text(
                      '142.10',
                      style: TextStyle(
                        fontSize: 20,
                        color: getTheme('secondaryTextColor'),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '76.35',
                      style: TextStyle(
                        fontSize: 20,
                        color: getTheme('secondaryTextColor'),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '82.20',
                      style: TextStyle(
                        fontSize: 20,
                        color: getTheme('secondaryTextColor'),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Text(
                      '112.65',
                      style: TextStyle(
                        fontSize: 20,
                        color: getTheme('secondaryTextColor'),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      '100.01',
                      style: TextStyle(
                        fontSize: 20,
                        color: getTheme('secondaryTextColor'),
                      ),
                    ),
                    const SizedBox(height: 26),
                    Text(
                      '100.02',
                      style: TextStyle(
                        fontSize: 20,
                        color: getTheme('secondaryTextColor'),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '100.03',
                      style: TextStyle(
                        fontSize: 20,
                        color: getTheme('secondaryTextColor'),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '100.04',
                      style: TextStyle(
                        fontSize: 20,
                        color: getTheme('secondaryTextColor'),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      getText('buyText'),
                      style: TextStyle(
                        fontSize: 17,
                        color: getTheme('grayTextColor'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '124.80',
                      style: TextStyle(
                        fontSize: 20,
                        color: getTheme('secondaryTextColor'),
                      ),
                    ),
                    const SizedBox(height: 26),
                    Text(
                      '146.10',
                      style: TextStyle(
                        fontSize: 20,
                        color: getTheme('secondaryTextColor'),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '80.35',
                      style: TextStyle(
                        fontSize: 20,
                        color: getTheme('secondaryTextColor'),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '86.20',
                      style: TextStyle(
                        fontSize: 20,
                        color: getTheme('secondaryTextColor'),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Text(
                      '116.65',
                      style: TextStyle(
                        fontSize: 20,
                        color: getTheme('secondaryTextColor'),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      '104.01',
                      style: TextStyle(
                        fontSize: 20,
                        color: getTheme('secondaryTextColor'),
                      ),
                    ),
                    const SizedBox(height: 26),
                    Text(
                      '104.02',
                      style: TextStyle(
                        fontSize: 20,
                        color: getTheme('secondaryTextColor'),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '104.03',
                      style: TextStyle(
                        fontSize: 20,
                        color: getTheme('secondaryTextColor'),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '104.04',
                      style: TextStyle(
                        fontSize: 20,
                        color: getTheme('secondaryTextColor'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(page: "home"),
    );
  }
}
