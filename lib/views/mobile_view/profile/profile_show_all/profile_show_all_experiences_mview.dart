import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/formatter/time_duration_calculator.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/widgets/center/center.dart';
import 'package:nova_social/views/mobile_view/profile/profile_show_all/widgets/profile_show_all_app_bar_mwidget.dart';
import 'package:provider/provider.dart';

class ProfileShowAllExperiencesMView extends StatefulWidget {
  final ProfileMViewArgs args;
  const ProfileShowAllExperiencesMView({
    super.key,
    required this.args,
  });

  @override
  State<ProfileShowAllExperiencesMView> createState() =>
      _ProfileShowAllExperiencesMViewState();
}

class _ProfileShowAllExperiencesMViewState
    extends State<ProfileShowAllExperiencesMView> {
  ExperienceSubtag? subtag = ExperienceSubtag.Work;

  @override
  Widget build(BuildContext context) {
    final experiences = widget.args.profile?.experiences;
    if (experiences?.isEmpty ?? true) return const SizedBox();
    final filteredExp =
        experiences?.where((element) => element.subTag == subtag).toList() ??
            [];
    // if (filteredExp.isEmpty) return const SizedBox();
    String imageAssetPath;
    if (subtag == ExperienceSubtag.Leadership) {
      imageAssetPath = AppAssets.educationLogo;
    } else if (subtag == ExperienceSubtag.Work) {
      imageAssetPath = AppAssets.workLogo;
    } else {
      imageAssetPath = AppAssets.athleticsLogo;
    }
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sizedBoxWithHeight(36),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: ProfileShowAllAppBarMWidget(
                  title: 'Experience',
                  isCurrentUser: widget.args.isCurrentUser,
                  add: () {
                    context.push(
                      AddEditMRouter.addEditExperienceRoute,
                      extra:
                          const ProfileAddEditExperienceMViewArgs(isAdd: true),
                    );
                  },
                ),
              ),
              sizedBoxWithHeight(36),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            subtag = ExperienceSubtag.Work;
                          });
                        },
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: subtag == ExperienceSubtag.Work
                                      ? AppColors.novaDarkIndigo
                                      : ThemeHandler.backgroundColor(),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Work',
                                  style: subtag == ExperienceSubtag.Work
                                      ? AppTextStyles.text16w800
                                      : AppTextStyles.text16w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    sizedBoxWithWidth(8),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            subtag = ExperienceSubtag.Leadership;
                          });
                        },
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: subtag == ExperienceSubtag.Leadership
                                      ? AppColors.novaDarkIndigo
                                      : ThemeHandler.backgroundColor(),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Leadership',
                                  style: subtag == ExperienceSubtag.Leadership
                                      ? AppTextStyles.text16w800
                                      : AppTextStyles.text16w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    sizedBoxWithWidth(8),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            subtag = ExperienceSubtag.Athletic;
                          });
                        },
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: subtag == ExperienceSubtag.Athletic
                                      ? AppColors.novaDarkIndigo
                                      : ThemeHandler.backgroundColor(),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Athletic',
                                  style: subtag == ExperienceSubtag.Athletic
                                      ? AppTextStyles.text16w800
                                      : AppTextStyles.text16w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sizedBoxWithHeight(36),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ProfileDataItemMTile(
                      index: index,
                      isCurrentUser: widget.args.isCurrentUser,
                      title: filteredExp[index].company,
                      subTitleNearWebsite: filteredExp[index].jobTitle,
                      websiteNearTitle: filteredExp[index].website,
                      description: filteredExp[index].description,
                      fromDate:
                          filteredExp[index].startDate?.abrMMMyyyy.toString(),
                      toDate: (filteredExp[index].currentlyWorkingHere ?? false)
                          ? 'Present'
                          : filteredExp[index].endDate?.abrMMMyyyy.toString(),
                      duration: DateTimeFormatter.timeDurationCalculator(
                          filteredExp[index].startDate,
                          filteredExp[index].endDate),
                      location: filteredExp[index].location,
                      iconAssetLink: imageAssetPath,
                      onEdit: () {
                        context.push(
                          AddEditMRouter.addEditExperienceRoute,
                          extra: ProfileAddEditExperienceMViewArgs(
                            isAdd: false,
                            editExperience: filteredExp[index],
                            editIndex: index,
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (_, __) => sizedBoxWithHeight(48),
                  itemCount: filteredExp.length,
                ),
              ),
              sizedBoxWithHeight(36),
            ],
          ),
        ),
      ),
    );
  }
}
