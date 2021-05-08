import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/app_logic/providers/presets.dart';
import 'package:sleep_app/theme.dart';
import 'package:sleep_app/ui/screens/home_screen.dart';
import 'package:sleep_app/app_logic/providers/default_timer.dart';
import 'package:sleep_app/app_logic/providers/tunes.dart';
import 'package:sleep_app/app_logic/providers/volume.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Tunes>(create: (_) => Tunes()),
        ChangeNotifierProvider<Presets>(create: (_) => Presets()),
        ChangeNotifierProvider<DefaultTimer>(create: (_) => DefaultTimer()),
        ChangeNotifierProvider<Volume>(create: (_) => Volume(0.8))
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
// TODO Add tunes and all only after filling all the folders
