import 'package:flutter/material.dart';
import 'package:sleep_app/ui/ui_constants.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  final double? expandedHeight;
  final List<Widget>? actions;

  const CustomSliverAppBar({
    this.actions,
    this.expandedHeight,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 2,
      expandedHeight: expandedHeight ?? 100,
      title: Text(title),
      centerTitle: true,
      shadowColor: kBackgroundColor,
      backgroundColor: Colors.transparent,
      actions: actions,
    );
  }
}
