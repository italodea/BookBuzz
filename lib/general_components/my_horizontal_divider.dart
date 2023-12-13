import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';

class MyHorizontalDivider extends StatelessWidget {
  const MyHorizontalDivider({
    super.key,
    this.color = AppColors.blackColor,
    this.width = 30,
  });

  final Color color;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: width,
      height: 1,
    );
  }
}
