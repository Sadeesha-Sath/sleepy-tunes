import 'package:flutter/material.dart';
import 'package:sleep_app/ui/screens/tunes_screen.dart';
import 'package:sleep_app/ui/screens/settings_screen.dart';
import 'package:sleep_app/ui/screens/customize_screen.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.music_note_rounded), label: "Tunes"),
          BottomNavigationBarItem(
              icon: Icon(Icons.tune_rounded), label: "Customize"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded), label: 'Settings')
        ],
      ),
      body: widget._screens[_currentIndex],
    );
  }
}
