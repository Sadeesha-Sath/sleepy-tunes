import 'package:flutter/material.dart';
import 'package:sleep_app/ui/ui_constants.dart';

class CustomizeScreen extends StatefulWidget {
  @override
  _CustomizeScreenState createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Stack(children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              title: Text("Customize"),
              centerTitle: true,
              elevation: 1,
              shadowColor: kBackgroundColor,
              backgroundColor: Colors.transparent,
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.87,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Card(
                        color: Colors.grey.shade900,
                        elevation: 2,
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsets.only(left: 15, right: 15, top: 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(),
                        // child: Image(
                        //   image: NetworkImage(
                        //       "https://images.unsplash.com/photo-1517148265373-cc0df208f9ac?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
                        //   alignment: Alignment.topCenter,
                        //   fit: BoxFit.fill,
                        //   isAntiAlias: true,
                        // ),
                      ),
                      Positioned.directional(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          "Beach",
                          textAlign: TextAlign.center,
                        ),
                        bottom: -25,
                        // start: 30,
                        width: 140,
                      )
                    ],
                    clipBehavior: Clip.none,
                  );
                },
                childCount: 20,
              ),
            )
          ],
        ),
        Positioned(
          child: FloatingActionButton(
            child: Center(child: Icon(Icons.send)),
            shape: CircleBorder(),
            onPressed: () {},
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey.shade800,
            // backgroundColor: Color(0xFF141414),
          ),
          right: 30,
          bottom: 30,
        ),
      ]),
    );
  }
}
