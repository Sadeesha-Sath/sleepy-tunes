import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final double iconSize;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color color;
  final Icon icon;
  final onPressed;

  const CustomIconButton(
      {Key? key,
      required this.iconSize,
      this.padding,
      required this.color,
      required this.icon,
      required this.onPressed,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      color: backgroundColor,
      shape: CircleBorder(),
      child: IconButton(
        padding: padding ?? EdgeInsets.all(17),
        iconSize: iconSize,
        color: color,
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}