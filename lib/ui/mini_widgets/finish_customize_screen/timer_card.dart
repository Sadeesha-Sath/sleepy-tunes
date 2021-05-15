import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/providers/customize_timer.dart';
import 'package:sleep_app/app_logic/providers/default_timer.dart';
import 'package:sleep_app/ui/custom_methods/build_custom_show_bottom_sheet.dart';
import 'package:sleep_app/ui/utils/timer_bottom_sheet.dart';
import 'package:provider/provider.dart';

class TimerCard extends StatefulWidget {
  @override
  _TimerCardState createState() => _TimerCardState();
}

class _TimerCardState extends State<TimerCard> {
  @override
  Widget build(BuildContext context) {
    var timing;
    try {
      timing = context.watch<CustomizeTimer>().getTiming;
    } catch (e) {
      print(e);
      context.read<CustomizeTimer>().changeTiming(context.watch<DefaultTimer>().getTiming);
      timing = context.watch<CustomizeTimer>().getTiming;
    }
    return Card(
      margin: EdgeInsets.only(left: 90, right: 90, bottom: 100, top: 10),
      elevation: 3,
      color: Colors.grey.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        onTap: () {
          // showPickerNumber(context, titleString: "Timer");
          buildCustomShowModalBottomSheet(
            context: context,
            builder: (context) => TimerBottomSheet(
              isDefault: false,
              initialValues: timing,
              onSave: (List<int> newTiming) {
                context.read<CustomizeTimer>().changeTiming(newTiming);
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Text("${timing[0]} Hours : ${timing[1]} Minutes"),
          ),
        ),
      ),
    );
  }
}
