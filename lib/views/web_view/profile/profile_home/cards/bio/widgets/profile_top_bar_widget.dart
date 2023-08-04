import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/app_assets.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/routes.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/add_edit_profile.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/bio/widgets/profile_invite_dialog.dart';
import 'package:provider/provider.dart';

class ProfileTopBarWidget extends StatelessWidget {
  final String name;
  final String? profilePictureUrl;
  const ProfileTopBarWidget({
    Key? key,
    required this.name,
    this.profilePictureUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCurrentUser = Provider.of<ProfileNotifier>(context).isCurrentUser;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 150.r,
              height: 150.r,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      padding: EdgeInsets.all(2.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.novaIndigo,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(75.r),
                        child: CachedNetworkImage(
                          imageUrl: profilePictureUrl ??
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
                              name[0],
                              style: AppTextStyles.text28w400.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   bottom: 8.r,
                  //   right: 8.r,
                  //   child: Icon(
                  //     Iconsax.verify5,
                  //     color: AppColors.novaIndigo,
                  //   ),
                  // ),
                ],
              ),
            ),
            const Spacer(),
            if (isCurrentUser ?? false) ...{
              Column(
                children: [
                  sizedBoxWithHeight(8),
                  CustomButton(
                    text: 'Invite',
                    trailingIcon: Icons.group_add_rounded,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const ProfileInviteDialog(),
                      );
                    },
                    height: 40.h,
                    width: 100.w,
                  ),
                  sizedBoxWithHeight(8),
                  CustomButton(
                    hoverColor: ThemeHandler.mutedPlusColor(nonInverse: false),
                    hoverTextColor: AppColors.novaIndigo,
                    color: ThemeHandler.mutedPlusColor(nonInverse: false),
                    text: 'Edit',
                    trailingIcon: Icons.edit,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const ProfileAddEditIntro(
                          isAdd: false,
                        ),
                      );
                    },
                    height: 40.h,
                    width: 100.w,
                  ),
                  if (kDebugMode) ...{
                    AppIconButton(
                      icon: Icons.logout,
                      onTap: () async {
                        await Provider.of<AuthNotifier>(context, listen: false)
                            .signOut()
                            .then(
                          (value) {
                            context.go(NovaRouter.baseRoute);
                          },
                        );
                      },
                    ),
                  },
                ],
              ),
            }
          ],
        ),
        sizedBoxWithHeight(16),
        Text(
          name,
          style: AppTextStyles.text28w400,
        ),
      ],
    );
  }
}
