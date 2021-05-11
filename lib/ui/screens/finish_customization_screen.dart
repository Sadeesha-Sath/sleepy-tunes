import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/providers/default_timer.dart';
import 'package:sleep_app/ui/screens/player_screen.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:sleep_app/ui/utils/save_preset_bottom_sheet.dart';
import 'package:sleep_app/ui/utils/timer_bottom_sheet.dart';
import 'package:sleep_app/ui/utils/track_card.dart';
import 'package:provider/provider.dart';

class FinishCustomizationScreen extends StatefulWidget {
  @override
  _FinishCustomizationScreenState createState() => _FinishCustomizationScreenState();
}

class _FinishCustomizationScreenState extends State<FinishCustomizationScreen> {
  double _volumeValue = 0.5;
  List<int>? timing;
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
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Stack(
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
                                    borderRadius:
                                        BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
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
                              child: Text(
                                  "${timing?[0] ?? defaultTiming[0]} Hours : ${timing?[1] ?? defaultTiming[1]} Minutes"),
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
                  onPressed: () {
                    // TODO Further improvements to the ui + refractor
                    showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
                        clipBehavior: Clip.antiAlias,
                        context: context,
                        builder: (context) => SavePresetBottomSheet());
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
                        builder: (context) => PlayerScreen(
                          timing: context.watch<DefaultTimer>().getTiming,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
