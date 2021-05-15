import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/audio_players/simple_player.dart';
import 'package:sleep_app/app_logic/models/track.dart';
import 'package:sleep_app/app_logic/models/tune.dart';
import 'package:sleep_app/app_logic/providers/bottom_appbar_data.dart';
import 'package:sleep_app/ui/mini_widgets/player_screen/player_controls_row.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/ui/mini_widgets/player_screen/player_screen_image.dart';

class PlayerScreen extends StatelessWidget {
  Tune? tune;
  Set<Track>? tracks;
  final List<dynamic>? timing;
  final bool isFromBottomBar;
  late final BottomAppBarData _bottomAppBarData;
  late final SimplePlayer _simplePlayer;

  PlayerScreen({this.tune, this.tracks, this.timing, this.isFromBottomBar = false});
  @override
  Widget build(BuildContext context) {
    bool _isPlaying = true;
    _bottomAppBarData = context.read<BottomAppBarData>();
    _simplePlayer = context.read<SimplePlayer>();
    if (!isFromBottomBar) {
      if (tune != null) {
        assert(tracks == null);
        try {
          // TODO Find a better way to do this
          if (_simplePlayer.isTune) {
            if (tune != _simplePlayer.currentTune) {
              try {
                _simplePlayer.dispose();
              } catch (e) {
                print(e);
              }
              _simplePlayer.loadData(isTune: true, tune: tune);
              _simplePlayer.onStart();
              Future.delayed(Duration.zero, () async {
                _bottomAppBarData.changeData(tune!.name, tune!.imagePath);
              });
              Future.delayed(Duration.zero, () async {
                _bottomAppBarData.changePlayingState(true);
              });
            } else {
              _isPlaying = _simplePlayer.isPlaying;
            }
          } else {
            try {
              _simplePlayer.dispose();
            } catch (e) {
              print(e);
            }
          }
        } catch (e) {
          print(e);
          _simplePlayer.loadData(isTune: true, tune: tune);
          _simplePlayer.onStart();
          Future.delayed(Duration.zero, () async {
            _bottomAppBarData.changeData(tune!.name, tune!.imagePath);
          });
          Future.delayed(Duration.zero, () async {
            _bottomAppBarData.changePlayingState(true);
          });
        }
      } else {
        assert(tracks != null);
        assert(tune == null);
        try {
          if (!_simplePlayer.isTune) {
            if (tracks != _simplePlayer.currentTracks) {
              try {
                _simplePlayer.dispose();
              } catch (e) {
                print(e);
              }
              _simplePlayer.loadData(isTune: false, tracks: tracks);
              _simplePlayer.onStart();
              Future.delayed(
                Duration.zero,
                () async {
                  _bottomAppBarData.changeData("${tracks!.first.trackName} & ${tracks!.length - 1} others");
                },
              );
              Future.delayed(Duration.zero, () async {
                _bottomAppBarData.changePlayingState(true);
              });
            }
          } else {
            try {
              _simplePlayer.dispose();
            } catch (e) {
              print(e);
            }
          }
        } catch (e) {
          print(e);
          _simplePlayer.loadData(isTune: false, tracks: tracks);
          _simplePlayer.onStart();
          Future.delayed(
            Duration.zero,
            () async {
              _bottomAppBarData.changeData("${tracks!.first.trackName} & ${tracks!.length - 1} others");
            },
          );
          Future.delayed(Duration.zero, () async {
            _bottomAppBarData.changePlayingState(true);
          });
        }
      }
    } else {
      _isPlaying = _simplePlayer.isPlaying;
      if (_simplePlayer.isTune)
        tune = _simplePlayer.currentTune;
      else
        tracks = _simplePlayer.currentTracks;
    }

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
                      ? "${tracks!.first.trackName} & ${tracks!.length - 1} others"
                      : "Preset 1",
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
}
