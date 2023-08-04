import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
import 'package:nova_social/routes/mobile/show_all_routes.dart/show_all_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/formatter/time_duration_calculator.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/widgets/center/common/common.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

class ProfileEducationMWidget extends StatelessWidget {
  final ProfileMViewArgs args;
  const ProfileEducationMWidget({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final educations = args.profile?.educations;
    if (educations?.isEmpty ?? true) return const SizedBox();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: SizedBox(
        child: Column(
          children: [
            ProfileSubHeadMTile(
              title: AppStrings.education,
              isCurrentUser: args.isCurrentUser,
              onAdd: () {
                context.push(
                  AddEditMRouter.addEditEducationRoute,
                  extra: const ProfileAddEditEducationMViewArgs(isAdd: true),
                );
              },
              onEdit: () {
                context.push(
                  ShowAllMRouter.showAllEducationRoute,
                  extra: args,
                );
              },
            ),
            sizedBoxWithHeight(40),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ProfileDataItemMTile(
                index: index,
                isCurrentUser: args.isCurrentUser,
                title: educations?[index].school,
                subTitleNearWebsite: educations?[index].degree,
                description: educations?[index].description,
                fromDate: educations?[index].startDate?.abrMMMyyyy,
                toDate: (educations?[index].currentlyStudyHere ?? false)
                    ? 'Studying'
                    : educations?[index].endDate?.abrMMMyyyy,
                duration: DateTimeFormatter.timeDurationCalculator(
                    educations?[index].startDate, educations?[index].endDate),
                location: educations?[index].location,
                iconAssetLink: AppAssets.educationLogo,
              ),
              separatorBuilder: (_, __) => sizedBoxWithHeight(48),
              itemCount:
                  (educations?.length ?? 0) > 2 ? 2 : (educations?.length ?? 0),
            ),
            if ((educations?.length ?? 0) > 2) ...{
              sizedBoxWithHeight(40),
              ProfileShowAllItemMTile(
                itemCount: educations!.length,
                itemName: 'educations',
                open: () {
                  context.push(
                    ShowAllMRouter.showAllEducationRoute,
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
      ),
    );
  }
}
