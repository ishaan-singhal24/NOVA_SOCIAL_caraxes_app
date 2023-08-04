import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/add_edit_profile.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/body/widgets/common/common.dart';
import 'package:provider/provider.dart';

class ProfileAddMoreToCardsWidget extends StatefulWidget {
  const ProfileAddMoreToCardsWidget({Key? key}) : super(key: key);

  @override
  State<ProfileAddMoreToCardsWidget> createState() =>
      _ProfileAddMoreToCardsWidgetState();
}

class _ProfileAddMoreToCardsWidgetState
    extends State<ProfileAddMoreToCardsWidget> {
  List<Widget> buildAddTileWidgets = [];

  void _addMoreToProfileWidgets(UserModel? user) {
    buildAddTileWidgets = [];
    if (user?.educations?.isEmpty ?? true) {
      buildAddTileWidgets.add(
        ProfileAddTileWidget(
          title: AppStrings.addEducation,
          subTitle: AppStrings.addEducationSubTitle,
          iconImage: AppAssets.educationProfile,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const ProfileAddEditEducation(
                isAdd: true,
              ),
            );
          },
        ),
      );
    }

    if (user?.experiences?.isEmpty ?? true) {
      buildAddTileWidgets.add(
        ProfileAddTileWidget(
          title: AppStrings.addExperience,
          subTitle: AppStrings.addExperienceSubTitle,
          iconImage: AppAssets.medal,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const ProfileAddEditExperience(
                isAdd: true,
              ),
            );
          },
        ),
      );
    }

    if (user?.volunteered?.isEmpty ?? true) {
      buildAddTileWidgets.add(
        ProfileAddTileWidget(
          title: AppStrings.addVolunteeringJobs,
          subTitle: AppStrings.addVolunteeringSubTitle,
          iconImage: AppAssets.victoryHand,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const ProfileAddEditVolunteer(
                isAdd: true,
              ),
            );
          },
        ),
      );
    }

    // if (user?.testScores?.isEmpty ?? true) {
    //   buildAddTileWidgets.add(
    //     ProfileAddTileWidget(
    //       title: AppStrings.addTestScores,
    //       subTitle: AppStrings.addTestScoresSubTitle,
    //       iconImage: AppAssets.hundred,
    //       onTap: () {
    //         showDialog(
    //           context: context,
    //           builder: (context) => const ProfileAddEditTestScores(
    //             isAdd: true,
    //           ),
    //         );
    //       },
    //     ),
    //   );
    // }

    if (user?.awards?.isEmpty ?? true) {
      buildAddTileWidgets.add(
        ProfileAddTileWidget(
          title: AppStrings.addAwards,
          subTitle: AppStrings.addAwardsSubTitle,
          iconImage: AppAssets.trophy,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const ProfileAddEditAwards(
                isAdd: true,
              ),
            );
          },
        ),
      );
    }

    if (user?.aptitudeTests?.isEmpty ?? true) {
      buildAddTileWidgets.add(
        ProfileAddTileWidget(
          title: AppStrings.addAptitudeOrPsychometricTest,
          subTitle: AppStrings.addAptitudeTestSubTitle,
          iconImage: AppAssets.brain,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const ProfileAddEditAptitude(
                isAdd: true,
              ),
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileNotifier>(builder: (context, profieNoti, child) {
      if (profieNoti.isCurrentUser?.not ?? false) return const SizedBox();
      _addMoreToProfileWidgets(profieNoti.userProfile);
      if (buildAddTileWidgets.isEmpty) return const SizedBox();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Add more to your profile..',
                  style: AppTextStyles.text22w500,
                ),
              ),
              sizedBoxWithHeight(8),
            ],
          ),
          StaggeredGrid.count(
            crossAxisCount: 4,
            children: [
              ...buildAddTileWidgets.mapIndexed(
                (index, item) {
                  final isLastIndex = buildAddTileWidgets.length - 1;
                  final isOdd = buildAddTileWidgets.length % 2 != 0;
                  return StaggeredGridTile.count(
                    crossAxisCellCount: isOdd && index == isLastIndex ? 4 : 2,
                    mainAxisCellCount: 1,
                    child: buildAddTileWidgets[index],
                  );
                },
              ).toList(),
            ],
          ),
        ],
      );
    });
  }
}
