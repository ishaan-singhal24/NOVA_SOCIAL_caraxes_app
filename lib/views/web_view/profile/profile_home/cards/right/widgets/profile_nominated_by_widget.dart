import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'dart:html' as html;
import 'package:universal_html/html.dart' as html;

import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/web/nova_router.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:provider/provider.dart';

class ProfileNominatedByWidget extends StatelessWidget {
  const ProfileNominatedByWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileNotifier>(context).profileAsPerRoute();
    return user?.invitedBy != null
        ? InkWell(
            onTap: () {
              html.window.open(
                '${Uri.base.origin}${NovaRouter.userRoute}/${user!.invitedBy!.username}',
                '_blank',
              );
            },
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.novaIndigo,
                    ),
                  ),
                  height: 40.h,
                  width: 40.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: CachedNetworkImage(
                      imageUrl: user?.invitedBy?.userProfileImageUrl ??
                          AppAssets.sampleUserProfilePic,
                      width: double.maxFinite,
                      height: double.maxFinite,
                      fit: BoxFit.cover,
                      errorWidget: (context, err, v) => Container(
                        color: AppColors.novaPurple,
                        width: double.maxFinite,
                        height: double.maxFinite,
                        alignment: Alignment.center,
                        child: Text(
                          user?.invitedBy?.name?[0] ?? '',
                          style: AppTextStyles.text28w400.white,
                        ),
                      ),
                    ),
                  ),
                ),
                sizedBoxWithWidth(8),
                Text(
                  'Nominated by ',
                  style: AppTextStyles.text14w400,
                ),
                Text(
                  user?.invitedBy!.name ?? 'NA',
                  style: AppTextStyles.text14w600,
                ),
              ],
            ),
          )
        : Container();
  }
}
