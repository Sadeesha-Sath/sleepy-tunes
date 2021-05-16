import 'package:flutter/material.dart';
import 'package:sleepy_tunes/app_logic/audio_players/simple_player.dart';
import 'package:sleepy_tunes/ui/ui_constants.dart';

class SettingsBottomSheet extends StatefulWidget {
  final SimplePlayer player;

  SettingsBottomSheet(this.player);
  @override
  _SettingsBottomSheetState createState() => _SettingsBottomSheetState();
}

class _SettingsBottomSheetState extends State<SettingsBottomSheet> {
  double _speed = 1.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      height: 180,
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Playback Speed",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Slider.adaptive(
                        label: _speed.toString(),
                        divisions: 7,
                        min: 0.25,
                        max: 2.0,
                        value: _speed,
                        onChanged: (value) {
                          widget.player.setSpeed(value);
                          setState(() {
                            _speed = value;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              8,
                              (index) => Text("${0.25 * (index + 1)}"),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: kPrimaryColor)),
          //   clipBehavior: Clip.antiAlias,
          //   margin: EdgeInsets.symmetric(vertical: 20),
          //   child: IconButton(
          //     splashRadius: 25,
          //     icon: Icon(
          //       Icons.headset,
          //     ),
          //     onPressed: () {},
          //   ),
          // ),
        ],
      ),
    );
  }
}
