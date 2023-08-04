import 'package:flutter/material.dart';
import 'package:nova_social/utils/utils.dart';

class AppErrorIcon extends StatelessWidget {
  final double? size;
  const AppErrorIcon({
    Key? key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.error,
      color: ThemeHandler.widgetColor(),
      size: size,
    );
  }
}
