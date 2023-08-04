import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

class AddEditMessageBar extends StatelessWidget {
  final String message;
  const AddEditMessageBar({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.novaIndigo,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        message,
        style: AppTextStyles.text12w400.white,
      ),
    );
  }
}
