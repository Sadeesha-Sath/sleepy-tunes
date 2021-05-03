import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/logic_handelers/file_handler.dart';
import 'package:sleep_app/app_logic/models/preset.dart';
import 'package:sleep_app/app_logic/providers/default_timer.dart';
import 'package:sleep_app/app_logic/providers/presets.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/ui/utils/timer_picker.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late int _hours;
  late int _minutes;

  @override
  Widget build(BuildContext context) {
    _hours = context.watch<DefaultTimer>().getTiming[0];
    _minutes = context.watch<DefaultTimer>().getTiming[1];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: kBackgroundColor,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 110,
            title: Text("Settings"),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            // flexibleSpace: Spacer(),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ElevatedButton(
                  onPressed: () {
                    showPickerNumber(context,
                        titleString: "Default Timer",
                        currentTiming: [_hours, _minutes]);
                  },
                  child: ListTile(
                    title: Text("Default Timer"),
                    trailing: Text("$_hours Hours : $_minutes Minutes"),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => PresetDialog(
                          presetList: context.watch<Presets>().getPresets),
                    );
                  },
                  child: ListTile(
                    title: Text("Clear Presets"),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    showAboutDialog(context: context);
                  },
                  child: ListTile(
                    title: Text("About Us"),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: ListTile(
                    title: Text("Rate Us"),
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                Center(
                  // TODO Add Copyright
                  child: Text(
                    "Copyright",
                    style: TextStyle(color: kSecondaryColor),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PresetDialog extends StatefulWidget {
  // TODO Find another way to do this
  List<Preset> presetList;

  PresetDialog({required this.presetList});

  @override
  _PresetDialogState createState() => _PresetDialogState();
}

class _PresetDialogState extends State<PresetDialog> {
  ScrollController _controller = ScrollController();
  List<bool> _isSelected = [];

  @override
  void initState() {
    super.initState();
    widget.presetList.forEach((element) {
      _isSelected.add(false);
    });
  }

  List<int> deleteIndexList = [];
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 120),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 15),
              child: Center(
                child: Text(
                  "Clear Presets",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            widget.presetList.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    controller: _controller,
                    itemCount: widget.presetList.length,
                    itemBuilder: (context, int index) {
                      return CheckboxListTile(
                        activeColor: Colors.lightBlueAccent.shade700,
                        selected: _isSelected[index],
                        value: _isSelected[index],
                        onChanged: (bool? value) {
                          setState(() {
                            _isSelected[index] = value!;
                          });
                          if (_isSelected[index]) {
                            deleteIndexList.add(index);
                          } else {
                            deleteIndexList.remove(index);
                          }
                        },
                        title: Text(
                          widget.presetList[index].name,
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      );
                    },
                  )
                : Text(
                    "There are no Saved Presets Available",
                    textAlign: TextAlign.center,
                  ),
            Container(
              margin: EdgeInsets.only(bottom: 5, top: 12),
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
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        context.read<Presets>().deletePreset(deleteIndexList);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Clear",
                        style: TextStyle(color: Colors.redAccent, fontSize: 18),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
