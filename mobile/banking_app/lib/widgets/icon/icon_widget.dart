import 'package:flutter/material.dart';

/// custom icon builder used in the ProfilePage
class IconWidget extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final Color? backgroundColor;

  const IconWidget({Key? key, this.icon, this.color, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:color,
      ),
      child: Icon(icon, color: backgroundColor), //Colors.white
    );
  }
}