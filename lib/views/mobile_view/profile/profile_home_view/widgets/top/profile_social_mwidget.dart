import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/enums/social_platforms.dart';
import 'package:nova_social/data/models/user/social/social.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/widgets/top/common/profile_add_info_mtile.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileSocialMWidget extends StatelessWidget {
  final ProfileMViewArgs args;
  const ProfileSocialMWidget({
    super.key,
    required this.args,
  });

  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final socials = args.profile?.socials;
    if ((socials?.isEmpty ?? true) && (args.isCurrentUser ?? false)) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 24.h,
        ),
        child: Column(
          children: [
            ProfileAddInfoMTile(
              title: 'Add your social links',
              subTitle:
                  'Show off your personal website, social media profiles etc.',
              svgImageIcon: MaterialSymbols.add_link,
              onTap: () {
                context.push(
                  AddEditMRouter.addEditSocialRoute,
                  extra: true,
                );
              },
            ),
            sizedBoxWithHeight(24),
            const AppDividerMwidget(),
          ],
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (socials?.isNotEmpty ?? false) ...{
            sizedBoxWithHeight(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...socials!.mapIndexed(
                  (index, Social item) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: AppIconButton(
                      icon: socialIcon(item.platform),
                      color: AppColors.novaDarkIndigo,
                      onTap: () {
                        if (item.url?.isNotEmpty ?? false) {
                          final Uri url = Uri.parse(item.url!);
                          _launchUrl(url);
                        }
                      },
                    ),
                  ),
                ),
                const Spacer(),
                if (args.isCurrentUser ?? false) ...{
                  AppIconButton(
                    color: AppColors.novaWhite.withOpacity(0.8),
                    icon: Icons.edit,
                    onTap: () {
                      context.push(
                        AddEditMRouter.addEditSocialRoute,
                        extra: false,
                      );
                    },
                  ),
                }
              ],
            ),
            sizedBoxWithHeight(24),
            const AppDividerMwidget(),
            sizedBoxWithHeight(24),
          },
        ],
      ),
    );
  }
}
