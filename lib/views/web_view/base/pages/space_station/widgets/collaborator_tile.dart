import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/utils/utils.dart';

class CollaboratorTile extends StatelessWidget {
  const CollaboratorTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 16.w,
        bottom: 88.h,
      ),
      child: Container(
        width: 140.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColors.novaMellon,
            width: 0.5,
          ),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
              child: Image.asset(
                AppStrings.bgImage,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizedBoxWithHeight(32),
                CircleAvatar(
                  radius: 32.r,
                ),
                sizedBoxWithHeight(8),
                Text(
                  'Name',
                  style: AppTextStyles.text12w500,
                ),
                sizedBoxWithHeight(8),
                Text(
                  'Tagline',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.text10w400,
                ),
                sizedBoxWithHeight(8),
                Text(
                  'Open to',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.text10w400,
                ),
                const Spacer(),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Container(
                        height: 32.h,
                        width: 120.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.novaIndigo,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Text(
                          'Connect',
                          style: AppTextStyles.text12w500.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
