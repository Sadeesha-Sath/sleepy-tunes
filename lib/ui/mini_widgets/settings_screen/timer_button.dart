import 'package:flutter/material.dart';
import 'package:sleepy_tunes/ui/custom_methods/build_custom_show_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:sleepy_tunes/app_logic/providers/default_timer.dart';
import 'package:sleepy_tunes/ui/utils/timer_bottom_sheet.dart';

class TimerButton extends StatefulWidget {
  @override
  _TimerButtonState createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  @override
  Widget build(BuildContext context) {
    var _defaultTimings = context.watch<DefaultTimer>().getTiming;
    var _hours = _defaultTimings[0];
    var _minutes = _defaultTimings[1];
    return ElevatedButton(
      onPressed: () {
        buildCustomShowModalBottomSheet(
          context: context,
          builder: (context) => TimerBottomSheet(
            initialValues: _defaultTimings,
            isDefault: true,
            onSave: (List<int> newTiming) {
              context.read<DefaultTimer>().changeTiming(newTiming);
            },
          ),
        );
      },
      child: ListTile(
        title: Text("Default Timer"),
        trailing: Text("$_hours Hours : $_minutes Minutes"),
      ),
    );
  }
}
