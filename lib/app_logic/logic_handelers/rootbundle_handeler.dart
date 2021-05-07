import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

Future loadTunesdata() async {
  var jsonString =
      await rootBundle.loadString('assets/tunes/tunes_config.json');
  return jsonDecode(jsonString);
}

