import 'package:flutter/material.dart';
import 'package:twitter_mobile_clone/theme/styles.dart';


class AppTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Styles.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Styles.backgroundColor,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Styles.blueColor,
    ),
  );
}