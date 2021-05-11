import 'package:just_audio/just_audio.dart';
import 'package:sleep_app/app_logic/models/track.dart';
import 'package:sleep_app/app_logic/models/tune.dart';
import 'dart:async';

class SimplePlayer {
  // Duration? timer;
  // List<int> timing;
  late bool _isTune;
  Tune? _tune;
  List<Track>? _tracks;
  late AudioPlayer _player;
  List<AudioPlayer> _playerList = [];
  // var _stopWatch = Stopwatch();

  // SimplePlayer({required this.timing});

  void loadData({required bool isTune, Tune? tune, List<Track>? tracks}) async {
    this._isTune = isTune;
    this._tune = tune;
    this._tracks = tracks;
  }

  Future onStart() async {
    // timer = Duration(hours: timing[0], minutes: timing[1]);
    if (_isTune) {
      assert(_tune != null);
      _player = AudioPlayer();
      _player.setLoopMode(LoopMode.one);
      await _player.setAsset(_tune!.audioPath);
      await _player.play();
      // _stopWatch.start();
    }
  }

  Future onPause() async {
    if (_isTune) {
      await _player.pause();
    }
    // _stopWatch.stop();
  }

  Future onResume() async {
    if (_isTune) {
      await _player.play();
      // _stopWatch.start();
    }
  }

  Future setVolume(volume) async {
    if (_isTune) await _player.setVolume(volume);
  }

  Future setSpeed(speed) async {
    if (_isTune) await _player.setSpeed(speed);
  }

  Future dispose() async {
    if (_isTune) {
      // _stopWatch.stop();
      // _stopWatch.reset();
      // await _player.stop();
      await _player.dispose();
    }
  }

  bool get isPlaying => _player.playing;

  bool get isTune => _isTune;

  Tune get currentTune => _tune!;

  // void Function(Timer) isTimerExceeded() {
  //   return (Timer tim) {
  //     if (_stopWatch.elapsed >= timer!) {
  //       dispose();
  //     }
  //   };
  // }
}
// TODO Find a way to implement the timer
