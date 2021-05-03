import 'package:flutter/cupertino.dart';
import 'package:sleep_app/app_logic/models/preset.dart';
import 'package:sleep_app/app_logic/logic_handelers/file_handler.dart';

class Presets with ChangeNotifier {
  List<Preset> _presetList = [];

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
            trackList: trackList,);
        _presetList.add(newPreset);
      }
      notifyListeners();
    }
  }

  List<Preset> get getPresets => _presetList;

  void deletePreset(List<int> indexList) {
    // This sorts the indexList to a descending order so that the removing of previous index won't affect the next indexes
    indexList
      ..sort()
      ..reversed;
    for (int index in indexList) {
      _presetList.removeAt(index);
    }
    notifyListeners();
    writePresets(_presetList);
  }

  void deleteAll() {
    _presetList = [];
    writePresets([]);
    notifyListeners();
  }

  void addPreset(Preset preset) {
    _presetList.add(preset);
    notifyListeners();
    writePresets(_presetList);
  }
}
