import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/models/tune.dart';

class PlayerScreenImage extends StatelessWidget {
  const PlayerScreenImage({
    Key? key,
    this.tune,
  }) : super(key: key);

  final Tune? tune;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
        image: tune != null
            ? DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  tune!.imagePath,
                ),
              )
            : DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/placeholder.jpg'),
              ),
      ),
      margin: EdgeInsets.only(bottom: 12),
      width: 225,
      height: 240,
    );
  }
}
