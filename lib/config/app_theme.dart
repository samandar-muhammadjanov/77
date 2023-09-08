import 'package:flutter/material.dart';
import '../utils/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "inter",
    appBarTheme: AppBarTheme(
      backgroundColor: kWhite,
      foregroundColor: kBlack,
      elevation: 0,
    ),
    scaffoldBackgroundColor: kFillColor
  );
}
