import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';

class ProfileAddMoreMWidget extends StatefulWidget {
  final ProfileMViewArgs args;
  const ProfileAddMoreMWidget({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  State<ProfileAddMoreMWidget> createState() => _ProfileAddMoreMWidgetState();
}

class _ProfileAddMoreMWidgetState extends State<ProfileAddMoreMWidget> {
  List<Widget> buildAddTileWidgets = [];

  void _addMoreToProfileWidgets(UserModel? user) {
    buildAddTileWidgets = [];
    if (user?.educations?.isEmpty ?? true) {
      buildAddTileWidgets.add(
        ProfileAddMTile(
          title: AppStrings.addEducation,
          subTitle: AppStrings.addEducationSubTitle,
          iconPath: AppAssets.educationProfile,
          onTap: () {
            context.push(
              AddEditMRouter.addEditEducationRoute,
              extra: const ProfileAddEditEducationMViewArgs(isAdd: true),
            );
          },
        ),
      );
    }

    if (user?.experiences?.isEmpty ?? true) {
      buildAddTileWidgets.add(
        ProfileAddMTile(
          title: AppStrings.addExperience,
          subTitle: AppStrings.addExperienceSubTitle,
          iconPath: AppAssets.medal,
          onTap: () {
            context.push(
              AddEditMRouter.addEditExperienceRoute,
              extra: const ProfileAddEditExperienceMViewArgs(isAdd: true),
            );
          },
        ),
      );
    }

    if (user?.volunteered?.isEmpty ?? true) {
      buildAddTileWidgets.add(
        ProfileAddMTile(
          title: AppStrings.addVolunteeringJobs,
          subTitle: AppStrings.addVolunteeringSubTitle,
          iconPath: AppAssets.victoryHand,
          onTap: () {
            context.push(
              AddEditMRouter.addEditVolenteerRoute,
              extra: const ProfileAddEditVolunteeredMViewArgs(isAdd: true),
            );
          },
        ),
      );
    }

    if (user?.testScores?.isEmpty ?? true) {
      buildAddTileWidgets.add(
        ProfileAddMTile(
          title: AppStrings.addTestScores,
          subTitle: AppStrings.addTestScoresSubTitle,
          iconPath: AppAssets.hundred,
          onTap: () {
            context.push(
              AddEditMRouter.addEditTestScoreRoute,
              extra: const ProfileAddEditTestScoreMViewArgs(isAdd: true),
            );
          },
        ),
      );
    }

    if (user?.awards?.isEmpty ?? true) {
      buildAddTileWidgets.add(
        ProfileAddMTile(
          title: AppStrings.addAwards,
          subTitle: AppStrings.addAwardsSubTitle,
          iconPath: AppAssets.trophy,
          onTap: () {
            context.push(
              AddEditMRouter.addEditAwardRoute,
              extra: const ProfileAddEditAwardMViewArgs(isAdd: true),
            );
          },
        ),
      );
    }

    // if (user?.aptitudeTests?.isEmpty ?? true) {
    //   buildAddTileWidgets.add(
    //     ProfileAddMTile(
    //       title: AppStrings.addAptitudeOrPsychometricTest,
    //       subTitle: AppStrings.addAptitudeTestSubTitle,
    //       iconPath: AppAssets.brain,
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.args.isCurrentUser?.not ?? true) {
      return const SizedBox();
    }
    _addMoreToProfileWidgets(widget.args.profile);
    if (buildAddTileWidgets.isEmpty) return const SizedBox();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add more to your profile..',
            style: AppTextStyles.text20w500,
          ),
          sizedBoxWithHeight(16),
          ...buildAddTileWidgets.mapIndexed(
            (index, item) {
              return buildAddTileWidgets[index];
            },
          ).toList(),
        ],
      ),
    );
  }
}

class ProfileAddMTile extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? iconPath;
  final Function()? onTap;
  const ProfileAddMTile({
    super.key,
    this.title,
    this.subTitle,
    this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                iconPath ?? '',
                height: 48.h,
              ),
              sizedBoxWithWidth(16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBoxWithHeight(8),
                    Text(
                      title ?? '',
                      style: AppTextStyles.text16w600,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    sizedBoxWithHeight(8),
                    Text(
                      subTitle ?? '',
                      maxLines: 3,
                      style: AppTextStyles.text14w300,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          sizedBoxWithHeight(16),
        ],
      ),
    );
  }
}
