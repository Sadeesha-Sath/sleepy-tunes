import 'package:flutter/material.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:flutter/gestures.dart';

class CustomizeTabBar extends StatefulWidget {
  @override
  _CustomizeTabBarState createState() => _CustomizeTabBarState();
}

class _CustomizeTabBarState extends State<CustomizeTabBar> {
  late final ScrollController _horizontalScrollController;
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _horizontalScrollController = ScrollController();
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 12, right: 12),
        child: SizedBox(
          height: 40,
          child: ListView(
            dragStartBehavior: DragStartBehavior.start,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            controller: _horizontalScrollController,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTab = 0;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: _selectedTab == 0 ? Colors.lightBlue.shade500 : kUnselectedItemColor),
                    ),
                    child: Center(
                      child: Text("All movies, music, bs, and everything"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTab = 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: _selectedTab == 1 ? Colors.lightBlue.shade500 : kUnselectedItemColor),
                    ),
                    child: Center(
                      child: Text("All movies, music, bs, and everything"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTab = 2;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: _selectedTab == 2 ? Colors.lightBlue.shade500 : kUnselectedItemColor),
                    ),
                    child: Center(
                      child: Text("All movies, music, bs, and everything"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}