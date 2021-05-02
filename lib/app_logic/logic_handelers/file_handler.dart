import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

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
    print(e);
    writeTimer('{"hours": 1, "minutes": 1}');
    return readTimer();
  }
}
