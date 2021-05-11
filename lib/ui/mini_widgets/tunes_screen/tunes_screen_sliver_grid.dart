import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/app_logic/providers/tunes.dart';
import 'package:sleep_app/app_logic/models/tune.dart';
import 'package:sleep_app/ui/screens/player_screen.dart';
import 'package:sleep_app/app_logic/providers/default_timer.dart';

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
                MaterialPageRoute(
                  builder: (context) => PlayerScreen(
                    tune: tunesList[index],
                    timing: context.watch<DefaultTimer>().getTiming,
                  ),
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
