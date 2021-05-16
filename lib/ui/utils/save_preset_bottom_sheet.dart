import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleepy_tunes/app_logic/models/preset.dart';
import 'package:sleepy_tunes/app_logic/providers/customize_timer.dart';
import 'package:sleepy_tunes/app_logic/providers/presets.dart';
import 'package:sleepy_tunes/app_logic/providers/selected_tracks.dart';
import 'package:sleepy_tunes/ui/ui_constants.dart';

class SavePresetBottomSheet extends StatelessWidget {
  String getInitialText(Set<Preset> presetSet) {
    int i = 1;
    while (presetSet.any((element) => element.name == "Preset $i")) {
      ++i;
    }
    return "Preset $i";
  }

  @override
  Widget build(BuildContext context) {
    var selectedTracks = context.read<SelectedTracks>().getTrackSet;
    String initialText = getInitialText(context.watch<Presets>().getPresets);
    var textController = TextEditingController(text: initialText);
    return Container(
      height: 250,
      color: kBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: ListView(
          // shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 25),
              child: Center(
                child: Text(
                  "Save Preset",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            TextFormField(
              onFieldSubmitted: (value) {
                context.read<Presets>().addPreset(
                      Preset(
                        name: textController.value.text,
                        timing: context.read<CustomizeTimer>().getTiming,
                        trackList: selectedTracks.toList(),
                      ),
                    );
                Navigator.pop(context);
              },
              autofocus: true,
              keyboardAppearance: Brightness.dark,
              style: TextStyle(fontSize: 16),
              controller: textController,
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.only(top: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(
                    flex: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 16.5,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.lightBlue)),
                    child: TextButton(
                        onPressed: () {
                          context.read<Presets>().addPreset(
                                Preset(
                                  name: textController.value.text,
                                  timing: context.read<CustomizeTimer>().getTiming,
                                  trackList: selectedTracks.toList(),
                                ),
                              );
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(fontSize: 16.5, color: Colors.lightBlue),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
