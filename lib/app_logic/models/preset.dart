import 'package:sleepy_tunes/app_logic/models/track.dart';

class Preset {
  String name;
  List<Track> trackList;
  List timing;

  Preset({required this.name, required this.timing, required this.trackList});

  Map exportPreset() {
    return {
      "name": name,
      "timing": timing,
      "trackList": trackList.map((e) => e.exportTracks()).toList(),
    };
  }
}
