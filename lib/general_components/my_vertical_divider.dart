import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';

class MyVerticalDivider extends StatelessWidget {
  const MyVerticalDivider({
    super.key,
    this.color = AppColors.primaryColor,
    this.height = 30,
  });

  final Color color;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: height,
      width: 2,
    );
  }
}
