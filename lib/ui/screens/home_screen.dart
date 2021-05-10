import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/audio_players/simple_player.dart';
import 'package:sleep_app/app_logic/providers/bottom_appbar_data.dart';
import 'package:sleep_app/app_logic/providers/default_timer.dart';
import 'package:sleep_app/app_logic/providers/tunes.dart';
import 'package:sleep_app/ui/screens/tunes_screen.dart';
import 'package:sleep_app/ui/screens/settings_screen.dart';
import 'package:sleep_app/ui/screens/customize_screen.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:sleep_app/app_logic/providers/presets.dart';

class HomeScreen extends StatefulWidget {
  final List<Widget> _screens = [TunesScreen(), CustomizeScreen(), SettingsScreen()];
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    context.read<Tunes>().loadTunes();
    context.read<Presets>().loadPresets();
    context.read<DefaultTimer>().getSavedData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _simplePlayer = context.read<SimplePlayer>();
    var _bottomAppBarData = context.watch<BottomAppBarData>();
    return Scaffold(
      persistentFooterButtons: [
        SizedBox(
          width: double.maxFinite,
          child: ListTile(
            // TODO Find a good BackgroundColor
            tileColor: Colors.lightBlue.shade900,
            contentPadding: EdgeInsets.only(left: 10),
            leading: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(_bottomAppBarData.imagePath ?? 'assets/placeholder.jpg'), fit: BoxFit.cover)),
              width: 47,
              height: 47,
            ),
            title: Text(_bottomAppBarData.title ?? "Hey! We're lonely over here. Let's play something..."),
            trailing: SizedBox(
              width: 110,
              child: Row(
                children: [
                  IconButton(
                      splashRadius: 25,
                      icon: Icon(
                        _bottomAppBarData.isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 32,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {
                        _bottomAppBarData.isPlaying ? _simplePlayer.onPause() : _simplePlayer.onResume();
                        context.read<BottomAppBarData>().changePlayingState();
                      }),
                  IconButton(
                      splashRadius: 25,
                      icon: Icon(
                        Icons.close,
                        size: 32,
                        color: kSecondaryColor,
                      ),
                      onPressed: () {
                        _simplePlayer.dispose();
                        context.read<BottomAppBarData>().changePlayingState(false);
                        context.read<BottomAppBarData>().clearData();
                      })
                ],
              ),
            ),
          ),
        )
      ],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              backgroundColor: kBottomNavBarBackgroundColor1, icon: Icon(Icons.music_note_rounded), label: "Tunes"),
          BottomNavigationBarItem(
              backgroundColor: kBottomNavBarBackgroundColor2, icon: Icon(Icons.tune_rounded), label: "Customize"),
          BottomNavigationBarItem(
              backgroundColor: kBottomNavBarBackgroundColor3, icon: Icon(Icons.settings_rounded), label: 'Settings')
        ],
      ),
      body: widget._screens[_currentIndex],
    );
  }
}
