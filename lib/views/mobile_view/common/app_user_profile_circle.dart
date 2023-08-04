import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/utils/utils.dart';

class AppUserProfileCircle extends StatelessWidget {
  final String imageUrl;
  final double? radius;
  final double? padding;
  final String errorText;
  final TextStyle? errorTextStyle;
  final bool? borderEnabled;
  const AppUserProfileCircle({
    super.key,
    required this.imageUrl,
    this.radius,
    this.borderEnabled = true,
    this.padding,
    required this.errorText,
    this.errorTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: ((radius ?? 16.r) - (padding ?? 4.r)) * 2.0,
        height: ((radius ?? 16.r) - (padding ?? 4.r)) * 2.0,
        padding: borderEnabled ?? false ? EdgeInsets.all(padding ?? 4.r) : null,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: ((radius ?? 16.r) - (padding ?? 4.r)) * 2.0,
        height: ((radius ?? 16.r) - (padding ?? 4.r)) * 2.0,
        padding: EdgeInsets.all(padding ?? 4.r),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.novaBrilliantRose,
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
