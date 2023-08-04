import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

class AppCheckBox extends StatefulWidget {
  final double? height;
  final double? width;
  final double? radius;
  final double? iconSize;
  final double? borderWidth;
  final Color? fillColor;
  final Color? selectedStateColor;
  final Color? iconColor;
  final Color? borderColor;

  final bool isSelected;
  final Function()? onTap;

  const AppCheckBox({
    super.key,
    this.height,
    this.width,
    this.radius,
    this.borderWidth,
    this.fillColor,
    this.selectedStateColor,
    this.iconColor,
    this.iconSize,
    this.borderColor,
    this.onTap,
    required this.isSelected,
  });

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width ?? 24.w,
        height: widget.height ?? 24.h,
        decoration: BoxDecoration(
          color:
              widget.isSelected ? widget.selectedStateColor : widget.fillColor,
          borderRadius: BorderRadius.circular(widget.radius ?? 8.r),
          border: Border.all(
            color: widget.isSelected
                ? widget.selectedStateColor ?? AppColors.novaWhite
                : widget.borderColor ?? AppColors.novaWhite,
          ),
        ),
        child: widget.isSelected
            ? Center(
                child: Icon(
                  Icons.check,
                  size: widget.iconSize ?? 16.r,
                  color: widget.iconColor ?? AppColors.novaWhite,
                ),
              )
            : Container(),
      ),
    );
  }
}

class AppCheckBoxGradient extends StatefulWidget {
  final double? height;
  final double? width;
  final double? radius;
  final double? iconSize;
  final double? borderWidth;
  final Color? fillColor;
  final Color? selectedStateColor;
  final Color? iconColor;
  final Gradient? fillGradient;
  final Gradient? selectedStateGradient;
  final bool isSelected;
  final Gradient borderGradient;
  final Function()? onTap;

  const AppCheckBoxGradient({
    super.key,
    this.height,
    this.width,
    this.radius,
    this.borderWidth,
    this.fillColor,
    this.selectedStateColor,
    this.iconColor,
    this.iconSize,
    this.selectedStateGradient,
    this.fillGradient,
    this.onTap,
    required this.isSelected,
    required this.borderGradient,
  });

  @override
  State<AppCheckBoxGradient> createState() => _AppCheckBoxGradientState();
}

class _AppCheckBoxGradientState extends State<AppCheckBoxGradient> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width ?? 24.w,
        height: widget.height ?? 24.h,
        decoration: BoxDecoration(
          color:
              widget.isSelected ? widget.selectedStateColor : widget.fillColor,
          gradient: widget.isSelected
              ? widget.selectedStateGradient
              : widget.fillGradient,
          border: GradientBoxBorder(
            gradient: widget.borderGradient,
            width: widget.borderWidth ?? 1.r,
          ),
          borderRadius: BorderRadius.circular(widget.radius ?? 8.r),
        ),
        child: widget.isSelected
            ? Center(
                child: Icon(
                  Icons.check,
                  size: widget.iconSize ?? 16.r,
                  color: widget.iconColor ?? AppColors.novaWhite,
                ),
              )
            : Container(),
      ),
    );
  }
}
