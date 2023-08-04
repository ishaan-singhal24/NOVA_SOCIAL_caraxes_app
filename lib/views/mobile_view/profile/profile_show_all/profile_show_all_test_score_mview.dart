import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/widgets/center/center.dart';
import 'package:nova_social/views/mobile_view/profile/profile_show_all/widgets/profile_show_all_app_bar_mwidget.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:provider/provider.dart';

class ProfileShowAllTestScoresMView extends StatefulWidget {
  final ProfileMViewArgs args;
  const ProfileShowAllTestScoresMView({
    super.key,
    required this.args,
  });

  @override
  State<ProfileShowAllTestScoresMView> createState() =>
      _ProfileShowAllTestScoresMViewState();
}

class _ProfileShowAllTestScoresMViewState
    extends State<ProfileShowAllTestScoresMView> {
  @override
  Widget build(BuildContext context) {
    final testScores = widget.args.profile?.testScores;
    if (testScores?.isEmpty ?? true) return const SizedBox();
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
                  title: AppStrings.profileTestScores,
                  isCurrentUser: widget.args.isCurrentUser,
                  add: () {
                    context.push(
                      AddEditMRouter.addEditTestScoreRoute,
                      extra:
                          const ProfileAddEditTestScoreMViewArgs(isAdd: true),
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
                    title: testScores![index].testName,
                    subTitleMutedText: testScores[index].scoredMarks,
                    subSubTitleLeft: 'Conducted by',
                    subSubTitleRight: testScores[index].conductedBy,
                    relatedLink: testScores[index].relatedLink,
                    description: testScores[index].description,
                    fromDate: 'Conducted date',
                    toDate: testScores[index].testDate?.abrMMMyyyy,
                    onEdit: () {
                      context.push(
                        AddEditMRouter.addEditTestScoreRoute,
                        extra: ProfileAddEditTestScoreMViewArgs(
                          isAdd: false,
                          editTestScore: testScores[index],
                          editIndex: index,
                        ),
                      );
                    },
                  ),
                  separatorBuilder: (_, __) => sizedBoxWithHeight(48),
                  itemCount: testScores?.length ?? 0,
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
