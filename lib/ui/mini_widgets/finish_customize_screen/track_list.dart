import 'package:flutter/material.dart';
import 'package:sleep_app/ui/utils/track_card.dart';
import 'package:sleep_app/ui/mini_widgets/finish_customize_screen/timer_card.dart';

class TrackList extends StatefulWidget {
  @override
  _TrackListState createState() => _TrackListState();
}

class _TrackListState extends State<TrackList> {
  double _volumeValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          TrackCard(
            _volumeValue,
            onPressed: (value) {
              setState(() {
                _volumeValue = value;
              });
            },
          ),
          TrackCard(
            _volumeValue,
            onPressed: (value) {
              setState(() {
                _volumeValue = value;
              });
            },
          ),
          TrackCard(
            _volumeValue,
            onPressed: (value) {
              setState(() {
                _volumeValue = value;
              });
            },
          ),
          TrackCard(
            _volumeValue,
            onPressed: (value) {
              setState(() {
                _volumeValue = value;
              });
            },
          ),
          TrackCard(
            _volumeValue,
            onPressed: (value) {
              setState(() {
                _volumeValue = value;
              });
            },
          ),
          TrackCard(
            _volumeValue,
            onPressed: (value) {
              setState(() {
                _volumeValue = value;
              });
            },
          ),
          TimerCard(),
        ],
      ),
    );
  }
}