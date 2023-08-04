import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
import 'package:nova_social/routes/mobile/show_all_routes.dart/show_all_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/widgets/center/common/common.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

class ProfileTestScoresMWidget extends StatelessWidget {
  final ProfileMViewArgs args;
  const ProfileTestScoresMWidget({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final testScores = args.profile?.testScores;
    if (testScores?.isEmpty ?? true) return const SizedBox();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: SizedBox(
        child: Column(
          children: [
            ProfileSubHeadMTile(
              title: AppStrings.profileTestScores,
              isCurrentUser: args.isCurrentUser,
              onAdd: () {
                context.push(
                  AddEditMRouter.addEditTestScoreRoute,
                  extra: const ProfileAddEditTestScoreMViewArgs(isAdd: true),
                );
              },
              onEdit: () {
                context.push(
                  ShowAllMRouter.showAllTestScoresRoute,
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
                title: testScores![index].testName,
                subTitleMutedText: testScores[index].scoredMarks,
                subSubTitleLeft: 'Conducted by',
                subSubTitleRight: testScores[index].conductedBy,
                relatedLink: testScores[index].relatedLink,
                description: testScores[index].description,
                fromDate: 'Conducted date',
                toDate: testScores[index].testDate?.abrMMMyyyy,
              ),
              separatorBuilder: (_, __) => sizedBoxWithHeight(48),
              itemCount:
                  (testScores?.length ?? 0) > 2 ? 2 : (testScores?.length ?? 0),
            ),
            if ((testScores?.length ?? 0) > 2) ...{
              sizedBoxWithHeight(40),
              ProfileShowAllItemMTile(
                itemCount: testScores!.length,
                itemName: 'test scores',
                open: () {
                  context.push(
                    ShowAllMRouter.showAllTestScoresRoute,
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
