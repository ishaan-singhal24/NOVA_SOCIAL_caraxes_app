import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';

class ProfileAddInfoMTile extends StatelessWidget {
  final String title;
  final String? subTitle;

  final String? imageAssetPath;
  final String? svgImageIcon;
  final IconData? icon;

  final Function()? onTap;
  ProfileAddInfoMTile({
    super.key,
    required this.title,
    this.subTitle,
    this.icon,
    this.svgImageIcon,
    this.imageAssetPath,
    this.onTap,
  });

  final List<LinearGradient> _dummyGradientList = [
    AppColors.novaBlueGradient,
    AppColors.novaGreenGradient,
    AppColors.novaIndigoGradient,
    AppColors.novaYellowGradient,
  ];

  Widget rendorIcon() {
    if (imageAssetPath != null) {
      return Center(
        child: SizedBox(
          height: 32.h,
          width: 32.w,
          child: Image.asset(
            imageAssetPath!,
          ),
        ),
      );
    }
    if (svgImageIcon != null) {
      return Iconify(
        svgImageIcon ?? MaterialSymbols.home,
        color: AppColors.novaWhite,
        size: 20.r,
      );
    }

    return Icon(
      icon ?? Iconsax.safe_home,
      color: AppColors.novaWhite,
    );
  }

  @override
  Widget build(BuildContext context) {
    final LinearGradient _gradientColor =
        _dummyGradientList[((imageAssetPath ?? svgImageIcon)?.length ?? 1) % 4];
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: _gradientColor,
            ),
            alignment: Alignment.center,
            child: rendorIcon(),
          ),
          sizedBoxWithWidth(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.text14w600,
                  maxLines: 1,
                ),
                if (subTitle != null) ...{
                  sizedBoxWithHeight(4),
                  Text(
                    subTitle ?? '',
                    style: AppTextStyles.text12w300,
                  ),
                },
              ],
            ),
          ),
        ],
      ),
    );
  }
}
