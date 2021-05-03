import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sleep_app/ui/screens/finish_customization_screen.dart';
import 'package:sleep_app/ui/ui_constants.dart';

class CustomizeScreen extends StatefulWidget {
  @override
  _CustomizeScreenState createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  late final ScrollController _scrollController;
  late final ScrollController _horizontalScrollController;
  int _selectedTab = 0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _horizontalScrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: 110,
                floating: true,
                title: Text("Customize Tracks"),
                centerTitle: true,
                elevation: 1,
                shadowColor: kBackgroundColor,
                backgroundColor: Colors.transparent,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 30, left: 12, right: 12),
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
                                border: Border.all(
                                    color: _selectedTab == 0
                                        ? Colors.lightBlue.shade500
                                        : kUnselectedItemColor),
                              ),
                              child: Center(
                                child: Text(
                                    "All movies, music, bs, and everything"),
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
                                border: Border.all(
                                    color: _selectedTab == 1
                                        ? Colors.lightBlue.shade500
                                        : kUnselectedItemColor),
                              ),
                              child: Center(
                                child: Text(
                                    "All movies, music, bs, and everything"),
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
                                border: Border.all(
                                    color: _selectedTab == 2
                                        ? Colors.lightBlue.shade500
                                        : kUnselectedItemColor),
                              ),
                              child: Center(
                                child: Text(
                                    "All movies, music, bs, and everything"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.85,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Card(
                          color: Colors.grey.shade900,
                          elevation: 2,
                          clipBehavior: Clip.antiAlias,
                          margin:
                              EdgeInsets.only(left: 15, right: 15, bottom: 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(),
                          // child: Image(
                          //   image: NetworkImage(
                          //       "https://images.unsplash.com/photo-1517148265373-cc0df208f9ac?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
                          //   alignment: Alignment.topCenter,
                          //   fit: BoxFit.fill,
                          //   isAntiAlias: true,
                          // ),
                        ),
                        Positioned.directional(
                          textDirection: TextDirection.ltr,
                          child: Text(
                            "Beach",
                            textAlign: TextAlign.center,
                          ),
                          bottom: 30,
                          // start: 30,
                          width: 140,
                        )
                      ],
                      clipBehavior: Clip.none,
                    );
                  },
                  childCount: 20,
                ),
              )
            ],
          ),
          Positioned(
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
                  top: -11,
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
          ),
        ],
      ),
    );
  }
}
