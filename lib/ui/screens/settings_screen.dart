import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:sleepy_tunes/ui/utils/custom_sliver_appbar.dart';
import 'package:sleepy_tunes/ui/ui_constants.dart';
import 'package:sleepy_tunes/ui/mini_widgets/settings_screen/settings_sliver_list.dart';

class SettingsScreen extends StatelessWidget {
  final year = Clock().now().year;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              CustomSliverAppBar(
                title: "Settings",
                expandedHeight: 110,
              ),
              SettingsSliverList(),
            ],
          ),
          Positioned(
            left: 150,
            right: 150,
            bottom: 10,
            child: Text(
              "© Sleepy Tunes $year",
              textAlign: TextAlign.center,
              style: TextStyle(color: kSecondaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
