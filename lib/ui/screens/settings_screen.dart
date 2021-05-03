import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/providers/default_timer.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: kBackgroundColor,
      child: CustomScrollView(
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => showPresetDialog(),
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
                SizedBox(
                  height: 200,
                ),
                Center(
                  // TODO Add Copyright
                  child: Text(
                    "Copyright",
                    style: TextStyle(color: kSecondaryColor),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showPresetDialog() {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      child: ListView(
        // TODO Use a builder method to draw a checkboxListTile for each preset, with a delete and cancel button below the listview
        children: [Text("Hello")],
      ),
    );
  }
}
