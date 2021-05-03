import 'package:flutter/material.dart';
import 'package:sleep_app/ui/ui_constants.dart';

class TrackCard extends StatelessWidget {
  final double _volume;
  final onPressed;

  TrackCard(this._volume, {required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      elevation: 3,
      color: Colors.grey.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://www.astronomy.cafe/media/posts/16/responsive/solsticeflare-xxxl.jpg"),
                alignment: Alignment.centerLeft,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SoundTrack Name",
                  style: TextStyle(color: kPrimaryColor),
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.volume_up_rounded,
                      color: kPrimaryColor,
                    ),
                    Slider.adaptive(
                      value: _volume,
                      onChanged: onPressed,
                    ),
                  ],
                )
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
