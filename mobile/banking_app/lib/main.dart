import 'package:flutter/material.dart';
import 'package:banking_app/pages/home.dart';
import 'package:banking_app/pages/test_home.dart';
import 'package:banking_app/pages/my_cards.dart';
import 'package:banking_app/pages/amount_page.dart';
import 'package:banking_app/pages/exchange.dart';
import 'package:banking_app/pages/transfer.dart';
import 'package:banking_app/pages/settings.dart';
import 'package:banking_app/utils/const.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';

// void main() {
//   runApp(const App());
// }

Future main() async {
  //enables persistent global settings
  await Settings.init(cacheProvider: SharePreferenceCache());
  //Settings.getValue<T>(cacheKey, defaultValue);
  //await Settings.setValue<T>(cacheKey, newValue);

  runApp(
    EasyDynamicThemeWidget(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VaporWare',
      home: HomePage(),//HomePage(),
      themeMode: EasyDynamicTheme.of(context).themeMode,
      theme: ThemeData(
        backgroundColor: getTheme('backgroundColor'),
        primaryColor: getTheme('primaryColor'),
        accentColor: getTheme('accentColor'),
        bottomAppBarColor: getTheme('primaryColor'),
        textSelectionColor: getTheme('secondaryTextColor'),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        backgroundColor: getTheme('backgroundColor'),
        primaryColor: getTheme('primaryColor'),
        accentColor: getTheme('accentColor'),
        bottomAppBarColor: getTheme('primaryColor'),
        textSelectionColor: getTheme('secondaryTextColor'),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/transfer': (context) => TransferPage(),
        '/settings': (context) => SettingsPage(),
        '/exchange': (context) => ExchangePage(),
        '/cards': (context) => CardsPage(),
        '/amount': (context) => AmountPage(),
      },
    );
  }
}