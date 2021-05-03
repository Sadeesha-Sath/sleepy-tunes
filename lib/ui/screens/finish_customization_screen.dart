import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/models/preset.dart';
import 'package:sleep_app/app_logic/providers/default_timer.dart';
import 'package:sleep_app/app_logic/providers/presets.dart';
import 'package:sleep_app/ui/screens/player_screen.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:sleep_app/ui/utils/timer_picker.dart';
import 'package:sleep_app/ui/utils/track_card.dart';
import 'package:provider/provider.dart';

class FinishCustomizationScreen extends StatefulWidget {
  @override
  _FinishCustomizationScreenState createState() =>
      _FinishCustomizationScreenState();
}

class _FinishCustomizationScreenState extends State<FinishCustomizationScreen> {
  double _volumeValue = 0.5;
  List<int> defaultTiming = [];

  // @override
  // void initState() {

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    defaultTiming = context.watch<DefaultTimer>().getTiming;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                elevation: 2,
                expandedHeight: 100,
                title: Text("Some Finishing Touches 😉"),
                centerTitle: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    TrackCard(
                      _volumeValue,
                      onPressed: (value) {
                        setState(() {
                          _volumeValue = value;
                        });
                      },
                    ),
                    TrackCard(
                      _volumeValue,
                      onPressed: (value) {
                        setState(() {
                          _volumeValue = value;
                        });
                      },
                    ),
                    TrackCard(
                      _volumeValue,
                      onPressed: (value) {
                        setState(() {
                          _volumeValue = value;
                        });
                      },
                    ),
                    TrackCard(
                      _volumeValue,
                      onPressed: (value) {
                        setState(() {
                          _volumeValue = value;
                        });
                      },
                    ),
                    TrackCard(
                      _volumeValue,
                      onPressed: (value) {
                        setState(() {
                          _volumeValue = value;
                        });
                      },
                    ),
                    TrackCard(
                      _volumeValue,
                      onPressed: (value) {
                        setState(() {
                          _volumeValue = value;
                        });
                      },
                    ),
                    Card(
                      margin: EdgeInsets.only(
                          left: 90, right: 90, bottom: 100, top: 10),
                      clipBehavior: Clip.hardEdge,
                      elevation: 3,
                      color: Colors.grey.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: InkWell(
                        onTap: () {
                          showPickerNumber(context, titleString: "Timer");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Center(
                            child: Text(
                                "${defaultTiming[0]} Hours : ${defaultTiming[1]} Minutes"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned.directional(
            bottom: 19,
            start: 20,
            textDirection: TextDirection.ltr,
            child: Material(
              clipBehavior: Clip.antiAlias,
              elevation: 3,
              shape: CircleBorder(),
              child: IconButton(
                padding: EdgeInsets.all(17),
                iconSize: 31.5,
                color: Colors.lightBlueAccent.shade400,
                icon: Icon(Icons.save),
                // TODO Open a dialog box and make user to type a name => (Suppy a default one first)
                onPressed: () {
                  // ! For debugging
                  context.read<Presets>().addPreset(Preset(
                          name: "Test 1",
                          timing: [
                            1,
                            54
                          ],
                          trackList: [
                            Track(
                                trackImagePath: '1',
                                trackName: '1',
                                trackPath: '1',
                                volume: 0.6)
                          ]));
                },
              ),
            ),
          ),
          Positioned.directional(
            bottom: 22,
            end: 20,
            textDirection: TextDirection.ltr,
            child: Material(
              clipBehavior: Clip.antiAlias,
              color: Colors.lightBlueAccent.shade700.withOpacity(0.95),
              elevation: 3,
              shape: CircleBorder(),
              child: IconButton(
                padding: EdgeInsets.all(17),
                iconSize: 27.5,
                color: kBackgroundColor,
                icon: Icon(Icons.arrow_forward_ios_rounded),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayerScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
