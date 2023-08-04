import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/formatter/time_duration_calculator.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/widgets/center/center.dart';
import 'package:nova_social/views/mobile_view/profile/profile_show_all/widgets/profile_show_all_app_bar_mwidget.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:provider/provider.dart';

class ProfileShowAllVolunteerMView extends StatefulWidget {
  final ProfileMViewArgs args;
  const ProfileShowAllVolunteerMView({
    super.key,
    required this.args,
  });

  @override
  State<ProfileShowAllVolunteerMView> createState() =>
      _ProfileShowAllVolunteerMViewState();
}

class _ProfileShowAllVolunteerMViewState
    extends State<ProfileShowAllVolunteerMView> {
  @override
  Widget build(BuildContext context) {
    final volunteered = widget.args.profile?.volunteered;
    if (volunteered?.isEmpty ?? true) return const SizedBox();
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
                  title: 'Volunteer',
                  isCurrentUser: widget.args.isCurrentUser,
                  add: () {
                    context.push(
                      AddEditMRouter.addEditVolenteerRoute,
                      extra:
                          const ProfileAddEditVolunteeredMViewArgs(isAdd: true),
                    );
                  },
                ),
              ),
              sizedBoxWithHeight(36),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ProfileDataItemMTile(
                    index: index,
                    isCurrentUser: widget.args.isCurrentUser,
                    title: volunteered?[index].title,
                    subTitleNearWebsite: volunteered?[index].organization,
                    website: volunteered?[index].website,
                    fromDate: volunteered?[index].startDate?.abrMMMyyyy,
                    toDate: (volunteered?[index].currentlyVolunteering ?? false)
                        ? 'Volunteering'
                        : volunteered?[index].endDate?.abrMMMyyyy,
                    duration: DateTimeFormatter.timeDurationCalculator(
                        volunteered?[index].startDate,
                        volunteered?[index].endDate),
                    iconAssetLink: AppAssets.volunteeringLogo,
                    onEdit: () {
                      context.push(
                        AddEditMRouter.addEditVolenteerRoute,
                        extra: ProfileAddEditVolunteeredMViewArgs(
                          isAdd: false,
                          editVolunteer: volunteered?[index],
                          editIndex: index,
                        ),
                      );
                    },
                  ),
                  separatorBuilder: (_, __) => sizedBoxWithHeight(48),
                  itemCount: volunteered?.length ?? 0,
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
