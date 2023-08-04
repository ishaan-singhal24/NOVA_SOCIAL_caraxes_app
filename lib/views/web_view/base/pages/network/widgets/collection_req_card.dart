import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class CollectionReqCard extends StatelessWidget {
  final UserModel user;
  const CollectionReqCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5),
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          sizedBoxWithWidth(12),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: CachedNetworkImage(
              imageUrl: user.profilePictureUrl ??
                  'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80',
              fit: BoxFit.cover,
              width: 40.r,
              height: 40.r,
            ),
          ),
          sizedBoxWithWidth(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: user.name ?? 'NA',
                    children: [
                      TextSpan(
                        text: AppStrings.isInvitingConnect,
                        style: AppTextStyles.text14w400,
                      ),
                    ],
                    style: AppTextStyles.text14w500,
                  ),
                ),
                sizedBoxWithHeight(8),
                Text(
                  'Doctor at KGMU Lucknow Uttar Pradesh',
                  style: AppTextStyles.text12w400,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                sizedBoxWithHeight(6),
                Text(
                  '123 ${AppStrings.sharedConnections} | 11.9K ${AppStrings.followers}',
                  style: AppTextStyles.text8w400,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          sizedBoxWithWidth(8),
          Container(
            padding: EdgeInsets.all(2.r),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.novaDarkMuted,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.close,
              color: AppColors.novaDarkMuted,
              size: 16.r,
            ),
          ),
          sizedBoxWithWidth(8),
          Container(
            padding: EdgeInsets.all(2.r),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.novaSkyBlue,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              color: AppColors.novaSkyBlue,
              size: 16.r,
            ),
          ),
          sizedBoxWithWidth(8),
        ],
      ),
    );
  }
}
