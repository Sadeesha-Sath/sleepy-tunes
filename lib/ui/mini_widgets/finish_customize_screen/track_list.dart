import 'package:flutter/material.dart';
import 'package:sleepy_tunes/app_logic/audio_players/simple_player.dart';
import 'package:sleepy_tunes/app_logic/models/track.dart';
import 'package:sleepy_tunes/app_logic/providers/selected_tracks.dart';
import 'package:sleepy_tunes/app_logic/providers/volume.dart';
import 'package:sleepy_tunes/ui/utils/track_card.dart';
import 'package:sleepy_tunes/ui/mini_widgets/finish_customize_screen/timer_card.dart';
import 'package:provider/provider.dart';

class TrackList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Set<Track> selectedTracks = context.watch<SelectedTracks>().getTrackSet;
    var volume = context.watch<Volume>().getVolume;
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          // This generates track cards on demand
          ...List.generate(
            selectedTracks.length,
            (index) => TrackCard(selectedTracks.elementAt(index), onChanged: (double value) {
              // Updates the track set
              context.read<SelectedTracks>().changeVolume(index, value);
              // Updates the player in real time
              context.read<SimplePlayer>().setVolumeonOne(
                    index,
                    value,
                    volume,
                  );
            }),
          ),
          TimerCard(),
        ],
      ),
    );
  }
}
