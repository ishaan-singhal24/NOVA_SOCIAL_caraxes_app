// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/widgets/top/profile_about_mwidget.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/widgets/top/profile_availability_mwidget.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/widgets/top/profile_bio_mwidget.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/widgets/top/profile_connections_mwidget.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/widgets/top/profile_dream_mwidget.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/widgets/top/profile_interests_mwidget.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/widgets/top/profile_social_mwidget.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/widgets/top/profile_first_section_mwidget.dart';
import 'package:nova_social/views/web_view/web_view.dart';
import 'package:provider/provider.dart';
import 'widgets/center/center.dart';

class ProfileMView extends StatefulWidget {
  final ProfileMViewArgs args;
  const ProfileMView({
    super.key,
    required this.args,
  });

  @override
  State<ProfileMView> createState() => _ProfileMViewState();
}

class _ProfileMViewState extends State<ProfileMView> {
  late ProfileMViewArgs arguments;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: ThemeHandler.backgroundColor(),
        body: (widget.args.profile == null ||
                (widget.args.profile?.id?.isEmpty ?? true))
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'This profile doesn\'t exists anymore.',
                      style: AppTextStyles.text16w600,
                    ),
                    sizedBoxWithHeight(32),
                    CustomButton(
                      text: 'Go Back',
                      onPressed: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              )
            : Selector<ProfileNotifier, UserModel?>(
                selector: (p0, p1) => p1.userProfile,
                builder: (context, userProfile, _) {
                  arguments = (widget.args.isCurrentUser ?? false)
                      ? ProfileMViewArgs(
                          isCurrentUser: widget.args.isCurrentUser,
                          profile: userProfile,
                        )
                      : ProfileMViewArgs(
                          isCurrentUser: widget.args.isCurrentUser,
                          profile: widget.args.profile,
                        );
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        //This section contains wallpaper, profile pic, and edit profile button
                        ProfileFirstSectionMWidget(
                          args: arguments,
                        ),
                        Container(
                          color: ThemeHandler.backgroundColor(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //TOP Widgets
                              ProfileBioMWidget(
                                args: arguments,
                              ),
                              ProfileConnectionMWidget(
                                args: arguments,
                              ),
                              ProfileInterestsMWidget(
                                args: arguments,
                              ),
                              ProfileAboutMWidget(
                                args: arguments,
                              ),
                              ProfileSocialMWidget(
                                args: arguments,
                              ),
                              ProfileAvailabilityMWidget(
                                args: arguments,
                              ),
                              ProfileDreamMWidget(
                                args: arguments,
                              ),
                              //CENTER Widgets
                              ProfileCollectionMWidget(
                                args: arguments,
                              ),
                              ProfileActivityMWidget(
                                args: arguments,
                              ),
                              ProfileEducationMWidget(
                                args: arguments,
                              ),
                              ProfileExperienceMWidget(
                                args: arguments,
                              ),
                              ProfileVolunteeredMWidget(
                                args: arguments,
                              ),
                              ProfileAwardsMWidget(
                                args: arguments,
                              ),
                              // ProfileAptitudeMWidget(),
                              ProfileTestScoresMWidget(
                                args: arguments,
                              ),
                              ProfileAddMoreMWidget(
                                args: arguments,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
  // floatingActionButton: (widget.args.isCurrentUser ?? false)
  //     ? Column(
  //         mainAxisAlignment: MainAxisAlignment.end,
  //         children: [
  //           GestureDetector(
  //             onTap: () async {
  //               context.push(
  //                 MobileRouter.notificationRoute,
  //               );
  //             },
  //             child: Container(
  //               padding: EdgeInsets.symmetric(
  //                 vertical: 8.h,
  //                 horizontal: 16.w,
  //               ),
  //               decoration: BoxDecoration(
  //                 color: AppColors.novaDarkIndigo,
  //                 borderRadius: BorderRadius.circular(8.r),
  //               ),
  //               child: Text(
  //                 'Notification',
  //                 style: AppTextStyles.text14w500,
  //               ),
  //             ),
  //           ),
  //           sizedBoxWithHeight(24),
  //           GestureDetector(
  //             onTap: () async {
  //               context.push(
  //                 MobileRouter.tryExploreRoute,
  //               );
  //             },
  //             child: Container(
  //               padding: EdgeInsets.symmetric(
  //                 vertical: 8.h,
  //                 horizontal: 16.w,
  //               ),
  //               decoration: BoxDecoration(
  //                 color: AppColors.novaDarkIndigo,
  //                 borderRadius: BorderRadius.circular(8.r),
  //               ),
  //               child: Text(
  //                 'Maps',
  //                 style: AppTextStyles.text14w500,
  //               ),
  //             ),
  //           ),
  //           sizedBoxWithHeight(24),
  //           GestureDetector(
  //             onTap: () async {
  //               context.push(
  //                 MobileRouter.tryExploreRoute,
  //               );
  //               // GetIt.I.get<ProfileRepository>().sendNoti();
  //             },
  //             child: Container(
  //               padding: EdgeInsets.symmetric(
  //                 vertical: 8.h,
  //                 horizontal: 16.w,
  //               ),
  //               decoration: BoxDecoration(
  //                 color: AppColors.novaDarkIndigo,
  //                 borderRadius: BorderRadius.circular(8.r),
  //               ),
  //               child: Text(
  //                 'Connections',
  //                 style: AppTextStyles.text14w500,
  //               ),
  //             ),
  //           ),
  //           sizedBoxWithHeight(24),
  //         ],
  //       )
  //     : Container(),
}
