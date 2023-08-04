import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/formatter/time_duration_calculator.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/add_edit_profile.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/widgets/add_edit_toggle_form_widget.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/body/widgets/common/profile_data_item_tile_widget.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/body/widgets/common/profile_sub_head_tile.dart';
import 'package:provider/provider.dart';

class ProfileExperienceWidget extends StatelessWidget {
  const ProfileExperienceWidget({Key? key}) : super(key: key);
  Widget _buildList({
    required BuildContext context,
    required List<Experience> experiences,
    required List<Experience> allExperiences,
    required String subTag,
  }) {
    var imageAssetPath;
    if (subTag == AppStrings.profileExpLeadershipTag) {
      imageAssetPath = AppAssets.educationLogo;
    } else if (subTag == AppStrings.profileExpWorkTag) {
      imageAssetPath = AppAssets.workLogo;
    } else {
      imageAssetPath = AppAssets.athleticsLogo;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 16.w,
          ),
          child: AddEditToggleFormWidget(
            showDivider: false,
            items: [subTag],
            selected: 0,
            align: MainAxisAlignment.start,
            fixWidth: 160.w,
            textStyle: AppTextStyles.text16w600,
          ),
        ),
        sizedBoxWithHeight(24),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, indx) => sizedBoxWithHeight(24),
          itemBuilder: (ctx, index) {
            int editingIndex = allExperiences.indexOf(experiences[index]);
            return ProfileDataItemTileWidget(
              onIconPress: () {
                showDialog(
                  context: context,
                  builder: (context) => ProfileAddEditExperience(
                    isAdd: false,
                    editingIndex: editingIndex,
                  ),
                );
              },
              index: index,
              title: experiences[index].company,
              subTitle: experiences[index].jobTitle,
              titleWebsite: experiences[index].website,
              description: experiences[index].description,
              fromDate: experiences[index].startDate?.abrMMMyyyy.toString(),
              toDate: (experiences[index].currentlyWorkingHere ?? false)
                  ? 'Present'
                  : experiences[index].endDate?.abrMMMyyyy.toString(),
              duration: DateTimeFormatter.timeDurationCalculator(
                  experiences[index].startDate, experiences[index].endDate),
              location: experiences[index].location,
              imageAssetPath: imageAssetPath,
            );
          },
          itemCount: experiences.length,
        ),
        sizedBoxWithHeight(24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileNotifier>(
      builder: (context, profileNoti, child) {
        final experiences = profileNoti.profileAsPerRoute()?.experiences;
        if (experiences?.isEmpty ?? true) return const SizedBox();
        final List<Experience>? workExperience = experiences
            ?.where((element) =>
                element.subTag == null ||
                element.subTag == AppStrings.profileExpWorkTag)
            .toList();
        final List<Experience>? leadershipExperience = experiences
            ?.where((element) =>
                element.subTag == AppStrings.profileExpLeadershipTag)
            .toList();
        final List<Experience>? athleticExperience = experiences
            ?.where(
                (element) => element.subTag == AppStrings.profileExpAthleticTag)
            .toList();
        return SizedBox(
          child: Column(
            children: [
              ProfileSubHeadTile(
                iconUrl: AppAssets.medal,
                headText: AppStrings.experienceHead,
                buttonText: AppStrings.addExperience,
                onButtonPress: () {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return const ProfileAddEditExperience(
                        isAdd: true,
                      );
                    },
                  );
                },
              ),
              sizedBoxWithHeight(16),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: ThemeHandler.backgroundColor(),
                ),
                child: Column(
                  children: [
                    if (workExperience != null && workExperience.isNotEmpty)
                      _buildList(
                        context: context,
                        experiences: workExperience,
                        allExperiences: experiences!,
                        subTag: AppStrings.profileExpWorkTag,
                      ),
                    if (leadershipExperience != null &&
                        leadershipExperience.isNotEmpty)
                      _buildList(
                        context: context,
                        experiences: leadershipExperience,
                        allExperiences: experiences!,
                        subTag: AppStrings.profileExpLeadershipTag,
                      ),
                    if (athleticExperience != null &&
                        athleticExperience.isNotEmpty)
                      _buildList(
                        context: context,
                        experiences: athleticExperience,
                        allExperiences: experiences!,
                        subTag: AppStrings.profileExpAthleticTag,
                      ),
                  ],
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

// class ProfileExperienceWidget extends StatelessWidget {
//   const ProfileExperienceWidget({Key? key}) : super(key: key);

//   Widget _buildExperienceListTile(bool kIsLargeScreen, Experience experience) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           alignment: Alignment.center,
//           height: kIsLargeScreen ? 56.h : 48.h,
//           width: kIsLargeScreen ? 16.w : 48.w,
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: AppColors.novaSkyBlue,
//             ),
//             borderRadius: BorderRadius.circular(4.r),
//           ),
//           // child: Image.asset(
//           //   '',
//           // ),
//         ),
//         sizedBoxWithWidth(8),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         experience.jobTitle ?? '',
//                         style: AppTextStyles.text14w600,
//                       ),
//                       Text(
//                         experience.company ?? '',
//                         style: AppTextStyles.text12w400,
//                       ),
//                       sizedBoxWithHeight(4),
//                       Text(
//                         '${experience.startDate?.abrMMMyyyy} - ${experience.currentlyWorkingHere == true ? 'Present' : experience.endDate?.abrMMMyyyy}',
//                         style: AppTextStyles.text10w400,
//                       ),
//                     ],
//                   ),
//                   const Spacer(),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 16.0),
//                     child: Text(
//                       experience.location ?? '',
//                       style: AppTextStyles.text10w400,
//                     ),
//                   ),
//                 ],
//               ),
//               sizedBoxWithHeight(16),
//               Padding(
//                 padding: const EdgeInsets.only(right: 16.0),
//                 child: ExpandableTextWidget(
//                   text: experience.description ?? '',
//                   textStyle: AppTextStyles.text12w400,
//                   maxLength: kIsLargeScreen ? 200 : null,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bool kIsLargeScreen = !ResponsiveWidget.isSmallScreen();

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Row(
//           children: [
//             Text(
//               'Experience',
//               style: AppTextStyles.text16w700,
//             ),
//             const Spacer(),
//             InkWell(
//               hoverColor: AppColors.novaLightMutedPlus,
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) => const AddEditExperience(
//                     isAdd: true,
//                   ),
//                 );
//               },
//               child: Icon(
//                 Icons.add,
//                 size: 16,
//                 color: AppColors.novaDarkMuted,
//               ),
//             ),
//           ],
//         ),
//         sizedBoxWithHeight(8),
//       ],
//     );
//   }
// }
