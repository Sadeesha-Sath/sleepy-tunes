import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/audio_players/simple_player.dart';
import 'package:sleep_app/app_logic/models/tune.dart';
import 'package:sleep_app/app_logic/providers/bottom_appbar_data.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:sleep_app/ui/utils/volume_bottom_sheet.dart';
import 'package:sleep_app/ui/utils/settings_bottom_sheet.dart';
import 'package:provider/provider.dart';

class PlayerScreen extends StatefulWidget {
  final Tune? tune;
  final List<Tune?>? tracks;
  final List<int> timing;

  PlayerScreen({this.tune, this.tracks, required this.timing});

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}
// TODO Find WTF is going on with this audio player, maybe, try using the audio player first and then add the background service

class _PlayerScreenState extends State<PlayerScreen> {
  bool _isPlaying = true;
  var bottomAppBarData;
  late SimplePlayer _simplePlayer;
  // late Timer timer;
  // @override
  // void initState() {
  //   startAudioTask();
  //   super.initState();
  // }

  // void startAudioTask() async {
  //   await AudioService.start(backgroundTaskEntrypoint: _entrypoint);
  // }

  // @override
  // void dispose() {
  // _simplePlayer.dispose();
  // timer.cancel();
  //   super.dispose();
  // }

  @override
  void initState() {
    bottomAppBarData = context.read<BottomAppBarData>();
    _simplePlayer = context.read<SimplePlayer>();
    if (widget.tune != null) {
      assert(widget.tracks == null);

      try {
        if (_simplePlayer.isTune) {
          if (widget.tune != _simplePlayer.currentTune) {
            try {
              _simplePlayer.dispose();
            } catch (e) {
              print(e);
            }
            _simplePlayer.loadData(isTune: true, tune: widget.tune);
            _simplePlayer.onStart();
          } else {
            _isPlaying = _simplePlayer.isPlaying;
          }
        }
      } catch (e) {
        print(e);
        _simplePlayer.loadData(isTune: true, tune: widget.tune);
        _simplePlayer.onStart();
      }

      // AudioPlayerTask().onStart({"isTune": true, "tune": widget.tune});

    } else {
      assert(widget.tracks != null);
      // AudioPlayerTask().onStart({"isTune": false, "tracks": widget.tracks});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tune != null) bottomAppBarData.changeData(widget.tune!.name, widget.tune!.imagePath);
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
                    : DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/placeholder.jpg'),
                      ),
              ),
              margin: EdgeInsets.only(bottom: 12),
              width: 225,
              height: 240,
            ),
            Text(
              widget.tune != null ? widget.tune!.name : "Hello",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 25,
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
                    onPressed: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
                          clipBehavior: Clip.antiAlias,
                          context: context,
                          builder: (context) => VolumeBottomSheet(_simplePlayer));
                    },
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
                    icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () {
                      _isPlaying ? _simplePlayer.onPause() : _simplePlayer.onResume();
                      setState(() {
                        _isPlaying = !_isPlaying;
                      });
                      bottomAppBarData.changePlayingState();
                    },
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
                    onPressed: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
                          clipBehavior: Clip.antiAlias,
                          context: context,
                          builder: (context) => SettingsBottomSheet(_simplePlayer));
                    },
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
