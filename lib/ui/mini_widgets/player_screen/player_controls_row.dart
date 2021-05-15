import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/audio_players/simple_player.dart';
import 'package:sleep_app/app_logic/providers/bottom_appbar_data.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:sleep_app/ui/custom_methods/build_custom_show_bottom_sheet.dart';
import 'package:sleep_app/ui/utils/settings_bottom_sheet.dart';
import 'package:sleep_app/ui/utils/volume_bottom_sheet.dart';

class PlayerControlsRow extends StatefulWidget {
  const PlayerControlsRow({
    Key? key,
    required SimplePlayer simplePlayer,
    required bool isPlaying,
    required this.bottomAppBarData,
  })   : _simplePlayer = simplePlayer,
        _isPlaying = isPlaying,
        super(key: key);

  final SimplePlayer _simplePlayer;
  final bool _isPlaying;
  final BottomAppBarData bottomAppBarData;

  @override
  _PlayerControlsRowState createState() => _PlayerControlsRowState();
}

class _PlayerControlsRowState extends State<PlayerControlsRow> {
  late bool _isPlaying;
  @override
  void initState() {
    _isPlaying = widget._isPlaying;
    if (widget.bottomAppBarData.isPlaying == true && _isPlaying != widget.bottomAppBarData.isPlaying)
      _isPlaying = !_isPlaying;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(flex: 5),
        Material(
          color: kBackgroundColor,
          shadowColor: kBackgroundColor,
          clipBehavior: Clip.antiAlias,
          elevation: 2,
          child: IconButton(
            icon: Icon(Icons.volume_up),
            onPressed: () {
              buildCustomShowModalBottomSheet(
                context: context,
                builder: (context) => VolumeBottomSheet(widget._simplePlayer),
              );
            },
          ),
          shape: CircleBorder(
            side: BorderSide(color: kSecondaryColor),
          ),
        ),
        Spacer(),
        Material(
          color: kBackgroundColor,
          shadowColor: kBackgroundColor,
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          child: IconButton(
            padding: EdgeInsets.all(15),
            iconSize: 33,
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: () {
              _isPlaying ? widget._simplePlayer.onPause() : widget._simplePlayer.onResume();
              setState(() {
                _isPlaying = !_isPlaying;
              });
              widget.bottomAppBarData.changePlayingState();
            },
          ),
          shape: CircleBorder(
            side: BorderSide(color: kSecondaryColor),
          ),
        ),
        Spacer(),
        Material(
          color: kBackgroundColor,
          shadowColor: kBackgroundColor,
          clipBehavior: Clip.antiAlias,
          elevation: 2,
          child: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              buildCustomShowModalBottomSheet(
                context: context,
                builder: (context) => SettingsBottomSheet(widget._simplePlayer),
              );
            },
          ),
          shape: CircleBorder(
            side: BorderSide(color: kSecondaryColor),
          ),
        ),
        Spacer(flex: 5),
      ],
    );
  }
}
