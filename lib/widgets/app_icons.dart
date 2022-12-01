import 'package:e_commerce_app/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  double size;
  final Color backGroundColor;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  AppIcon({Key? key,
   this.size=40,
    this.backGroundColor=const Color(0xFFfcf4e4),
   required this.icon,
    this.iconColor= const Color(0xFF756d54),
    this.iconSize=16,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backGroundColor,
      ),
      child: Icon(icon,
      color: iconColor,
      size: iconSize),
    );
  }
}
