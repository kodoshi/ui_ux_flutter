import 'package:flutter/material.dart';

class HeaderProfile extends StatelessWidget {
  String dropdownValue = '£';

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
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
                    backgroundImage: NetworkImage("https://i.picsum.photos/id/866/200/300.jpg"),
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
                Align(
                  alignment:  Alignment(-0.28, 0.35),
                  child: const Text(
                    '5812 9023 8431 1323',
                    style: TextStyle( fontSize: 16.0),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight + const Alignment(0, .1),
                  child: Icon(Icons.more_vert),
                  
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