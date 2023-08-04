import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/bio/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProfileBioWidget extends StatelessWidget {
  const ProfileBioWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<ProfileNotifier>(context);
    final user = notifier.profileAsPerRoute();
    final isCurrentUser = notifier.isCurrentUser;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Top Bar
        ProfileTopBarWidget(
          name: user?.name ?? AppEnvironment.user?.displayName ?? 'NA',
          profilePictureUrl:
              user?.profilePictureUrl ?? AppEnvironment.user?.photoURL,
        ),
        sizedBoxWithHeight(8),

        //Username
        Text(
          '@${user?.username}',
          style: AppTextStyles.text14w500.subHead,
        ),
        sizedBoxWithHeight(16),

        //Tagline
        const ProfileTaglineWidget(),

        sizedBoxWithHeight(24),

        const ProfileInterestsWidget(),

        const ProfileAboutWidget(),

        const ProfileOpportunityWidget(),

        const ProfileSocialWidget(),

        // if (user?.invitedBy != null) ...{
        //   sizedBoxWithHeight(16),
        //   Divider(
        //     color: ThemeHandler.mutedColor(),
        //     thickness: 0.5,
        //   ),
        //   sizedBoxWithHeight(16),
        //   const ProfileNominatedByWidget(),
        //   sizedBoxWithHeight(16),
        //   Divider(
        //     color: ThemeHandler.mutedColor(),
        //     thickness: 0.5,
        //   ),
        // },
        sizedBoxWithHeight(40),
      ],
    );
  }
}
