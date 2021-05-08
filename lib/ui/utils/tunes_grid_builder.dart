import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/models/tune.dart';
import 'package:sleep_app/ui/screens/player_screen.dart';

Widget tunesGridBuilder(BuildContext context, int index, Set<Tune> tunesSet) {
  if (tunesSet.isNotEmpty) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayerScreen(tune: tunesSet.elementAt(index)),
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
                image: AssetImage(tunesSet.elementAt(index).imagePath),
                alignment: Alignment.topCenter,
                fit: BoxFit.fill,
                isAntiAlias: true,
              ),
            ),
          ),
          Positioned.directional(
            textDirection: TextDirection.ltr,
            child: Text(
              tunesSet.elementAt(index).name,
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
}
