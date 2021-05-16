import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleepy_tunes/app_logic/audio_players/simple_player.dart';
import 'package:sleepy_tunes/app_logic/providers/customize_timer.dart';
import 'package:sleepy_tunes/app_logic/providers/selected_tracks.dart';
import 'package:sleepy_tunes/app_logic/providers/tracks.dart';
import 'package:sleepy_tunes/app_logic/providers/presets.dart';
import 'package:sleepy_tunes/theme.dart';
import 'package:sleepy_tunes/ui/screens/home_screen.dart';
import 'package:sleepy_tunes/app_logic/providers/default_timer.dart';
import 'package:sleepy_tunes/app_logic/providers/tunes.dart';
import 'package:sleepy_tunes/app_logic/providers/volume.dart';
import 'package:sleepy_tunes/app_logic/providers/bottom_appbar_data.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CustomizeTimer>(
          create: (_) => CustomizeTimer(),
        ),
        ChangeNotifierProvider<SelectedTracks>(create: (_) => SelectedTracks()),
        ChangeNotifierProvider<Tracks>(create: (_) => Tracks()),
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
      home: HomeScreen(),
    );
  }
}
