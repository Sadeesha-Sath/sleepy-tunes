import 'package:flutter/material.dart';
import 'package:sleep_app/ui/mini_widgets/settings_screen/timer_button.dart';
import 'package:sleep_app/ui/custom_methods/build_custom_show_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/app_logic/providers/presets.dart';
import 'package:sleep_app/ui/utils/preset_bottom_sheet.dart';

class SettingsSliverList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          TimerButton(),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              buildCustomShowModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => PresetBottomSheet(presetList: context.watch<Presets>().getPresets),
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
    );
  }
}