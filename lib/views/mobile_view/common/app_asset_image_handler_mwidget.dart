import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/utils/utils.dart';

class AppAssetImageHandlerMWidget extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final String errorText;
  final TextStyle? errorTextStyle;
  final Color? boxColor;
  final Color? errorBoxColor;
  final bool? paddingEnabled;
  const AppAssetImageHandlerMWidget({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.radius,
    this.paddingEnabled = true,
    this.padding,
    required this.errorText,
    this.errorTextStyle,
    this.errorBoxColor,
    this.boxColor,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width ?? height ?? 24.r,
      height: height ?? width ?? 24.r,
      frameBuilder: (context, child, _, __) => Container(
        clipBehavior: Clip.antiAlias,
        padding:
            paddingEnabled ?? false ? EdgeInsets.all(padding ?? 4.r) : null,
        decoration: BoxDecoration(
          color: boxColor ?? AppColors.novaDarkIndigo,
          borderRadius: BorderRadius.circular(radius ?? 0),
        ),
        child: child,
      ),
      errorBuilder: (context, url, error) => Container(
        width: width ?? 24.r,
        height: height ?? 24.r,
        padding: EdgeInsets.all(padding ?? 4.r),
        decoration: BoxDecoration(
          color: errorBoxColor ?? AppColors.novaBrilliantRose,
          borderRadius: BorderRadius.circular(radius ?? 0),
        ),
        alignment: Alignment.center,
        child: FittedBox(
          child: Text(
            errorText,
            style: errorTextStyle ?? AppTextStyles.text28w500,
          ),
        ),
      ),
    );
  }
}
