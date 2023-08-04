import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileNotifier profileNotifier =
        Provider.of<ProfileNotifier>(context);
    return Drawer(
      backgroundColor: ThemeHandler.backgroundColor(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxWithHeight(60),
            GestureDetector(
              onTap: () {
                context.push(
                  MobileRouter.profileRoute,
                  extra: ProfileMViewArgs(
                    profile: profileNotifier.userProfile,
                    isCurrentUser: true,
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppUserProfileCircle(
                    imageUrl:
                        profileNotifier.userProfile?.profilePictureUrl ?? '',
                    errorText: 'NA',
                    radius: 32.r,
                  ),
                  sizedBoxWithHeight(8),
                  Text(
                    profileNotifier.userProfile?.name ?? '',
                    style: AppTextStyles.text14w600,
                  ),
                  if (profileNotifier.userProfile?.tagline?.isNotEmpty ??
                      false) ...{
                    sizedBoxWithHeight(8),
                    Text(
                      profileNotifier.userProfile?.tagline ?? '',
                      style: AppTextStyles.text12w300,
                    ),
                  },
                ],
              ),
            ),
            sizedBoxWithHeight(32),
            const AppDividerMwidget(),
            sizedBoxWithHeight(16),
            Text(
              'Magic AI',
              style: AppTextStyles.text18w600,
            ),
            sizedBoxWithHeight(16),
            sizedBoxWithHeight(16),
            GestureDetector(
              onTap: () {
                context.push(MobileRouter.playgroundRoute);
              },
              child: ListTile(
                leading: Icon(
                  Icons.imagesearch_roller_outlined,
                  color: AppColors.novaDarkIndigo,
                ),
                title: Text(
                  'Astroverse',
                  style: AppTextStyles.text16w700,
                ),
              ),
            ),
            sizedBoxWithHeight(16),
            const AppDividerMwidget(),
            sizedBoxWithHeight(16),

            ///
            ///INTERNSHIP
            ///
            // GestureDetector(
            //   onTap: () {
            //     context.push(MobileRouter.internshipCategoriesRoute);
            //   },
            //   child: ListTile(
            //     leading: Icon(
            //       Icons.category,
            //       color: AppColors.novaDarkIndigo,
            //     ),
            //     title: Text(
            //       'Internships',
            //       style: AppTextStyles.text16w700,
            //     ),
            //   ),
            // ),
            // sizedBoxWithHeight(16),
            // const AppDividerMwidget(),
            // sizedBoxWithHeight(16),
            ///
            ///...
            ///
            // Text(
            //   'Going abroad? Try out our AI SOP Helper!',
            //   style: AppTextStyles.text14w400,
            // ),
            // sizedBoxWithHeight(16),
            // sizedBoxWithHeight(16),
            // GestureDetector(
            //   onTap: () {
            //     context.push(MobileRouter.sopGeneratorRoute);
            //   },
            //   child: ListTile(
            //     leading: Icon(
            //       Icons.short_text,
            //       color: AppColors.novaDarkIndigo,
            //     ),
            //     title: Text(
            //       'SOP Generator',
            //       style: AppTextStyles.text16w700,
            //     ),
            //   ),
            // ),
            // sizedBoxWithHeight(16),
            // const AppDividerMwidget(
            //   thickness: 0.2,
            // ),
            // sizedBoxWithHeight(16),
            // GestureDetector(
            //   onTap: () {
            //     context.push(MobileRouter.sopReviewerRoute);
            //   },
            //   child: ListTile(
            //     leading: Icon(
            //       Icons.analytics,
            //       color: AppColors.novaDarkIndigo,
            //     ),
            //     title: Text(
            //       'SOP Reviewer',
            //       style: AppTextStyles.text16w700,
            //     ),
            //   ),
            // ),
            // sizedBoxWithHeight(16),
            // const AppDividerMwidget(),
            // sizedBoxWithHeight(16),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context.push(MobileRouter.settingsRoute);
              },
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: AppColors.novaDarkIndigo,
                ),
                title: Text(
                  'Settings',
                  style: AppTextStyles.text16w700,
                ),
              ),
            ),
            sizedBoxWithHeight(32),
          ],
        ),
      ),
    );
  }
}
