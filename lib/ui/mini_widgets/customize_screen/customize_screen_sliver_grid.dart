import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/models/track.dart';
import 'package:sleep_app/app_logic/providers/selected_tracks.dart';
import 'package:sleep_app/app_logic/providers/tracks.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/ui/ui_constants.dart';

class CustomizeScreenSliverGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Track> _activeTrackList = context.watch<Tracks>().getActiveTrackList;
    Set<Track> _selectedTracks = context.watch<SelectedTracks>().getTrackSet;
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 0.85,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  context.read<SelectedTracks>().toggleAddTrack(_activeTrackList[index]);
                },
                child: Card(
                  color: Colors.grey.shade900,
                  elevation: 2,
                  clipBehavior: Clip.hardEdge,
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 60),
                  shape: CircleBorder(),
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(_activeTrackList[index].trackImagePath), fit: BoxFit.cover)),
                    child: Opacity(
                      opacity: _selectedTracks.contains(_activeTrackList[index]) ? 0.75 : 0,
                      child: Container(
                        child: Center(
                          child: Icon(
                            Icons.check,
                            color: kBackgroundColor,
                            size: 100,
                          ),
                        ),
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Text(
                  _activeTrackList[index].trackName,
                  textAlign: TextAlign.center,
                ),
                bottom: 30,
                // start: 30,
                width: 140,
              )
            ],
            clipBehavior: Clip.none,
          );
        },
        childCount: _activeTrackList.length,
      ),
    );
  }
}
