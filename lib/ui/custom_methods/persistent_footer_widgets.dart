import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/providers/bottom_appbar_data.dart';
import 'package:sleep_app/app_logic/audio_players/simple_player.dart';
import 'package:sleep_app/ui/screens/player_screen.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:provider/provider.dart';

List<Widget> persistentFooterButtons(
  BuildContext context,
) {
  var _simplePlayer = context.read<SimplePlayer>();
  var _bottomAppBarData = context.watch<BottomAppBarData>();
  return [
    SizedBox(
      width: double.maxFinite,
      child: ListTile(
        // TODO Find a good BackgroundColor
        onTap: context.watch<SimplePlayer>().haveData
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlayerScreen(
                      isFromBottomBar: true,
                    ),
                  ),
                );
              }
            : null,
        tileColor: Colors.lightBlue.shade900,
        contentPadding: EdgeInsets.only(left: 10),
        leading: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(_bottomAppBarData.imagePath ?? 'assets/placeholder.jpg'), fit: BoxFit.cover)),
          width: 47,
          height: 47,
        ),
        title: Text(_bottomAppBarData.title ?? "Hey! We're lonely over here. Let's play something..."),
        trailing: SizedBox(
          width: 110,
          child: Row(
            children: [
              IconButton(
                  splashRadius: 25,
                  icon: Icon(
                    _bottomAppBarData.isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 32,
                    color: kPrimaryColor,
                  ),
                  onPressed: context.watch<SimplePlayer>().haveData
                      ? () {
                          _bottomAppBarData.isPlaying ? _simplePlayer.onPause() : _simplePlayer.onResume();
                          context.read<BottomAppBarData>().changePlayingState();
                        }
                      : null),
              IconButton(
                  splashRadius: 25,
                  icon: Icon(
                    Icons.close,
                    size: 32,
                    color: kSecondaryColor,
                  ),
                  onPressed: () {
                    _simplePlayer.dispose();
                    context.read<BottomAppBarData>().changePlayingState(false);
                    context.read<BottomAppBarData>().clearData();
                  })
            ],
          ),
        ),
      ),
    )
  ];
}
