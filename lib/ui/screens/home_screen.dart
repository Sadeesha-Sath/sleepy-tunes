import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/providers/default_timer.dart';
import 'package:sleep_app/ui/screens/tunes_screen.dart';
import 'package:sleep_app/ui/screens/settings_screen.dart';
import 'package:sleep_app/ui/screens/customize_screen.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/ui/ui_constants.dart';

class HomeScreen extends StatefulWidget {
  final List<Widget> _screens = [
    TunesScreen(),
    CustomizeScreen(),
    SettingsScreen()
  ];
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    context.read<DefaultTimer>().getSavedData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              backgroundColor: kBottomNavBarBackgroundColor1,
              icon: Icon(Icons.music_note_rounded),
              label: "Tunes"),
          BottomNavigationBarItem(
              backgroundColor: kBottomNavBarBackgroundColor2,
              icon: Icon(Icons.tune_rounded),
              label: "Customize"),
          BottomNavigationBarItem(
              backgroundColor: kBottomNavBarBackgroundColor3,
              icon: Icon(Icons.settings_rounded),
              label: 'Settings')
        ],
      ),
      body: widget._screens[_currentIndex],
    );
  }
}
