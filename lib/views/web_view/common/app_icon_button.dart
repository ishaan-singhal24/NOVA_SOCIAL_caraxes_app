import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

class AppIconButton extends StatefulWidget {
  final Function() onTap;
  final IconData icon;
  final Color? color;
  final Color? hoverColor;
  final Color? splashColor;
  final double? size;
  const AppIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.color,
    this.hoverColor,
    this.splashColor,
    this.size,
  }) : super(key: key);

  @override
  State<AppIconButton> createState() => _AppIconButtonState();
}

class _AppIconButtonState extends State<AppIconButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // hoverColor: splashColor ?? ThemeHandler.mutedPlusColor(nonInverse: false),
      onTap: widget.onTap,
      onHover: (hover) {
        isHover = hover;
        setState(() {});
      },
      child: Icon(
        widget.icon,
        size: widget.size ?? 24.r,
        color: isHover
            ? widget.hoverColor ?? AppColors.novaWhite.withOpacity(0.7)
            : widget.color ?? AppColors.novaWhite.withOpacity(0.4),
      ),
    );
  }
}
