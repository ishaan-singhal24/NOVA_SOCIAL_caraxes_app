import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
import 'package:nova_social/routes/mobile/show_all_routes.dart/show_all_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/formatter/time_duration_calculator.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/widgets/center/common/common.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

class ProfileExperienceMWidget extends StatelessWidget {
  final ProfileMViewArgs args;
  const ProfileExperienceMWidget({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final experiences = args.profile?.experiences;
    if (experiences?.isEmpty ?? true) return const SizedBox();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        children: [
          ProfileSubHeadMTile(
            title: AppStrings.experienceHead,
            isCurrentUser: args.isCurrentUser,
            onAdd: () {
              context.push(
                AddEditMRouter.addEditExperienceRoute,
                extra: const ProfileAddEditExperienceMViewArgs(isAdd: true),
              );
            },
            onEdit: () {
              context.push(
                ShowAllMRouter.showAllExperiencesRoute,
                extra: args,
              );
            },
          ),
          sizedBoxWithHeight(40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, indx) => sizedBoxWithHeight(24),
                itemBuilder: (ctx, index) {
                  String imageAssetPath;
                  Color tagColor;
                  String tagName;
                  if (experiences![index].subTag ==
                      ExperienceSubtag.Leadership) {
                    tagName = 'Leadership';
                    tagColor = AppColors.novaMatPink.withOpacity(0.5);
                    imageAssetPath = AppAssets.educationLogo;
                  } else if (experiences[index].subTag ==
                      ExperienceSubtag.Work) {
                    tagName = 'Work';
                    tagColor = AppColors.novaBrown.withOpacity(0.5);
                    imageAssetPath = AppAssets.workLogo;
                  } else {
                    tagName = 'Athletics';
                    tagColor = AppColors.novaMatGreen.withOpacity(0.6);
                    imageAssetPath = AppAssets.athleticsLogo;
                  }
                  return ProfileDataItemMTile(
                    index: index,
                    isCurrentUser: args.isCurrentUser,
                    title: experiences[index].company,
                    subTitleNearWebsite: experiences[index].jobTitle,
                    websiteNearTitle: experiences[index].website,
                    description: experiences[index].description,
                    fromDate:
                        experiences[index].startDate?.abrMMMyyyy.toString(),
                    toDate: (experiences[index].currentlyWorkingHere ?? false)
                        ? 'Present'
                        : experiences[index].endDate?.abrMMMyyyy.toString(),
                    duration: DateTimeFormatter.timeDurationCalculator(
                        experiences[index].startDate,
                        experiences[index].endDate),
                    location: experiences[index].location,
                    iconAssetLink: imageAssetPath,
                    relatedTag: tagName,
                    relatedTagColor: tagColor,
                  );
                },
                itemCount: experiences!.length,
              ),
              if ((experiences.length) > 2) ...{
                sizedBoxWithHeight(40),
                ProfileShowAllItemMTile(
                  itemCount: experiences.length,
                  itemName: 'experiences',
                  open: () {
                    context.push(
                      ShowAllMRouter.showAllExperiencesRoute,
                      extra: args,
                    );
                  },
                ),
              },
              sizedBoxWithHeight(24),
              const AppDividerMwidget(),
              sizedBoxWithHeight(24),
            ],
          ),
        ],
      ),
    );
  }
}
