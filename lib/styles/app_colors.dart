// ignore_for_file: slash_for_doc_comments, prefer_const_constructors

import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';

/**
 * Paleta de cores usada pode ser consultada aqui:
 * https://coolors.co/visualizer/dad7cd-a3b18a-588157-3a5a40-344e41
 */
class AppColors {
  static const Color foregroundColor = Color(0xfffdf7eb);
  static const Color primaryColor = Color(0xffffe073);
  static const Color secondaryColor = Color(0xffFFC700);
  static const Color primaryDarkColor = Color(0xff3A5A40);
  static const Color secondaryDarkColor = Color(0xff344E41);
  static const Color backgroundColor = Color(0xffffffff);
  static const Color backgroundDarkColor = Color(0xfff7f7f7);
  static const Color dangerColor = Colors.red;
  static const Color blackColor = Color(0xFF212121);
  static const Color greyColor = Color(0xFF545151);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const List<BoxShadow> shadow = [
    BoxShadow(
      blurRadius: 2,
      color: Color(0x441c1304),
      offset: Offset(0, 0),
      spreadRadius: 0,
    )
  ];
  static ThemeData getTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        background: backgroundColor,
        brightness: Brightness.light,
        error: dangerColor,
        secondary: secondaryColor,
        outline: foregroundColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        surfaceTintColor: backgroundColor,
        foregroundColor: blackColor,
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 50,
        titleTextStyle: AppText.titleLarge.merge(AppText.blackColor),
      ),
      useMaterial3: true,
      textTheme: AppText.getTheme(),
      fontFamily: 'Outfit',
    );
  }
}
