import 'package:banking_app/utils/const.dart';
import 'package:flutter/material.dart';

class HeaderProfile extends StatelessWidget {
  final String dropdownValue = '£';

  const HeaderProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        backgroundColor: getTheme('backgroundColor'),
        body: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Stack(
              children: <Widget>[
                const Align(
                  alignment: Alignment(-1, 0.3),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/image/profile_pict.jpg"),
                    radius: 32.5,
                  ),
                ),
                const Align(
                  alignment: Alignment(-0.47, 0),
                  child: Text(
                    'Maria Callas',
                    style: TextStyle( fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                const Align(
                  alignment:  Alignment(-0.28, 0.35),
                  child: Text(
                    '5812 9023 8431 1323',
                    style: TextStyle( fontSize: 16.0),
                  ),
                ),
                Align(
                  alignment: const Alignment(-0.28, 0.35) + const Alignment(0.80, 0),
                child: Image.asset(
                  "assets/image/Mastercard-logo.png",
                  width:25,
                  ),),
                Align(
                  alignment: Alignment.centerRight + const Alignment(0, .1),
                  child: const Icon(Icons.more_vert),
                  
                ),
              ],
            ),
          ),
        ],
      ),
      )
    );
  }
}