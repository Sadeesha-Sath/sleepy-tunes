import 'package:flutter/material.dart';
import 'package:sleep_app/ui/ui_constants.dart';

class TunesScreen extends StatefulWidget {
  @override
  _TunesScreenState createState() => _TunesScreenState();
}

class _TunesScreenState extends State<TunesScreen> {
  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    return Container(
      padding: EdgeInsets.only(top: 10),
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
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 1.1,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Stack(children: [
                  Card(
                    color: Colors.grey.shade900,
                    elevation: 2,
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1517148265373-cc0df208f9ac?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fill,
                      isAntiAlias: true,
                    ),
                  ),
                  Positioned.directional(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      "Beach",
                      textAlign: TextAlign.center,
                    ),
                    bottom: 45,
                    // start: 30,
                    width: 200,
                  )
                ]);
              },
              childCount: 20,
            ),
          )
        ],
      ),
    );
  }
}
