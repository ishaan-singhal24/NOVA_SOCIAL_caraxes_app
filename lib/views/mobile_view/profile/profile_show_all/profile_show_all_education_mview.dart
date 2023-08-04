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

class ProfileShowAllEducationMView extends StatefulWidget {
  final ProfileMViewArgs args;
  const ProfileShowAllEducationMView({
    super.key,
    required this.args,
  });

  @override
  State<ProfileShowAllEducationMView> createState() =>
      _ProfileShowAllEducationMViewState();
}

class _ProfileShowAllEducationMViewState
    extends State<ProfileShowAllEducationMView> {
  @override
  Widget build(BuildContext context) {
    final educations = widget.args.profile?.educations;
    if (educations?.isEmpty ?? true) return const SizedBox();
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
                  title: 'Education',
                  isCurrentUser: widget.args.isCurrentUser,
                  add: () {
                    context.push(
                      AddEditMRouter.addEditEducationRoute,
                      extra:
                          const ProfileAddEditEducationMViewArgs(isAdd: true),
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
                    title: educations?[index].school,
                    subTitleNearWebsite: educations?[index].degree,
                    description: educations?[index].description,
                    fromDate: educations?[index].startDate?.abrMMMyyyy,
                    toDate: (educations?[index].currentlyStudyHere ?? false)
                        ? 'Studying'
                        : educations?[index].endDate?.abrMMMyyyy,
                    duration: DateTimeFormatter.timeDurationCalculator(
                        educations?[index].startDate,
                        educations?[index].endDate),
                    location: educations?[index].location,
                    iconAssetLink: AppAssets.educationLogo,
                    onEdit: () {
                      context.push(
                        AddEditMRouter.addEditEducationRoute,
                        extra: ProfileAddEditEducationMViewArgs(
                          isAdd: false,
                          editEducation: educations?[index],
                          editIndex: index,
                        ),
                      );
                    },
                  ),
                  separatorBuilder: (_, __) => sizedBoxWithHeight(48),
                  itemCount: educations?.length ?? 0,
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
