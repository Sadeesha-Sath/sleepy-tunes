import 'package:flutter/material.dart';
import 'package:sleepy_tunes/app_logic/providers/customize_timer.dart';
import 'package:sleepy_tunes/app_logic/providers/default_timer.dart';
import 'package:sleepy_tunes/app_logic/providers/tracks.dart';
import 'package:sleepy_tunes/app_logic/providers/tunes.dart';
import 'package:sleepy_tunes/ui/custom_methods/persistent_footer_widgets.dart';
import 'package:sleepy_tunes/ui/screens/tunes_screen.dart';
import 'package:sleepy_tunes/ui/screens/settings_screen.dart';
import 'package:sleepy_tunes/ui/screens/customize_screen.dart';
import 'package:provider/provider.dart';
import 'package:sleepy_tunes/ui/ui_constants.dart';
import 'package:sleepy_tunes/app_logic/providers/presets.dart';

class HomeScreen extends StatefulWidget {
  final List<Widget> _screens = [TunesScreen(), CustomizeScreen(), SettingsScreen()];
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    context.read<Tunes>().loadTunes();
    context.read<Tracks>().loadTracks();
    context.read<Presets>().loadPresets();
    context.read<DefaultTimer>().getSavedData();
    Future.delayed(Duration(seconds: 4), () {
      context.read<CustomizeTimer>().changeTiming(context.read<DefaultTimer>().getTiming);
    });
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: persistentFooterButtons(context),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(index, duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
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
      body: Container(
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
        child: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: widget._screens,
          ),
        ),
      ),
    );
  }
}
