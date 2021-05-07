import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/models/tune.dart';
import 'package:sleep_app/ui/ui_constants.dart';

class PlayerScreen extends StatefulWidget {
  final Tune? tune;
  final List<Tune?>? tracks;

  PlayerScreen({this.tune, this.tracks});

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("Good Night!"),
      ),
      backgroundColor: kBackgroundColor,
      body: Container(
        padding: EdgeInsets.only(top: 30),
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  image: widget.tune != null
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            widget.tune!.imagePath,
                          ),
                        )
                        // TODO Add a placeholder image
                      : null),
              margin: EdgeInsets.only(bottom: 25),
              width: 200,
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 5),
                Material(
                  color: kBackgroundColor,
                  shadowColor: kBackgroundColor,
                  clipBehavior: Clip.antiAlias,
                  elevation: 2,
                  child: IconButton(
                    icon: Icon(Icons.volume_up),
                    onPressed: () {},
                  ),
                  shape: CircleBorder(
                    side: BorderSide(color: kSecondaryColor),
                  ),
                ),
                Spacer(),
                Material(
                  color: kBackgroundColor,
                  shadowColor: kBackgroundColor,
                  clipBehavior: Clip.antiAlias,
                  elevation: 5,
                  child: IconButton(
                    padding: EdgeInsets.all(15),
                    iconSize: 33,
                    icon: Icon(Icons.pause),
                    onPressed: () {},
                  ),
                  shape: CircleBorder(
                    side: BorderSide(color: kSecondaryColor),
                  ),
                ),
                Spacer(),
                Material(
                  color: kBackgroundColor,
                  shadowColor: kBackgroundColor,
                  clipBehavior: Clip.antiAlias,
                  elevation: 2,
                  child: IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {},
                  ),
                  shape: CircleBorder(
                    side: BorderSide(color: kSecondaryColor),
                  ),
                ),
                Spacer(flex: 5),
              ],
            )
          ],
        ),
      ),
    );
  }
}
