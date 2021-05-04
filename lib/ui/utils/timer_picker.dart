import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:sleep_app/app_logic/providers/default_timer.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:provider/provider.dart';

showPickerNumber(BuildContext context,
    {required String titleString, List<int>? currentTiming, onConfirm}) {
  Picker(
      itemExtent: 33,
      height: 200,
      looping: true,
      textAlign: TextAlign.center,
      selecteds: currentTiming ?? context.read<DefaultTimer>().getTiming,
      selectedTextStyle: TextStyle(color: Colors.white, fontSize: 23),
      textStyle: TextStyle(color: Colors.white, fontSize: 20),
      backgroundColor: kBackgroundColor,
      magnification: 1.1,
      confirmTextStyle: kDialogBoxTextStyle,
      cancelTextStyle: kDialogBoxTextStyle,
      containerColor: kBackgroundColor,
      // hideHeader: true,
      builderHeader: (context) => Container(
            padding: EdgeInsets.only(left: 27, right: 20, top: 10, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Hours"), Text("Minutes")],
            ),
          ),
      adapter: NumberPickerAdapter(
        data: [
          NumberPickerColumn(begin: 00, end: 24),
          NumberPickerColumn(begin: 00, end: 60),
        ],
      ),
      delimiter: [
        PickerDelimiter(
          child: Container(
            // decoration: BoxDecoration(color: kBackgroundColor),
            width: 30.0,
            alignment: Alignment.center,
            child: Text(
              ":",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  color: kPrimaryColor),
            ),
          ),
        ),
      ],
      title: Center(child: Text(titleString)),
      onConfirm: (Picker picker, List value) {
        onConfirm ??
            context.read<DefaultTimer>().changeTiming(value.cast<int>());
      }).showDialog(context);
}
