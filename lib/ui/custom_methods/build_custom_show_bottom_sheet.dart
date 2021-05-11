import 'package:flutter/material.dart';

Future buildCustomShowModalBottomSheet({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  bool? isScrollControlled,
}) {
  return showModalBottomSheet(
      isScrollControlled: isScrollControlled ?? false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      context: context,
      builder: builder);
}
