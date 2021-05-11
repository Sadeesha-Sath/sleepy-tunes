import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/models/preset.dart';
import 'package:sleep_app/app_logic/providers/presets.dart';
import 'package:sleep_app/ui/screens/finish_customization_screen.dart';
import 'package:sleep_app/ui/screens/player_screen.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:sleep_app/ui/utils/custom_sliver_appbar.dart';
import 'package:provider/provider.dart';

class PresetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Set<Preset> presetSet = context.watch<Presets>().getPresets;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 22),
        child: CustomScrollView(
          slivers: [
            CustomSliverAppBar(title: "Saved Presets"),
            presetSet.length != 0
                ? SliverList(
                    delegate: SliverChildListDelegate(
                      presetSet.map(
                        (e) {
                          return Card(
                            clipBehavior: Clip.hardEdge,
                            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 22),
                            elevation: 4,
                            color: Colors.grey.shade800.withAlpha(130),
                            // shadowColor: Colors.grey.shade800.withAlpha(200),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                              onLongPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FinishCustomizationScreen(),
                                  ),
                                );
                              },
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PlayerScreen(timing: e.timing, tracks: e.trackList),
                                  ),
                                );
                              },
                              child: Container(
                                height: 110,
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Text(
                                            e.name,
                                            style: TextStyle(
                                                fontSize: 20, color: kPrimaryColor, fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text(
                                              "${e.trackList.length} Tracks",
                                              style: TextStyle(color: kPrimaryColor, fontSize: 16),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            child: Text(
                                              "${e.timing[0]} Hours : ${e.timing[1]} Minutes",
                                              style: TextStyle(color: kPrimaryColor, fontSize: 16),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  )
                : SliverFillRemaining(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Text(
                          "Save some Presets to get started!!",
                          style: TextStyle(fontSize: 21),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
