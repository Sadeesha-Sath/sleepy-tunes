import 'package:sleep_app/app_logic/logic_handelers/rootbundle_handeler.dart';
import 'package:sleep_app/app_logic/models/track.dart';
import 'package:flutter/material.dart';

class Tracks with ChangeNotifier {
  late List<Track> _activeTrackList;
  List<Track> _scifiTracks = [];
  List<Track> _waterTracks = [];
  List<Track> _naturalTracks = [];
  List<Track> _lifestyleTracks = [];
  List<Track> _brainWaveTracks = [];


  void loadTracks() async {
    var jsonString = await loadTracksdata();
    for (var track in jsonString) {
      var newTrack =
          Track(trackImagePath: track['title'], trackName: track['title'], trackPath: track['audio_path'], volume: 0.8);
      if (track['category'] == "nature")
        _naturalTracks.add(newTrack);
      else if (track['category'] == "water")
        _waterTracks.add(newTrack);
      else if (track['category'] == "sci-fi")
        _scifiTracks.add(newTrack);
      else if (track['category'] == "lifestyle")
        _lifestyleTracks.add(newTrack);
      else
        _brainWaveTracks.add(newTrack);
    }
    _activeTrackList = _naturalTracks;
    notifyListeners();
  }

  // Using int as opposed to string as it is less error prune and faster to compare
  void changeActiveTab(int response) {
    assert(response == 0 || response == 1 || response == 2 || response == 3 || response == 4);
    if (response == 0)
      _activeTrackList = _naturalTracks;
    else if (response == 1)
      _activeTrackList = _waterTracks;
    else if (response == 2)
      _activeTrackList = _scifiTracks;
    else if (response == 3)
      _activeTrackList = _lifestyleTracks;
    else if (response == 4) _activeTrackList = _brainWaveTracks;
    notifyListeners();
  }

  List<Track> get getActiveTrackList => _activeTrackList;
}

