import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle heading00({
    double fontSize = 50,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Almarai',
      fontWeight: FontWeight.w800,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle heading01({
    double fontSize = 34,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Almarai',
      fontWeight: FontWeight.w800,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle heading02({
    double fontSize = 28,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Almarai',
      fontWeight: FontWeight.w800,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle heading03({
    double fontSize = 24,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Almarai',
      fontWeight: FontWeight.w800,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle heading04({
    double fontSize = 20,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Almarai',
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle subtitle01({
    double fontSize = 16,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Almarai',
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle subtitle02({
    double fontSize = 14,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Almarai',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle subtitle03(
      {double fontSize = 12,
      Color color = Colors.black,
      TextDecoration? decoration,
      double? letterSpacing}) {
    return TextStyle(
        color: color,
        fontFamily: 'Almarai',
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: fontSize,
        decoration: decoration,
        letterSpacing: letterSpacing);
  }

  static TextStyle subtitle04({
    double fontSize = 10,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Almarai',
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle buttonStyle({
    double fontSize = 15,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Almarai',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle textfieldStyle({
    double fontSize = 12,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Almarai',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle navRailStyle({
    double fontSize = 14,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontFamily: 'Almarai',
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }
}
