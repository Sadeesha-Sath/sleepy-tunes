import 'package:flutter/material.dart';
import 'package:sleepy_tunes/app_logic/models/track.dart';

class SelectedTracks extends ChangeNotifier {
  Set<Track> _trackSet = {};
  String? _presetName;

  void addTrack(Track track) {
    _trackSet.add(track);
    notifyListeners();
  }

  void changePresetName(String name) {
    _presetName = name;
    notifyListeners();
  }

  void removeTrack(Track track) {
    _trackSet.remove(track);
    notifyListeners();
  }

  void setTracks(Set<Track> tracks) {
    _trackSet = tracks;
    notifyListeners();
  }

  void clearTracks() {
    _trackSet = {};
    notifyListeners();
  }

  void toggleAddTrack(Track track) {
    if (_trackSet.contains(track))
      removeTrack(track);
    else
      addTrack(track);
  }

  void changeVolume(int index, double value) {
    _trackSet.elementAt(index).volume = value;
    notifyListeners();
  }

  Set<Track> get getTrackSet => _trackSet;
  String? get getPresetName => _presetName;
}
