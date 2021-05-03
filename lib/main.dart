import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/app_logic/providers/presets.dart';
import 'package:sleep_app/theme.dart';
import 'package:sleep_app/ui/screens/home_screen.dart';
import 'package:sleep_app/app_logic/providers/default_timer.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Presets>(create: (_) => Presets()),
        ChangeNotifierProvider<DefaultTimer>(create: (_) => DefaultTimer()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sleepy Tunes",
      theme: darkTheme,
      home: HomeScreen(),
    );
  }
}
