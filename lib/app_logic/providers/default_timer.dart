import 'package:flutter/cupertino.dart';
import 'package:sleep_app/app_logic/logic_handelers/file_handler.dart';

class DefaultTimer with ChangeNotifier{
  late List<int> _timing;

  void getSavedData() async {
    changeTiming(await readTimer());
  }

  List<int> get getTiming => _timing;

  void changeTiming(List<int> newTiming) {
    _timing = newTiming;
    notifyListeners();
    writeTimer('{"hours" : ${newTiming[0]},"minutes" : ${newTiming[1]}}');
  }
}
