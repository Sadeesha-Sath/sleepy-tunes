import 'package:flutter/material.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:sleep_app/ui/screens/finish_customization_screen.dart';

class CustomizeScreenFAB extends StatelessWidget {
  const CustomizeScreenFAB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FinishCustomizationScreen(),
                ),
              );
            },
            foregroundColor: kBackgroundColor,
            backgroundColor: Colors.lightBlueAccent.shade700,
            // backgroundColor: Color(0xFF141414),
          ),
          Positioned(
            top: -12,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(6.5),
              child: Center(
                child: Text(
                  "2",
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
        ],
      ),
      right: 20,
      bottom: 20,
    );
  }
}