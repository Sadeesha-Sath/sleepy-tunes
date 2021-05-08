import 'package:flutter/material.dart';
import 'package:sleep_app/ui/utils/preset_dialog.dart';
import 'package:sleep_app/app_logic/providers/default_timer.dart';
import 'package:sleep_app/app_logic/providers/presets.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/ui/utils/timer_picker.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late int _hours;
  late int _minutes;

  @override
  Widget build(BuildContext context) {
    _hours = context.watch<DefaultTimer>().getTiming[0];
    _minutes = context.watch<DefaultTimer>().getTiming[1];
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      color: kBackgroundColor,
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 110,
                title: Text("Settings"),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                // flexibleSpace: Spacer(),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    ElevatedButton(
                      onPressed: () {
                        showPickerNumber(context, titleString: "Default Timer", currentTiming: [_hours, _minutes]);
                      },
                      child: ListTile(
                        title: Text("Default Timer"),
                        trailing: Text("$_hours Hours : $_minutes Minutes"),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      // TODO Maybe use show modal bottomsheet instead of a showdialog
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => PresetDialog(presetList: context.watch<Presets>().getPresets),
                        );
                      },
                      child: ListTile(
                        title: Text("Clear Presets"),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showAboutDialog(context: context);
                      },
                      child: ListTile(
                        title: Text("About Us"),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: ListTile(
                        title: Text("Rate Us"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 150,
            right: 150,
            bottom: 10,
            child: Text(
              "Copyright",
              textAlign: TextAlign.center,
              style: TextStyle(color: kSecondaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
