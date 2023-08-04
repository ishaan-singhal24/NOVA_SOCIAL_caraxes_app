import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class SearchButton extends StatelessWidget {
  final Function onPressed;
  const SearchButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.novaIndigo,
          borderRadius: BorderRadius.circular(
            24.r,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_sharp,
              color: AppColors.novaWhite,
              size: 16,
            ),
            sizedBoxWithWidth(8),
            Text(
              AppStrings.spaceStationSearchButton,
              style: AppTextStyles.text12w500.white,
            ),
          ],
        ),
      ),
    );
  }
}
