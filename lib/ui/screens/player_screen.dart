import 'package:flutter/material.dart';
import 'package:sleepy_tunes/app_logic/audio_players/simple_player.dart';
import 'package:sleepy_tunes/app_logic/models/track.dart';
import 'package:sleepy_tunes/app_logic/models/tune.dart';
import 'package:sleepy_tunes/app_logic/providers/bottom_appbar_data.dart';
import 'package:sleepy_tunes/app_logic/providers/selected_tracks.dart';
import 'package:sleepy_tunes/ui/mini_widgets/player_screen/player_controls_row.dart';
import 'package:sleepy_tunes/ui/ui_constants.dart';
import 'package:provider/provider.dart';
import 'package:sleepy_tunes/ui/mini_widgets/player_screen/player_screen_image.dart';

class PlayerScreen extends StatelessWidget {
  Tune? tune;
  Set<Track>? tracks;
  final List<int>? timing;
  final bool isFromBottomBar;
  late final BottomAppBarData _bottomAppBarData;
  late final SimplePlayer _simplePlayer;

  PlayerScreen({this.tune, this.tracks, this.timing, this.isFromBottomBar = false});

  @override
  Widget build(BuildContext context) {
    bool _isPlaying = true;
    _bottomAppBarData = context.read<BottomAppBarData>();
    _simplePlayer = context.read<SimplePlayer>();
    _isPlaying = playerInitialization(_isPlaying);

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
            PlayerScreenImage(tune: tune),
            Text(
              tune != null
                  ? tune!.name
                  : tracks != null
                      ? context.watch<SelectedTracks>().getPresetName ??
                          "${tracks!.first.trackName} & ${tracks!.length - 1} others"
                      : "PlaceHolder",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 25,
            ),
            PlayerControlsRow(
              simplePlayer: _simplePlayer,
              isPlaying: _isPlaying,
              bottomAppBarData: _bottomAppBarData,
            ),
          ],
        ),
      ),
    );
  }

  bool playerInitialization(bool _isPlaying) {
    if (!isFromBottomBar) {
      if (tune != null) {
        assert(tracks == null);
        try {
          // If a tune is passed
          if (_simplePlayer.isTune) {
            // If previous instance was a tune
            if (tune != _simplePlayer.currentTune) {
              // If new instance is different from past instance
              tryToDispose();
              // Load new data
              loadNewTuneData();
            } else {
              // The same tune is selected, no reloading will happen
              _isPlaying = _simplePlayer.isPlaying;
            }
          } else {
            // If previous instance was a track, dispose and reallocate data
            tryToDispose();
            loadNewTuneData();
          }
          // If it is the first run (no instance currently in simple player)
        } catch (e) {
          print(e);
          loadNewTuneData();
        }
        // If tracks are passed
      } else {
        assert(tracks != null);
        assert(tune == null);
        try {
          tryToDispose();
          loadNewTrackData();
          // If it is the first run (no instance currently in simple player)
        } catch (e) {
          print(e);
          loadNewTrackData();
        }
      }
    } else {
      // If brought by the bottom bar (no reloading)

      _isPlaying = _simplePlayer.isPlaying;
      if (_simplePlayer.isTune)
        tune = _simplePlayer.currentTune;
      else
        tracks = _simplePlayer.currentTracks;
    }
    return _isPlaying;
  }

  void loadNewTrackData() {
    _simplePlayer.loadData(isTune: false, tracks: tracks, timing: timing!, bottomAppBarData: _bottomAppBarData);
    _simplePlayer.onStart();
    Future.delayed(
      Duration.zero,
      () async {
        _bottomAppBarData.changeData("${tracks!.first.trackName} & ${tracks!.length - 1} others", null);
      },
    );
    Future.delayed(Duration.zero, () async {
      _bottomAppBarData.changePlayingState(true);
    });
  }

  void loadNewTuneData() {
    _simplePlayer.loadData(isTune: true, tune: tune, timing: timing!, bottomAppBarData: _bottomAppBarData);
    _simplePlayer.onStart();
    Future.delayed(Duration.zero, () async {
      _bottomAppBarData.changeData(tune!.name, tune!.imagePath);
    });
    Future.delayed(Duration.zero, () async {
      _bottomAppBarData.changePlayingState(true);
    });
  }

  void tryToDispose() {
    try {
      _simplePlayer.dispose();
    } catch (e) {
      print(e);
    }
  }
}
