import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleepy_tunes/app_logic/providers/tunes.dart';
import 'package:sleepy_tunes/app_logic/models/tune.dart';
import 'package:sleepy_tunes/ui/screens/player_screen.dart';
import 'package:sleepy_tunes/app_logic/providers/default_timer.dart';

class TunesScreenSliverGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Tune> tunesList = context.watch<Tunes>().getTunes;
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        childAspectRatio: 1.05,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        if (tunesList.isNotEmpty) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => PlayerScreen(
                    tune: tunesList[index],
                    timing: context.watch<DefaultTimer>().getTiming,
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
            },
            child: Stack(
              children: [
                Container(
                  width: 200,
                  height: 130,
                  child: Card(
                    color: Colors.grey.shade900,
                    elevation: 2,
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Image(
                      image: AssetImage(tunesList[index].imagePath),
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fill,
                      isAntiAlias: true,
                    ),
                  ),
                ),
                Positioned(
                  child: Text(
                    tunesList[index].name,
                    textAlign: TextAlign.center,
                  ),
                  bottom: 38,
                  // start: 30,
                  width: 200,
                )
              ],
            ),
          );
        }
        return CircularProgressIndicator();
      }, childCount: tunesList.length),
    );
  }
}
