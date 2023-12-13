// ignore_for_file: prefer_const_constructors

import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';

class MyRadio extends StatelessWidget {
  const MyRadio({super.key, this.marked = false});

  final bool marked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        decoration: marked
            ? BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 5,
                  color: Colors.white,
                ),
              )
            : BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 5,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
