import 'package:flutter/material.dart';
import 'package:nova_social/utils/utils.dart';

void appSnackBarMWidget({
  required BuildContext context,
  required Widget content,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: content,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      margin: EdgeInsets.all(8.r),
      elevation: 5,
      backgroundColor: ThemeHandler.mutedPlusColor(nonInverse: false),
    ),
  );
}
