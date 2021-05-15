import 'package:just_audio/just_audio.dart';
import 'package:sleep_app/app_logic/models/track.dart';
import 'package:sleep_app/app_logic/models/tune.dart';
import 'dart:async';

class SimplePlayer {
  // Duration? timer;
  // List<int> timing;
  late bool _isTune;
  Tune? _tune;
  Set<Track>? _tracks;
  late AudioPlayer _player;
  List<AudioPlayer> _playerList = [];
  bool _isTracksPlaying = false;
  // var _stopWatch = Stopwatch();

  // SimplePlayer({required this.timing});

  void loadData({required bool isTune, Tune? tune, Set<Track>? tracks}) async {
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
    } else {
      assert(_tracks != null && _tracks!.isNotEmpty);
      for (Track track in _tracks!) {
        var player = AudioPlayer();
        await player.setLoopMode(LoopMode.one);
        player.setVolume(track.volume);
        await player.setAsset(track.trackPath);
        _playerList.add(player);
      }
      for (var player in _playerList) {
        if (player == _playerList.last)
          await player.play();
        else
          player.play();
      }
      _isTracksPlaying = true;
    }
  }

  Future onPause() async {
    if (_isTune) {
      await _player.pause();
    } else {
      for (var player in _playerList) {
        if (player == _playerList.last)
          await player.pause();
        else
          player.pause();
        // await player.pause();
      }
      _isTracksPlaying = false;
    }
    // _stopWatch.stop();
  }

  Future onResume() async {
    if (_isTune) {
      await _player.play();
      // _stopWatch.start();
    } else {
      for (var player in _playerList) {
        if (player == _playerList.last)
          await player.play();
        else
          player.play();
      }
      _isTracksPlaying = true;
    }
  }

  Future setVolume(volume) async {
    if (_isTune)
      await _player.setVolume(volume);
    else {
      for (var player in _playerList) {
        if (player == _playerList.last)
          await player.setVolume(volume * _tracks!.elementAt(_playerList.indexOf(player)).volume);
        else
          player.setVolume(volume * _tracks!.elementAt(_playerList.indexOf(player)).volume);
        // await player.setVolume(volume * player.volume);
      }
    }
  }

  Future setVolumeonOne(int index, double value, double universalVolume) async {
    try {
      if (_playerList.isNotEmpty) _playerList[index].setVolume(value * universalVolume);
    } catch (e) {
      print(e);
    }
  }

  Future setSpeed(speed) async {
    if (_isTune)
      await _player.setSpeed(speed);
    else {
      for (var player in _playerList) {
        if (player == _playerList.last)
          await player.setSpeed(speed);
        else
          player.setSpeed(speed);
        await player.setSpeed(speed);
      }
    }
  }

// TODO find out the issue in dispose method
  Future dispose() async {
    if (_isTune) {
      await _player.dispose();
    } else {
      for (var player in _playerList) {
        if (player == _playerList.last)
          await player.dispose();
        else
          player.dispose();

        // await player.dispose();
      }
      _isTracksPlaying = false;
    }
  }

  bool get isPlaying {
    if (_isTune) return _player.playing;
    return _isTracksPlaying;
  }

  bool get isTune => _isTune;

  Tune get currentTune => _tune!;

  Set<Track> get currentTracks => _tracks!;

  // void Function(Timer) isTimerExceeded() {
  //   return (Timer tim) {
  //     if (_stopWatch.elapsed >= timer!) {
  //       dispose();
  //     }
  //   };
  // }
}
// TODO Find a way to implement the timer
