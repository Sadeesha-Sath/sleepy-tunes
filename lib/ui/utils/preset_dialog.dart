import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/models/preset.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/app_logic/providers/presets.dart';

class PresetDialog extends StatefulWidget {
  final List<Preset> presetList;

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
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
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
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Text(
                      "Save some Presets to get started!!",
                      style: TextStyle(fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  ),
            Container(
              margin: EdgeInsets.only(top: 12),
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
                      style: TextStyle(fontSize: 16.5),
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
                        style:
                            TextStyle(color: Colors.redAccent, fontSize: 16.5),
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
