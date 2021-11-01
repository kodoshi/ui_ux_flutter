import 'package:flutter/material.dart';

/// custom icon builder used in the ProfilePage
class PillIconWidget extends StatelessWidget {
  final IconData? icon;
  final Color? color;
  final Color? backgroundColor;
  final bool? pillEnabled;
  final double? width;
  final double? height;

  const PillIconWidget({Key? key, this.icon, this.color, this.backgroundColor, this.pillEnabled, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: Icon(icon, color: backgroundColor), //Colors.white
    );
  }
}