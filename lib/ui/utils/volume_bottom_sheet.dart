import 'package:flutter/material.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/app_logic/providers/volume.dart';

class VolumeBottomSheet extends StatefulWidget {
  @override
  _VolumeBottomSheetState createState() => _VolumeBottomSheetState();
}

class _VolumeBottomSheetState extends State<VolumeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    Volume _volume = context.watch<Volume>();
    return Container(
      // TODO Add a volume slider
      // color: Colors.lightBlue.shade800,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.volume_up,
            color: kPrimaryColor,
            size: 40,
          ),
          Slider.adaptive(
            value: _volume.getVolume,
            onChanged: (value) {
              _volume.changeVolume(value);
            },
          ),
        ],
      ),
    );
  }
}
