/// Flutter code sample for DropdownButton

// This sample shows a `DropdownButton` with a large arrow icon,
// purple text style, and bold purple underline, whose value is one of "One",
// "Two", "Free", or "Four".
//
// ![](https://flutter.github.io/assets-for-api-docs/assets/material/dropdown_button.png)

import 'package:flutter/material.dart';


/// This is the stateful widget that the main application instantiates.
class DropdownMenu extends StatefulWidget {
  const DropdownMenu({Key? key}) : super(key: key);

  @override
  State<DropdownMenu> createState() => _DropdownMenuState();
}

/// This is the private State class that goes with DropdownMenu.
class _DropdownMenuState extends State<DropdownMenu> {
  String dropdownValue = '£';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      // icon: const Icon(Icons.arrow_downward),
      // iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['£','\$','€','¥']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: const TextStyle(fontSize: 18.0),),
        );
      }).toList(),
    );
  }
}