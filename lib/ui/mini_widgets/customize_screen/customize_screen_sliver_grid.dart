import 'package:flutter/material.dart';

class CustomizeScreenSliverGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 0.85,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Stack(
            children: [
              Card(
                color: Colors.grey.shade900,
                elevation: 2,
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 60),
                shape: CircleBorder(),
                child: Container(),
              ),
              Positioned(
                child: Text(
                  "Beach",
                  textAlign: TextAlign.center,
                ),
                bottom: 30,
                // start: 30,
                width: 140,
              )
            ],
            clipBehavior: Clip.none,
          );
        },
        childCount: 20,
      ),
    );
  }
}