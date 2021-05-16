import 'package:flutter/material.dart';
import 'package:sleepy_tunes/app_logic/models/track.dart';
import 'package:sleepy_tunes/app_logic/providers/selected_tracks.dart';
import 'package:sleepy_tunes/ui/ui_constants.dart';
import 'package:provider/provider.dart';

class TrackCard extends StatelessWidget {
  final Track _track;
  final onChanged;

  TrackCard(
    this._track, {
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        context.read<SelectedTracks>().removeTrack(_track);
      },
      child: Card(
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
                  image: NetworkImage("https://www.astronomy.cafe/media/posts/16/responsive/solsticeflare-xxxl.jpg"),
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
                    _track.trackName,
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
                        value: _track.volume,
                        onChanged: onChanged,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
