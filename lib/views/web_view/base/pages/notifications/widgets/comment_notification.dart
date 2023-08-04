import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class CommentNotification extends StatelessWidget {
  const CommentNotification({Key? key}) : super(key: key);

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
                          text: ' commented on your post',
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
                    border: Border.all(width: 0.2),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: AppColors.novaWhite,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.r),
                            topRight: Radius.circular(8.r),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        child: Text(
                          'Hey lets meet some time, KGMU college and other organisations',
                          style: AppTextStyles.text14w400,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: AppColors.novaLightMuted,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.r),
                            bottomRight: Radius.circular(8.r),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        child: Text(
                          'Great product creates market for themselves like no other player has ever done before',
                          style: AppTextStyles.text14w400,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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
