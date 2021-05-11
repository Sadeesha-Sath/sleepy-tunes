import 'package:flutter/material.dart';
import 'package:sleep_app/ui/utils/timer_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/app_logic/providers/default_timer.dart';

class TimerCard extends StatefulWidget {
  @override
  _TimerCardState createState() => _TimerCardState();
}

class _TimerCardState extends State<TimerCard> {
  List<int>? timing;
  List<int> defaultTiming = [];
  @override
  Widget build(BuildContext context) {
    defaultTiming = context.watch<DefaultTimer>().getTiming;
    return Card(
      margin: EdgeInsets.only(left: 90, right: 90, bottom: 100, top: 10),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      color: Colors.grey.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        onTap: () {
          // showPickerNumber(context, titleString: "Timer");
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
              clipBehavior: Clip.antiAlias,
              context: context,
              builder: (context) => TimerBottomSheet(
                    isDefault: false,
                    initialValues: timing ?? defaultTiming,
                    onSave: (List<int> newTime) {
                      setState(() {
                        timing = newTime;
                      });
                    },
                  ));
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Text("${timing?[0] ?? defaultTiming[0]} Hours : ${timing?[1] ?? defaultTiming[1]} Minutes"),
          ),
        ),
      ),
    );
  }
}
