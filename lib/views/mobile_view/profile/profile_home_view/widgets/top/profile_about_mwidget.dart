import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/widgets/top/common/profile_add_info_mtile.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class ProfileAboutMWidget extends StatelessWidget {
  final ProfileMViewArgs args;
  const ProfileAboutMWidget({
    super.key,
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    final about = args.profile?.about;
    if ((about?.isEmpty ?? true) && (args.isCurrentUser ?? false)) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
          children: [
            ProfileAddInfoMTile(
              title: 'Add an introduction',
              subTitle:
                  'Tell others about yourself and what your aspirations are',
              svgImageIcon: MaterialSymbols.person,
              onTap: () {
                context.push(
                  AddEditMRouter.addEditAboutRoute,
                  extra: true,
                );
              },
            ),
            sizedBoxWithHeight(8),
          ],
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (about?.isNotEmpty ?? false) ...{
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'About',
                  style: AppTextStyles.text20w500,
                ),
                if (args.isCurrentUser ?? false) ...{
                  AppIconButton(
                    color: AppColors.novaWhite.withOpacity(0.8),
                    icon: about?.isEmpty ?? true ? Icons.add : Icons.edit,
                    onTap: () {
                      context.push(
                        AddEditMRouter.addEditAboutRoute,
                        extra: about?.isEmpty ?? true ? true : false,
                      );
                    },
                  ),
                },
              ],
            ),
            sizedBoxWithHeight(12),
            ReadMoreText(
              about!,
              style: AppTextStyles.text14w400,
              trimLength: 72,
              moreStyle: AppTextStyles.text14w400.indigo,
              lessStyle: AppTextStyles.text14w400.indigo,
            ),
          },
          sizedBoxWithHeight(8),
        ],
      ),
    );
  }
}
