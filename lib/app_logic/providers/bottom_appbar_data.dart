import 'package:flutter/material.dart';

class BottomAppBarData with ChangeNotifier {
  String? _title;
  String? _imagePath;
  bool _isPlaying = false;

  void changeData(String? title, String? imagePath) {
    if (title != null) _title = title;
    if (imagePath != null) _imagePath = imagePath;
  }

  void changePlayingState([bool? value]) {
    if (value != null)
      _isPlaying = value;
    else
      _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void clearData() {
    _title = null;
    _imagePath = null;
    notifyListeners();
  }

  void callNotifyListners() {
    notifyListeners();
  }

  String? get imagePath => _imagePath;
  String? get title => _title;
  bool get isPlaying => _isPlaying;
}
