// ignore_for_file: prefer_const_constructors

import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppButtons {
  static ButtonStyle myButton = ElevatedButton.styleFrom(
    foregroundColor: Color(0xFF212121),
    backgroundColor: AppColors.secondaryColor,
    surfaceTintColor: Colors.white,
    padding: EdgeInsetsDirectional.symmetric(vertical: 12),
    minimumSize: Size(350, 59),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );

  static ButtonStyle loginButton = ElevatedButton.styleFrom(
    foregroundColor: Color(0xFF212121),
    backgroundColor: AppColors.secondaryColor,
    surfaceTintColor: Colors.white,
    padding: EdgeInsetsDirectional.symmetric(vertical: 12),
    minimumSize: Size(350, 65),
  );

  static ButtonStyle registerButton = ElevatedButton.styleFrom(
    foregroundColor: Color(0xFF212121),
    backgroundColor: Color(0xFFF3F3F3),
    surfaceTintColor: Colors.white,
    padding: EdgeInsetsDirectional.symmetric(vertical: 12),
    minimumSize: Size(350, 65),
  );

  static ButtonStyle primaryButton = ElevatedButton.styleFrom(
    foregroundColor: AppColors.secondaryColor,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    padding: EdgeInsetsDirectional.symmetric(vertical: 12),
  );

  static ButtonStyle secondaryButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.secondaryColor,
    foregroundColor: AppColors.backgroundColor,
    padding: EdgeInsetsDirectional.symmetric(vertical: 12),
  );

  static ButtonStyle tertiaryButton = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 255, 238, 178),
    foregroundColor: AppColors.blackColor,
    padding: EdgeInsetsDirectional.symmetric(vertical: 15),
  );
}
