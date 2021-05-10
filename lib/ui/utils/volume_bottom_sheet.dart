import 'package:flutter/material.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/app_logic/providers/volume.dart';

class VolumeBottomSheet extends StatefulWidget {
  final player;

  VolumeBottomSheet(this.player);
  @override
  _VolumeBottomSheetState createState() => _VolumeBottomSheetState();
}

class _VolumeBottomSheetState extends State<VolumeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    Volume _volume = context.watch<Volume>();
    return Container(
      // color: Colors.lightBlue.shade800,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.volume_up,
                color: kPrimaryColor,
                size: 35,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Volume",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Slider.adaptive(
            value: _volume.getVolume,
            onChanged: (value) {
              widget.player.setVolume(value);
              _volume.changeVolume(value);
            },
          ),
        ],
      ),
    );
  }
}
