import 'package:flutter/material.dart';
import 'package:banking_app/utils/const.dart';

import 'package:banking_app/pages/home.dart';
import 'package:banking_app/pages/profile_page.dart';
import 'package:banking_app/pages/welcome_page.dart';

class Footer extends StatelessWidget {
  final String? page;

  final indexArray = ["home", "profile", "welcome"];
  final redirectArray = [Home(), ProfilePage(), WelcomePage()];
  Footer({Key? key, this.page}) : super(key: key);

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
      unselectedItemColor: getTheme('unselectedItemColor'),
      items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.home), label: getText("homeText")),
        BottomNavigationBarItem(
          icon: const Icon(Icons.search),
          label: getText("searchText"),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.play_arrow_outlined),
          label: getText("orderText"),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.account_circle),
          label: getText("profileText"),
        )
      ],
      currentIndex: indexArray.indexOf(page!),
      onTap: handleRedirectFooter,
    );
  }
}
