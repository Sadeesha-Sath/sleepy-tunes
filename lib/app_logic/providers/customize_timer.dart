import 'package:flutter/material.dart';

class CustomizeTimer with ChangeNotifier {
  late List<int> _timing;

  List<int> get getTiming => _timing;

  void changeTiming(List<int> newTiming) {
    _timing = newTiming;
    notifyListeners();
  }
}
