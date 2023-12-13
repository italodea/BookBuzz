// ignore_for_file: prefer_const_constructors

import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppInputs {
  static InputDecoration inputDecoration = InputDecoration(
    filled: true,
    fillColor: Color(0xFFF3F3F3),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    floatingLabelStyle: TextStyle(color: AppColors.blackColor),
    border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    focusedBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.secondaryColor,
        width: 4,
        style: BorderStyle.solid,
      ),
    ),
    errorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.red,
        width: 4,
        style: BorderStyle.solid,
      ),
    ),
  );
}
