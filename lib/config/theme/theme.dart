import 'package:flutter/material.dart';
import 'package:two_website/config/constants/sizes_config.dart';
import 'color.dart';
import 'text_style.dart'; // لو تستخدم TextStyle مخصصة من هنا

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      fontFamily: 'Almarai',
      primaryColor: AppColors.mainColor,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize:
              const Size(SizesConfig.buttonWidth, SizesConfig.buttonHeight),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          backgroundColor: AppColors.greenShade2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizesConfig.buttonRadius),
          ),
          textStyle: AppTextStyle.buttonStyle(color: AppColors.white),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(
          AppColors.mainColor.value,
          const {
            50: AppColors.mainColor,
            100: AppColors.mainColor,
            200: AppColors.mainColor,
            300: AppColors.mainColor,
            400: AppColors.mainColor,
            500: AppColors.mainColor,
            600: AppColors.mainColor,
            700: AppColors.mainColor,
            800: AppColors.mainColor,
            900: AppColors.mainColor,
          },
        ),
      ).copyWith(secondary: AppColors.secondaryColor),
    );
  }
}
