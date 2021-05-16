import 'package:flutter/material.dart';
import 'package:sleepy_tunes/app_logic/providers/customize_timer.dart';
import 'package:sleepy_tunes/app_logic/providers/selected_tracks.dart';
import 'package:sleepy_tunes/ui/screens/player_screen.dart';
import 'package:sleepy_tunes/ui/ui_constants.dart';
import 'package:sleepy_tunes/ui/utils/custom_sliver_appbar.dart';
import 'package:sleepy_tunes/ui/utils/save_preset_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:sleepy_tunes/ui/mini_widgets/finish_customize_screen/track_list.dart';
import 'package:sleepy_tunes/ui/utils/custom_icon_button.dart';
import 'package:sleepy_tunes/ui/custom_methods/build_custom_show_bottom_sheet.dart';

class FinishCustomizationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var length = context.watch<SelectedTracks>().getTrackSet.length;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                CustomSliverAppBar(title: "Some Finishing Touches 😉"),
                TrackList(),
              ],
            ),
            Positioned(
              bottom: 19,
              left: 20,
              child: CustomIconButton(
                iconSize: 31.5,
                icon: Icon(Icons.save),
                color: Colors.lightBlueAccent.shade400,
                onPressed: length != 0
                    ? () {
                        buildCustomShowModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => SavePresetBottomSheet(),
                        );
                      }
                    : null,
              ),
            ),
            Positioned(
              bottom: 22,
              right: 20,
              child: CustomIconButton(
                color: kBackgroundColor,
                backgroundColor: Colors.lightBlueAccent.shade700.withOpacity(0.95),
                icon: Icon(Icons.arrow_forward_ios_rounded),
                iconSize: 27.5,
                onPressed: length != 0
                    ? () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) => PlayerScreen(
                              timing: context.watch<CustomizeTimer>().getTiming,
                              tracks: context.watch<SelectedTracks>().getTrackSet,
                            ),
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
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
