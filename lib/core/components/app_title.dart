import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTitle extends StatelessWidget {
  final String text;
  final double fontSize;

  const AppTitle({super.key, required this.text, this.fontSize = 24});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
    );
  }
}
