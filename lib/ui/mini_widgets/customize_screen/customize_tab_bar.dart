import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sleep_app/app_logic/providers/tracks.dart';
import 'package:sleep_app/ui/ui_constants.dart';
import 'package:provider/provider.dart';

class CustomizeTabBar extends StatefulWidget {
  final List<String> _categoryNames = ["Nature", "Water", "Sci-Fi", "Lifestyle", "Brainwaves"];
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
        padding: const EdgeInsets.only(bottom: 35, left: 12, right: 12),
        child: SizedBox(
          height: 50,
          child: ListView.builder(
            dragStartBehavior: DragStartBehavior.start,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            controller: _horizontalScrollController,
            itemCount: widget._categoryNames.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTab = index;
                  });
                  context.read<Tracks>().changeActiveTab(_selectedTab);
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(
                        color: _selectedTab == index ? Colors.lightBlue.shade500 : kUnselectedItemColor, width: 1.8),
                  ),
                  child: Center(
                    child: Text(widget._categoryNames[index]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
