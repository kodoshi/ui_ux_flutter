import 'package:flutter/material.dart';
import 'package:banking_app/utils/const.dart';


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
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: getTheme('accentColor'), fontWeight: FontWeight.bold),
      underline: Container(
        height: 2,
        color: getTheme('accentColor'),
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['£','\$','€','¥','BTC']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: const TextStyle(fontSize: 25.0),),
        );
      }).toList(),
    );
  }
}