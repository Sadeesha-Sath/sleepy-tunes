import 'package:flutter/material.dart';
import 'package:sleep_app/ui/ui_constants.dart';

class PlayerScreen extends StatefulWidget {
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text("Good Night!"),
      ),
      backgroundColor: kBackgroundColor,
      body: Container(),
    );
  }
}
