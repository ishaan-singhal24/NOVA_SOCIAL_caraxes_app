import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/utils/utils.dart';

class BottomGradientBorderTextMWidget extends StatelessWidget {
  final double? width;
  final double gradientContainerHeight;
  final double normalContainerHeight;
  final String text;
  final TextStyle? textStyle;
  const BottomGradientBorderTextMWidget({
    super.key,
    this.width,
    required this.gradientContainerHeight,
    required this.normalContainerHeight,
    required this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: gradientContainerHeight,
          decoration: BoxDecoration(
            color: ThemeHandler.backgroundColor(),
            borderRadius: BorderRadius.circular(8.r),
            border: GradientBoxBorder(
              gradient: AppColors.novaRoseVoiletGlowGradient,
            ),
          ),
        ),
        Positioned.fill(
          bottom: 1.h,
          child: Container(
            height: normalContainerHeight,
            decoration: BoxDecoration(
              color: ThemeHandler.backgroundColor(),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r),
              ),
              border: Border.all(
                color: ThemeHandler.backgroundColor(),
              ),
            ),
            child: Center(
              child: Text(
                text,
                maxLines: 2,
                style: textStyle ?? AppTextStyles.text14w800,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
