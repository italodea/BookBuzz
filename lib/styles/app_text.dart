import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppText {
  static const TextStyle displayLarge = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle displayMedium = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle displaySmall = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle headlineSmall = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle titleLarge = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle titleMedium = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle titleSmall = TextStyle(
    fontSize: 12.0,
  );
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16.0,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14.0,
  );
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12.0,
  );
  static const TextStyle labelLarge = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle labelMedium = TextStyle(
    fontSize: 12.0,
  );
  static const TextStyle labelSmall = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle foregroundColor = TextStyle(
    color: AppColors.foregroundColor,
  );
  static const TextStyle primaryColor = TextStyle(
    color: AppColors.primaryColor,
  );
  static const TextStyle secondaryColor = TextStyle(
    color: AppColors.secondaryColor,
  );
  static const TextStyle primaryDarkColor = TextStyle(
    color: AppColors.primaryDarkColor,
  );
  static const TextStyle secondaryDarkColor = TextStyle(
    color: AppColors.secondaryDarkColor,
  );
  static const TextStyle backgroundColor = TextStyle(
    color: AppColors.backgroundColor,
  );
  static const TextStyle backgroundDarkColor = TextStyle(
    color: AppColors.backgroundDarkColor,
  );
  static const TextStyle dangerColor = TextStyle(
    color: AppColors.dangerColor,
  );
  static const TextStyle whiteColor = TextStyle(
    color: AppColors.whiteColor,
  );
  static const TextStyle blackColor = TextStyle(
    color: AppColors.blackColor,
  );

  static const TextStyle greyColor = TextStyle(
    color: AppColors.greyColor,
  );

  static const TextStyle shadow = TextStyle(
    shadows: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 3,
        offset: Offset(1, 2),
      )
    ],
  );

  static TextTheme getTheme() {
    return const TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: labelSmall,
    );
  }
}
