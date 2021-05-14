import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/models/track.dart';
import 'package:sleep_app/app_logic/providers/selected_tracks.dart';
import 'package:sleep_app/ui/utils/track_card.dart';
import 'package:sleep_app/ui/mini_widgets/finish_customize_screen/timer_card.dart';
import 'package:provider/provider.dart';

class TrackList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Set<Track> selectedTracks = context.watch<SelectedTracks>().getTrackSet;
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          ...List.generate(
            selectedTracks.length,
            (index) => TrackCard(selectedTracks.elementAt(index), onPressed: (double value) {
              context.read<SelectedTracks>().changeVolume(index, value);
            }),
          ),
          TimerCard(),
        ],
      ),
    );
  }
}
