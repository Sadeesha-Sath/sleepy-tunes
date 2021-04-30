import 'package:flutter/material.dart';
import 'package:sleep_app/ui/screens/home_screen.dart';
import 'package:sleep_app/ui/ui_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sleepy Tunes",
      theme: ThemeData.dark().copyWith(
          // colorScheme: ColorScheme.fromSwatch(
          //     primarySwatch: Colors.blue,
          //     backgroundColor: kBackgroundColor,
          //     accentColor: Colors.blueAccent.shade400,
          //     brightness: Brightness.dark),
          primaryColor: Colors.blue.shade500,
          backgroundColor: kBackgroundColor,
          accentColor: Colors.blueAccent.shade400,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: kBottomNavBarBackgroundColor,
              selectedItemColor: Colors.blueAccent.shade400),
          unselectedWidgetColor: Colors.grey.shade600),
      home: HomeScreen(),
    );
  }
}
