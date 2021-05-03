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

class Track {
  String trackName;
  String trackPath;
  String trackImagePath;
  double volume;

  Track(
      {required this.trackImagePath,
      required this.trackName,
      required this.trackPath,
      required this.volume});

  Map<String, Object> exportTracks() {
    return {
      "trackName": trackName,
      "trackImagePath": trackImagePath,
      "trackPath": trackPath,
      "volume": volume
    };
  }
}
