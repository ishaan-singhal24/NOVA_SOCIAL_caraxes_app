import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const ChatAppBar({
    Key? key,
    this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.novaWhite,
              blurRadius: 2.r,
              spreadRadius: 4.r,
              offset: Offset(0.0, 2.h),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                AppEnvironment.navigator.pop();
              },
              child: Icon(
                Iconsax.arrow_left,
                size: 28.sp,
              ),
            ),
            sizedBoxWithWidth(16),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://media-exp1.licdn.com/dms/image/C4D03AQHtYUIp0Sp8xQ/profile-displayphoto-shrink_400_400/0/1641278638435?e=1674086400&v=beta&t=JcerdyDEczS7PW2SjWXE0WmExJjz1SAoqYYI8GMHGP0',
                      fit: BoxFit.cover,
                      width: 32.r,
                      height: 32.r,
                    ),
                  ),
                  sizedBoxWithWidth(8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sparsh Agarwal',
                        style: AppTextStyles.text16w500,
                      ),
                      sizedBoxWithHeight(4),
                      Text(
                        'Active 10m ago',
                        style: AppTextStyles.text12w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              CupertinoIcons.ellipsis,
              color: AppColors.novaIndigo,
            ),
          ],
        ),
      ),
    );
  }
}
