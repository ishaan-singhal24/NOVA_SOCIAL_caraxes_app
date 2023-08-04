import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class ReactionNotification extends StatelessWidget {
  const ReactionNotification({Key? key}) : super(key: key);

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
                          text: ' and 82 others reacted to your post.',
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
                  child: Row(
                    children: [
                      Container(
                        width: 80.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          color: AppColors.novaSkyBlue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.r),
                            bottomLeft: Radius.circular(8.r),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.novaWhite,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.r),
                              bottomRight: Radius.circular(8.r),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 8.h),
                          child: Text(
                            'Great product creates market for themselves like no other player has ever done before',
                            style: AppTextStyles.text14w400,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
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
