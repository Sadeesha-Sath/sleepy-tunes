import 'package:flutter/material.dart';
import 'package:sleepy_tunes/app_logic/providers/selected_tracks.dart';
import 'package:sleepy_tunes/ui/ui_constants.dart';
import 'package:sleepy_tunes/ui/screens/finish_customization_screen.dart';
import 'package:provider/provider.dart';

class CustomizeScreenFAB extends StatelessWidget {
  const CustomizeScreenFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int length = context.watch<SelectedTracks>().getTrackSet.length;
    return Positioned(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          FloatingActionButton(
            elevation: 2,
            child: Center(
                child: Icon(
              Icons.queue_music_rounded,
              size: 28,
            )),
            shape: CircleBorder(),
            // This Button Disables when the selected set is zero
            onPressed: length != 0
                ? () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) => FinishCustomizationScreen(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          var begin = Offset(1.0, 0.0);
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
                  }
                : null,
            foregroundColor: kBackgroundColor,
            backgroundColor: Colors.lightBlueAccent.shade700,
            // backgroundColor: Color(0xFF141414),
          ),
          // This is the floating red indicator of the FAB
          length != 0
              ? Positioned(
                  top: -12,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(6.5),
                    child: Center(
                      child: Text(
                        length.toString(),
                        style: TextStyle(
                          fontSize: 15,
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
              : Container()
        ],
      ),
      right: 20,
      bottom: 20,
    );
  }
}
