import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_app/app_logic/providers/presets.dart';
import 'package:sleep_app/ui/screens/presets_screen.dart';

class CustomizeScreenAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var presetCount = context.watch<Presets>().getPresets.length;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(right: 5, top: 3),
          child: IconButton(
            icon: Icon(
              Icons.save_rounded,
              size: 27,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PresetScreen(),
                ),
              );
            },
          ),
        ),
        presetCount != 0
            ? Positioned(
                top: presetCount > 9 ? 4 : 5,
                right: presetCount > 9 ? 6 : 9,
                child: Container(
                  padding: EdgeInsets.all(presetCount > 9 ? 3 : 4),
                  child: Center(
                    child: Text(
                      presetCount.toString(),
                      style: TextStyle(
                        fontSize: presetCount > 9 ? 12 : 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.redAccent,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
