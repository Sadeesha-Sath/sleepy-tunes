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
