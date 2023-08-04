import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/auth/auth_notifier.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/formatter/time_duration_calculator.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/add_edit_profile.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/body/widgets/common/common.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/body/widgets/common/profile_sub_head_tile.dart';
import 'package:provider/provider.dart';

class ProfileVolunteeredWidget extends StatelessWidget {
  const ProfileVolunteeredWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileNotifier>(
      builder: (context, profleNoti, child) {
        final volunteered = profleNoti.profileAsPerRoute()?.volunteered;
        if (volunteered?.isEmpty ?? true) return const SizedBox();
        return SizedBox(
          child: Column(
            children: [
              ProfileSubHeadTile(
                iconUrl: AppAssets.victoryHand,
                headText: AppStrings.volunteering,
                buttonText: AppStrings.addVolunteeringJobs,
                onButtonPress: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ProfileAddEditVolunteer(
                      isAdd: true,
                    ),
                  );
                },
              ),
              sizedBoxWithHeight(16),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 24.w),
                decoration: BoxDecoration(
                  color: ThemeHandler.backgroundColor(),
                  // border: Border.all(
                  //   width: 0.3,
                  //   color: ThemeHandler.widgetColor(),
                  // ),
                  // borderRadius: BorderRadius.circular(16.r),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ProfileDataItemTileWidget(
                    index: index,
                    title: volunteered?[index].title,
                    subTitle: volunteered?[index].organization,
                    subTitleWebsite: volunteered?[index].website,
                    description: volunteered?[index].description,
                    fromDate: volunteered?[index].startDate?.abrMMMyyyy,
                    toDate: (volunteered?[index].currentlyVolunteering ?? false)
                        ? 'Volunteering'
                        : volunteered?[index].endDate?.abrMMMyyyy,
                    duration: DateTimeFormatter.timeDurationCalculator(
                        volunteered?[index].startDate,
                        volunteered?[index].endDate),
                    icon: Iconsax.people,
                    imageAssetPath: AppAssets.volunteeringLogo,
                    onIconPress: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ProfileAddEditVolunteer(
                            isAdd: false,
                            editingIndex: index,
                          );
                        },
                      );
                    },
                  ),
                  separatorBuilder: (_, __) => sizedBoxWithHeight(24),
                  itemCount: volunteered?.length ?? 0,
                ),
              ),
              sizedBoxWithHeight(16),
              Divider(
                color: ThemeHandler.novaMutedColor(),
                thickness: 0.2,
              ),
              sizedBoxWithHeight(16),
            ],
          ),
        );
      },
    );
  }
}
