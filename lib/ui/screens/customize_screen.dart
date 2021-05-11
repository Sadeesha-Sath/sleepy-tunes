import 'package:flutter/material.dart';
import 'package:sleep_app/ui/mini_widgets/customize_screen/customize_screen_fab.dart';
import 'package:sleep_app/ui/mini_widgets/customize_screen/customize_screen_action.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:sleep_app/ui/utils/custom_sliver_appbar.dart';
import 'package:sleep_app/ui/mini_widgets/customize_screen/customize_tab_bar.dart';
import 'package:sleep_app/ui/mini_widgets/customize_screen/customize_screen_sliver_grid.dart';

class CustomizeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      color: kBackgroundColor,
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              CustomSliverAppBar(
                title: "Customize Tracks",
                expandedHeight: 110,
                actions: [
                  CustomizeScreenAction(),
                ],
              ),
              CustomizeTabBar(),
              CustomizeScreenSliverGrid()
            ],
          ),
          CustomizeScreenFAB(),
        ],
      ),
    );
  }
}
