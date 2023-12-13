// ignore_for_file: prefer_const_constructors

import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppSnackbar {
  static showSnackbarGreen(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,
            style: TextStyle(color: AppColors.whiteColor),
            textAlign: TextAlign.center),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static showSnackbarYellow(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,
            style: TextStyle(color: AppColors.blackColor),
            textAlign: TextAlign.center),
        backgroundColor: AppColors.secondaryColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static showSnackbarRed(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,
            style: TextStyle(color: AppColors.whiteColor),
            textAlign: TextAlign.center),
        backgroundColor: AppColors.dangerColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
