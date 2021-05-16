import 'package:flutter/material.dart';
import 'package:sleepy_tunes/app_logic/models/tune.dart';

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
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            tune != null ? tune!.imagePath : 'assets/placeholder.jpg',
          ),
        ),
      ),
      margin: EdgeInsets.only(bottom: 12),
      width: 225,
      height: 240,
    );
  }
}
