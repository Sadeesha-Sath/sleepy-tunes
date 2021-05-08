import 'package:flutter/cupertino.dart';

class Volume with ChangeNotifier {
  double _volume;

  Volume(this._volume);

  void changeVolume(double value) {
    _volume = value;
    notifyListeners();
  }

  double get getVolume => _volume;
}
