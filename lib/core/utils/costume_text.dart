import 'package:ecommerce_app_food/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CostumeText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  Color? color;
  CostumeText({
    super.key,
    required this.text,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w500,
    this.color = const Color(0xFF332d2b),
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        fontFamily: "Robote",
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
