import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/routes/mobile/explore_routes.dart/explore_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';

class ExploreUserInfoMTile extends StatelessWidget {
  final UserModel? profile;
  const ExploreUserInfoMTile({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(
          ExploreMRouter.exploreUserProfileRoute,
          extra: ProfileMViewArgs(
            isCurrentUser: false,
            profile: profile,
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppUserProfileCircle(
            imageUrl: profile?.profilePictureUrl ?? '',
            radius: 30.r,
            errorText: profile?.name?[0] ?? '',
            borderEnabled: false,
          ),
          sizedBoxWithWidth(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (profile?.name?.isNotEmpty ?? false) ...{
                  sizedBoxWithHeight(4),
                  Text(
                    profile!.name!,
                    style: AppTextStyles.text14w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                },
                if (profile?.tagline?.isNotEmpty ?? false) ...{
                  sizedBoxWithHeight(8),
                  Text(
                    profile!.tagline!,
                    style: AppTextStyles.text12w300,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                },
                if (profile?.educations?.isNotEmpty ?? false) ...{
                  sizedBoxWithHeight(8),
                  Row(
                    children: [
                      Icon(
                        Icons.school,
                        color: ThemeHandler.widgetColor(),
                        size: 12.r,
                      ),
                      sizedBoxWithWidth(4),
                      Text(
                        profile!.educations!.first.school ??
                            'School name not available',
                        style: AppTextStyles.text12w300,
                      ),
                    ],
                  ),
                },
              ],
            ),
          ),
        ],
      ),
    );
  }
}
