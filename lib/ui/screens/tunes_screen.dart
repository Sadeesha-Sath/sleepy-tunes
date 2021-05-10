import 'package:flutter/material.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:sleep_app/ui/utils/tunes_grid_builder.dart';
import 'package:sleep_app/app_logic/models/tune.dart';
import 'package:sleep_app/app_logic/providers/tunes.dart';
import 'package:provider/provider.dart';

class TunesScreen extends StatefulWidget {
  @override
  _TunesScreenState createState() => _TunesScreenState();
}

class _TunesScreenState extends State<TunesScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Tune> tunesList = context.watch<Tunes>().getTunes;
    final ScrollController _scrollController = ScrollController();
    return Container(
      padding: EdgeInsets.only(top: 10, left: 8, right: 8),
      color: kBackgroundColor,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            floating: true,
            title: Text("Sleepy Tunes"),
            centerTitle: true,
            elevation: 1,
            expandedHeight: 120,
            shadowColor: kBackgroundColor,
            backgroundColor: Colors.transparent,
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // maxCrossAxisExtent: 300,
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              childAspectRatio: 1.05,
            ),
            delegate: SliverChildBuilderDelegate((context, index) => tunesGridBuilder(context, index, tunesList),
                childCount: tunesList.length),
          )
        ],
      ),
    );
  }
}
