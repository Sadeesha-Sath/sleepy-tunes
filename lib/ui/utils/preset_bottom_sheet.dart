import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/models/preset.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/app_logic/providers/presets.dart';

class PresetBottomSheet extends StatefulWidget {
  final Set<Preset> presetList;

  PresetBottomSheet({required this.presetList});

  @override
  _PresetBottomSheetState createState() => _PresetBottomSheetState();
}

class _PresetBottomSheetState extends State<PresetBottomSheet> {
  ScrollController _controller = ScrollController();
  List<bool> _isSelected = [];
  bool _isAllSelected = false;
  List<bool> _tempState = [];

  @override
  void initState() {
    super.initState();
    widget.presetList.forEach((element) {
      _isSelected.add(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      padding: EdgeInsets.only(top: 20, bottom: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 25),
              child: Row(
                children: [
                  Spacer(
                    flex: 16,
                  ),
                  Text(
                    "Clear Presets",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                  ),
                  Spacer(
                    flex: 7,
                  ),
                  Checkbox(
                      value: _isAllSelected,
                      activeColor: Colors.lightBlueAccent.shade700,
                      onChanged: widget.presetList.isNotEmpty
                          ? (bool? value) {
                              setState(() {
                                _isAllSelected = value!;
                                if (value) {
                                  _tempState = _isSelected;

                                  _isSelected = widget.presetList.map((e) => true).toList();
                                } else {
                                  _isSelected = _tempState;
                                }
                              });
                            }
                          : null),
                  Spacer(
                    flex: 2,
                  ),
                ],
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
                        },
                        title: Text(
                          widget.presetList.elementAt(index).name,
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      );
                    },
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: Text(
                      "Save some Presets to get started!!",
                      style: TextStyle(fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  ),
            Container(
              margin: EdgeInsets.only(top: 15),
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
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Spacer(),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              widget.presetList.isNotEmpty ? Colors.redAccent.withOpacity(0.7) : kUnselectedItemColor),
                    ),
                    child: TextButton(
                        onPressed: widget.presetList.isNotEmpty
                            ? () {
                                List<int> deleteIndexList = [];
                                var i = 0;
                                for (bool value in _isSelected) {
                                  if (value) {
                                    deleteIndexList.add(i);
                                  }
                                  ++i;
                                }
                                context.read<Presets>().deletePreset(deleteIndexList);
                                Navigator.pop(context);
                              }
                            : null,
                        child: Text(
                          "Clear",
                          style: TextStyle(
                              color: widget.presetList.isNotEmpty ? Colors.redAccent : kUnselectedItemColor,
                              fontSize: 17),
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
