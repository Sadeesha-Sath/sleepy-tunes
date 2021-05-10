import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sleep_app/app_logic/models/preset.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localTimerFile async {
  final path = await _localPath;
  return File('$path/default_timer.json');
}

Future<File> writeTimer(dynamic jsonString) async {
  final file = await _localTimerFile;

  return file.writeAsString(jsonString);
}

Future<List<int>> readTimer() async {
  try {
    final file = await _localTimerFile;

    String contents = await file.readAsString();

    var finalValue = jsonDecode(contents);
    return [finalValue['hours'], finalValue['minutes']];
  } catch (e) {
    // ! Debug Purposes
    print(e);
    writeTimer('{"hours": 1, "minutes": 0}');
    return readTimer();
  }
}

Future<File> get _localPresetsFile async {
  final path = await _localPath;
  return File("$path/presets.json");
}

Future<File> writePresets(List<Preset> presets) async {
  final file = await _localPresetsFile;

  List<Map> stringList = [];
  if (presets.isNotEmpty) {
    for (Preset preset in presets) {
      stringList.add(preset.exportPreset());
    }
  }
  try {
    var jsonString = jsonEncode(stringList);
    // print(jsonString);
    return file.writeAsString(jsonString);
  } catch (e) {
    print(e);
    return file;
  }
}

Future<dynamic> readPresets() async {
  try {
    final file = await _localPresetsFile;

    String contents = await file.readAsString();
    return jsonDecode(contents);
  } catch (e) {
    // ! Debug Purposes
    print(e);
    writePresets([]);
    return [];
  }
}
