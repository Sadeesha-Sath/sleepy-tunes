import 'package:flutter/material.dart';
import 'ui/ui_constants.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  accentColorBrightness: Brightness.dark,
  primaryColor: Colors.blue.shade500,
  backgroundColor: kBackgroundColor,
  accentColor: Colors.lightBlueAccent.shade400,
  buttonBarTheme: ButtonBarThemeData(buttonPadding: EdgeInsets.zero),
  // ? BottomNavBar theme
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.lightBlueAccent.shade700,
  ),
  unselectedWidgetColor: Colors.grey.shade600,
  dialogBackgroundColor: kBackgroundColor,
  // ? AppBar theme
  appBarTheme: AppBarTheme().copyWith(
    brightness: Brightness.dark,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    foregroundColor: kPrimaryColor,
  ),
  // ? Elevated Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      side: MaterialStateProperty.all(
        BorderSide(color: Colors.lightBlue.shade700, width: 2),
      ),
      backgroundColor: MaterialStateProperty.all(kBackgroundColor),
    ),
  ),
);
