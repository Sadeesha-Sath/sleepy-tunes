import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleepy_tunes/app_logic/providers/presets.dart';
import 'package:sleepy_tunes/ui/screens/presets_screen.dart';

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
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => PresetScreen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    var begin = Offset(0.0, 1.0);
                    var end = Offset.zero;
                    var curve = Curves.easeInOut;

                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
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
