import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class RequestNotification extends StatelessWidget {
  const RequestNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 24.h,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 22.r,
          ),
          sizedBoxWithWidth(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 64.w),
                  child: RichText(
                    text: TextSpan(
                      text: 'Gargi Nath',
                      children: [
                        TextSpan(
                          text: ' accepted you collabration request.',
                          style: AppTextStyles.text14w400,
                        ),
                      ],
                      style: AppTextStyles.text14w500,
                    ),
                  ),
                ),
                sizedBoxWithHeight(16),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.novaYellow,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  child: Text(
                    AppStrings.messageNow,
                    style: AppTextStyles.text14w400,
                  ),
                ),
              ],
            ),
          ),
          sizedBoxWithWidth(16),
          Text(
            '1h',
            style: AppTextStyles.text14w400,
          ),
        ],
      ),
    );
  }
}
