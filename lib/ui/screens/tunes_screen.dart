import 'package:flutter/material.dart';
import 'package:sleepy_tunes/ui/utils/custom_sliver_appbar.dart';
import 'package:sleepy_tunes/ui/mini_widgets/tunes_screen/tunes_screen_sliver_grid.dart';

class TunesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 8, right: 8),
      child: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            title: "Sleepy Tunes",
            expandedHeight: 120,
          ),
          TunesScreenSliverGrid()
        ],
      ),
    );
  }
}
