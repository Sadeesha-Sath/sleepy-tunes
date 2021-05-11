import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleep_app/ui/ui_constants.dart';

class TimerBottomSheet extends StatefulWidget {
  final List<int> initialValues;
  final bool isDefault;
  final Function(List<int>) onSave;

  TimerBottomSheet({required this.isDefault, required this.onSave, required this.initialValues});
  @override
  _TimerBottomSheetState createState() => _TimerBottomSheetState();
}

class _TimerBottomSheetState extends State<TimerBottomSheet> {
  int _hourValue = 0;
  int _minuteValue = 0;

  @override
  void initState() {
    _hourValue = widget.initialValues[0];
    _minuteValue = widget.initialValues[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440,
      color: kBackgroundColor,
      padding: EdgeInsets.only(top: 20, bottom: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 45),
              child: Center(
                child: Text(
                  widget.isDefault ? "Default Timer" : "Timer",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Row(
              children: [
                Spacer(
                  flex: 5,
                ),
                Text(
                  "Hours",
                  style: TextStyle(fontSize: 19),
                ),
                Spacer(
                  flex: 17,
                ),
                Text(
                  "Minutes",
                  style: TextStyle(fontSize: 19),
                ),
                Spacer(
                  flex: 4,
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Spacer(),
                  SizedBox(
                    width: 100,
                    height: 200,
                    child: Center(
                      child: CupertinoPicker(
                        diameterRatio: 1.1,
                        scrollController: FixedExtentScrollController(initialItem: _hourValue),
                        looping: true,
                        itemExtent: 28,
                        onSelectedItemChanged: (int value) {
                          setState(() {
                            _hourValue = value;
                          });
                        },
                        children: [
                          for (var i = 0; i < 15; i += 1)
                            Text(
                              i.toString(),
                              style: TextStyle(color: kPrimaryColor),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Center(
                      child: Text(
                        ":",
                        style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700, color: kSecondaryColor),
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 100,
                    height: 210,
                    child: Center(
                      child: CupertinoPicker(
                        diameterRatio: 1.1,
                        scrollController: FixedExtentScrollController(initialItem: _minuteValue),
                        looping: true,
                        itemExtent: 28,
                        onSelectedItemChanged: (int value) {
                          setState(() {
                            _minuteValue = value;
                          });
                        },
                        children: [
                          for (var i = 0; i < 61; i += 1)
                            Text(
                              i.toString(),
                              style: TextStyle(color: kPrimaryColor),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                ],
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
                          widget.onSave([_hourValue, _minuteValue]);
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
