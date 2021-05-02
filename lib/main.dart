import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/ui/screens/home_screen.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:sleep_app/app_logic/providers/default_timer.dart';

void main() {
  runApp(
    Provider<DefaultTimer>(
      create: (_) => DefaultTimer(),
      child: MyApp(),
    ),
  );
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
        accentColor: Colors.lightBlueAccent.shade400,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: kBottomNavBarBackgroundColor,
            selectedItemColor: Colors.lightBlueAccent.shade700),
        unselectedWidgetColor: Colors.grey.shade600,
        dialogBackgroundColor: kBackgroundColor,
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
      ),
      home: HomeScreen(),
    );
  }
}
