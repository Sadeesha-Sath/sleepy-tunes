import 'package:flutter/material.dart';
import 'package:sleepy_tunes/app_logic/models/preset.dart';
import 'package:sleepy_tunes/app_logic/logic_handelers/file_handler.dart';
import 'package:sleepy_tunes/app_logic/models/track.dart';

class Presets with ChangeNotifier {
  Set<Preset> _presetSet = {};

  void loadPresets() async {
    var rawPresetData = await readPresets();
    if (rawPresetData != []) {
      for (var preset in rawPresetData) {
        List<Track> trackList = [];
        var trackListData = preset['trackList'];
        for (Map<String, dynamic> track in trackListData) {
          Track newTrack = Track(
              trackImagePath: track['trackImagePath'],
              trackName: track['trackName'],
              trackPath: track['trackPath'],
              volume: track['volume']);
          trackList.add(newTrack);
        }
        Preset newPreset = Preset(
          name: preset['name'],
          timing: preset['timing'],
          trackList: trackList,
        );
        _presetSet.add(newPreset);
      }
      notifyListeners();
    }
  }

  Set<Preset> get getPresets => _presetSet;

  void deletePreset(List<int> indexList) {
    // This sorts the indexList to a descending order so that the removing of previous index won't affect the next indexes
    indexList.sort();
    for (int index in indexList.reversed) {
      _presetSet.remove(_presetSet.elementAt(index));
    }
    notifyListeners();
    writePresets(_presetSet.toList());
  }

  void deleteAll() {
    _presetSet = {};
    writePresets([]);
    notifyListeners();
  }

  void addPreset(Preset preset) {
    _presetSet.add(preset);
    notifyListeners();
    writePresets(_presetSet.toList());
  }
}
