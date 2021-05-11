import 'package:flutter/material.dart';
import 'package:sleep_app/ui/utils/custom_sliver_appbar.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:sleep_app/ui/mini_widgets/settings_screen/settings_sliver_list.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      color: kBackgroundColor,
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
              "Copyright",
              textAlign: TextAlign.center,
              style: TextStyle(color: kSecondaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
