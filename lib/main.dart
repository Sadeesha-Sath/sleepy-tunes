import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/app_logic/audio_players/simple_player.dart';
import 'package:sleep_app/app_logic/providers/presets.dart';
import 'package:sleep_app/theme.dart';
import 'package:sleep_app/ui/screens/home_screen.dart';
import 'package:sleep_app/app_logic/providers/default_timer.dart';
import 'package:sleep_app/app_logic/providers/tunes.dart';
import 'package:sleep_app/app_logic/providers/volume.dart';
import 'package:sleep_app/app_logic/providers/bottom_appbar_data.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomAppBarData>(create: (_) => BottomAppBarData()),
        Provider<SimplePlayer>(create: (_) => SimplePlayer()),
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
      home: AudioServiceWidget(child: HomeScreen()),
    );
  }
}

// TODO Cut and trim the nature tune
// TODO  Implement audio service and audio picker
// TODO Add tunes and all only after filling all the folders
