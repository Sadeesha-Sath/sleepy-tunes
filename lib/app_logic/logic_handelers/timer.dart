import 'package:pausable_timer/pausable_timer.dart';
import 'package:sleepy_tunes/app_logic/audio_players/simple_player.dart';
import 'package:sleepy_tunes/app_logic/providers/bottom_appbar_data.dart';

class PlayerTimer {
  List<int> timerVal;
  SimplePlayer _simplePlayer;
  PausableTimer? _timer;
  BottomAppBarData _bottomAppBarData;

  static PlayerTimer? _cache;

  factory PlayerTimer(List<int> values, SimplePlayer simplePlayer, BottomAppBarData bottomAppBarData) {
    if (_cache == null) {
      // Make a new instance if no previous instance is present
      var _playerTimer =
          PlayerTimer._internal(simplePlayer: simplePlayer, timerVal: values, bottomAppBarData: bottomAppBarData);
      _playerTimer._timer =
          PausableTimer(Duration(hours: _playerTimer.timerVal[0], minutes: _playerTimer.timerVal[1]), () {
        _playerTimer._simplePlayer.dispose();
        _playerTimer._bottomAppBarData.changePlayingState(false);
        _playerTimer._bottomAppBarData.clearData();
      });
      _cache = _playerTimer;
      return _playerTimer;
    }
    // Return the previous instance if the timer values match
    if (_cache!.timerVal == values) return _cache!;
    // Cancel the previous timer and get rid of it alltogether and create a new timer to recieve callbacks
    _cache!.disposeTimer();
    var _playerTimer =
        PlayerTimer._internal(simplePlayer: simplePlayer, timerVal: values, bottomAppBarData: bottomAppBarData);
    _playerTimer._timer =
        PausableTimer(Duration(hours: _playerTimer.timerVal[0], minutes: _playerTimer.timerVal[1]), () {
      _playerTimer._simplePlayer.dispose();
      _playerTimer._bottomAppBarData.changePlayingState(false);
      _playerTimer._bottomAppBarData.clearData();
    });
    _cache = _playerTimer;
    return _playerTimer;
  }

  PlayerTimer._internal({required simplePlayer, required this.timerVal, required bottomAppBarData})
      : _simplePlayer = simplePlayer,
        _bottomAppBarData = bottomAppBarData;

  void startTimer() {
    if (_timer != null) {
      _timer!.start();
    }
  }

  void pauseTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.pause();
    }
  }

  void resetTimer() {
    if (_timer != null) {
      _timer!.pause();
      _timer!.reset();
    }
  }

  void disposeTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }
}
