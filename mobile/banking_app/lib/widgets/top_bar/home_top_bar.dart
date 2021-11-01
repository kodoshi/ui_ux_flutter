import 'package:banking_app/pages/settings.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:banking_app/utils/const.dart';
import 'package:banking_app/widgets/icon/icon_widget.dart';

class HomeTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String? textBar;
  final StatefulWidget? redirect;

  HomeTopBar({this.textBar, this.redirect});

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: getTheme('backgroundColor'),
      foregroundColor: getTheme('backgroundColor'),
      title: Center(child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: Image.memory(base64Decode(profilePicture)).image),
          ),
        ),),
      actions: [
        GestureDetector(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => redirect!)); //to notifications
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 6, 18, 6),
            child: IconWidget(
                color: getTheme('tileColor'),
                backgroundColor: getTheme('secondaryTextColor'),
                icon: Icons.notifications_on_outlined),
          ),
        )
      ],
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()),
          ); //to settings
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(18, 6, 0, 6),
          child: IconWidget(
            color: getTheme('tileColor'),
            backgroundColor: getTheme('secondaryTextColor'),
            icon: Icons.settings,
          ),
        ),
      ),
    );
  }
}