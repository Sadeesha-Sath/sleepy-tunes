import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/logic_handelers/rootbundle_handeler.dart';
import 'package:sleep_app/app_logic/models/tune.dart';

class Tunes with ChangeNotifier {
  // Future jsonString;
  List<Tune> _tunesList = [];

  // Tunes({required this.jsonString}) {
  //   jsonString.then(
  //     (value) {
  //       final stopwatch = Stopwatch()..start();
  //       for (var tune in value) {
  //         var newTune = Tune(
  //           audioPath: tune['path'],
  //           imagePath: tune['cover_art'],
  //           name: tune['title'],
  //         );
  //         _tunesList.add(newTune);
  //       }
  //       print('doSomething() executed in ${stopwatch.elapsed}');
  //       stopwatch.stop();
  //     },
  //   );
  // }

  void loadTunes() async {
    var jsonString = await loadTunesdata();
    for (var tune in jsonString) {
      var newTune = Tune(
        audioPath: tune['path'],
        imagePath: tune['cover_art'],
        name: tune['title'],
      );
      _tunesList.add(newTune);
    }
    notifyListeners();
  }

  List<Tune> get getTunes => _tunesList;

  // dynamic get getString => jsonString;
}
