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

class ProfileVolunteeredMWidget extends StatelessWidget {
  final ProfileMViewArgs args;
  const ProfileVolunteeredMWidget({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final volunteered = args.profile?.volunteered;
    if (volunteered?.isEmpty ?? true) return const SizedBox();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: SizedBox(
        child: Column(
          children: [
            ProfileSubHeadMTile(
              title: AppStrings.volunteering,
              isCurrentUser: args.isCurrentUser,
              onAdd: () {
                context.push(
                  AddEditMRouter.addEditVolenteerRoute,
                  extra: const ProfileAddEditVolunteeredMViewArgs(isAdd: true),
                );
              },
              onEdit: () {
                context.push(
                  ShowAllMRouter.showAllVolunteeredRoute,
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
                title: volunteered?[index].title,
                subTitleNearWebsite: volunteered?[index].organization,
                website: volunteered?[index].website,
                description: volunteered?[index].description,
                fromDate: volunteered?[index].startDate?.abrMMMyyyy,
                toDate: (volunteered?[index].currentlyVolunteering ?? false)
                    ? 'Volunteering'
                    : volunteered?[index].endDate?.abrMMMyyyy,
                duration: DateTimeFormatter.timeDurationCalculator(
                    volunteered?[index].startDate, volunteered?[index].endDate),
                iconAssetLink: AppAssets.volunteeringLogo,
              ),
              separatorBuilder: (_, __) => sizedBoxWithHeight(48),
              itemCount: (volunteered?.length ?? 0) > 2
                  ? 2
                  : (volunteered?.length ?? 0),
            ),
            if ((volunteered?.length ?? 0) > 2) ...{
              sizedBoxWithHeight(40),
              ProfileShowAllItemMTile(
                itemCount: volunteered!.length,
                itemName: 'volunteering work',
                open: () {
                  context.push(
                    ShowAllMRouter.showAllVolunteeredRoute,
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
