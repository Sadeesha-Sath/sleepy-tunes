import 'package:flutter/material.dart';
import 'package:sleepy_tunes/app_logic/models/preset.dart';
import 'package:sleepy_tunes/app_logic/providers/customize_timer.dart';
import 'package:sleepy_tunes/app_logic/providers/presets.dart';
import 'package:sleepy_tunes/app_logic/providers/selected_tracks.dart';
import 'package:sleepy_tunes/ui/screens/finish_customization_screen.dart';
import 'package:sleepy_tunes/ui/screens/player_screen.dart';
import 'package:sleepy_tunes/ui/ui_constants.dart';
import 'package:sleepy_tunes/ui/utils/custom_sliver_appbar.dart';
import 'package:provider/provider.dart';

class PresetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Set<Preset> presetSet = context.watch<Presets>().getPresets;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 22),
        child: CustomScrollView(
          slivers: [
            CustomSliverAppBar(title: "Saved Presets"),
            presetSet.length != 0
                ? SliverList(
                    delegate: SliverChildListDelegate(
                      presetSet.map(
                        (e) {
                          return Card(
                            clipBehavior: Clip.hardEdge,
                            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 22),
                            elevation: 4,
                            color: Colors.grey.shade800.withAlpha(130),
                            // shadowColor: Colors.grey.shade800.withAlpha(200),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                              onLongPress: () {
                                context.read<SelectedTracks>().setTracks(e.trackList.toSet());
                                context.read<CustomizeTimer>().changeTiming(e.timing.cast<int>());
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation1, animation2) => FinishCustomizationScreen(),
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      var begin = Offset(1.0, 0.0);
                                      var end = Offset.zero;
                                      var curve = Curves.easeInOut;

                                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                      return SlideTransition(
                                        position: animation.drive(tween),
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation1, animation2) =>
                                        PlayerScreen(timing: e.timing.cast<int>(), tracks: e.trackList.toSet()),
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      var begin = Offset(0.0, 1.0);
                                      var end = Offset.zero;
                                      var curve = Curves.easeInOut;

                                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                      return SlideTransition(
                                        position: animation.drive(tween),
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                height: 110,
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Text(
                                            e.name,
                                            style: TextStyle(
                                                fontSize: 20, color: kPrimaryColor, fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              "${e.trackList.length} Tracks",
                                              style: TextStyle(color: kPrimaryColor, fontSize: 16),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            child: Text(
                                              "${e.timing[0]} Hours : ${e.timing[1]} Minutes",
                                              style: TextStyle(color: kPrimaryColor, fontSize: 16),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  )
                : SliverFillRemaining(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Text(
                          "Save some Presets to get started!!",
                          style: TextStyle(fontSize: 21),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
