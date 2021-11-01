import 'dart:io';
import 'package:flutter/material.dart';
import 'package:banking_app/widgets/footer/footer_min.dart';
import 'package:banking_app/widgets/icon/icon_widget.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:banking_app/utils/const.dart';

/// this page is responsible for showing the personal details of the user,
/// as well as offering some graphical settings, like language switch or dark theme switch
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  File? photoTaken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getTheme('backgroundColor'),
      appBar: AppBar(
        leading: BackButton(
          color: getTheme('secondaryTextColor'),
        ),
        title: Text(
          getText('appSettingsText'),
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
            const SizedBox(
              height: 30,
            ),
            SettingsGroup(
              title: getText("behaviorTweaksText"),
              children: <Widget>[
                const SizedBox(
                  height: 8,
                ),
                buildCryptoPreferred(),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SettingsGroup(
              title: getText("visualTweaksText"),
              children: <Widget>[
                const SizedBox(
                  height: 8,
                ),
                buildLanguage(),
                buildDarkMode(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(page: "home"),
    );
  }

  Widget buildCryptoPreferred() => SwitchSettingsTile(
        tileColor: getTheme('backgroundColor'),
        settingKey: 'key-crypto-preferred',
        title: getText('cryptoPreferredText'),
        leading: IconWidget(
          icon: Icons.attach_money_rounded,
          color: getTheme('accentColor'),
        ),
        onChange: (isCrypto) {
          setState(() {});
        },
      );

  /// custom widget to build the settings tile responsible for Language Switch
  Widget buildLanguage() => DropDownSettingsTile(
        tileColor: getTheme('backgroundColor'),
        leading: IconWidget(
          icon: Icons.translate_rounded,
          color: getTheme('accentColor'),
        ),
        settingKey: 'key-language',
        title: getText('languageText').toString(),
        selected: 1,
        values: <int, String>{
          1: 'English',
          2: 'Français',
        },
        onChange: (language) {
          translation = Settings.getValue<int>('key-language', 1);
          setState(() {});
        },
      );

  /// custom widget to build the settings tile responsible for Dark Theme Switch
  Widget buildDarkMode() => SwitchSettingsTile(
        tileColor: getTheme('backgroundColor'),
        settingKey: 'key-dark-mode',
        title: getText('darkThemeText').toString(),
        leading: IconWidget(
          icon: Icons.dark_mode,
          color: getTheme('accentColor'),
        ),
        onChange: (isDarkMode) {
          EasyDynamicTheme.of(context).changeTheme();
          setState(() {});
        },
      );
}
