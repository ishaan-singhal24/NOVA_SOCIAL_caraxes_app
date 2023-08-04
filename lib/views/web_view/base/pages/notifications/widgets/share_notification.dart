import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class ShareNotification extends StatelessWidget {
  const ShareNotification({Key? key}) : super(key: key);

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
            child: RichText(
              text: TextSpan(
                text: 'Gargi Nath',
                children: [
                  TextSpan(
                    text:
                        ' shared a post: That’s why FinTechs are becoming banks while banks are acquiring Fintechs ...',
                    style: AppTextStyles.text14w400,
                  ),
                ],
                style: AppTextStyles.text14w500,
              ),
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
