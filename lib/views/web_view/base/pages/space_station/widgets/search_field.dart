import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/utils/utils.dart';

class SearchField extends StatelessWidget {
  final String title;
  final String subTitle;
  const SearchField({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 70.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 8.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          border: Border.all(
            color: AppColors.novaLightMutedPlus,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.text12w500,
            ),
            Text(
              subTitle,
              style: AppTextStyles.text12w300,
            ),
          ],
        ),
      ),
    );
  }
}
