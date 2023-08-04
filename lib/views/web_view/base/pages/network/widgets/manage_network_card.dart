import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_strings.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/utils/utils.dart';

class ManageNetworkCard extends StatelessWidget {
  const ManageNetworkCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 56.h,
      decoration: BoxDecoration(
        color: AppColors.novaIndigo,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.manageMyNetwork,
            style: AppTextStyles.text16w500.white,
          ),
          Icon(
            Iconsax.arrow_right_3,
            color: AppColors.novaWhite,
            size: 18.sp,
          ),
        ],
      ),
    );
  }
}
