import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/add_edit_profile.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/profile_add_edit_test_scores.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/body/widgets/common/common.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/body/widgets/common/profile_sub_head_tile.dart';
import 'package:provider/provider.dart';

class ProfileTestScoresWidget extends StatelessWidget {
  const ProfileTestScoresWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileNotifier>(
      builder: (context, profileNoti, child) {
        final testScores = profileNoti.profileAsPerRoute()?.testScores;
        if (testScores?.isEmpty ?? true) return const SizedBox();
        return SizedBox(
          child: Column(
            children: [
              ProfileSubHeadTile(
                buttonText: AppStrings.addTestScores,
                headText: AppStrings.profileTestScores,
                iconUrl: AppAssets.hundred,
                onButtonPress: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ProfileAddEditTestScores(
                      isAdd: true,
                    ),
                  );
                },
              ),
              sizedBoxWithHeight(16),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 24.w),
                decoration: BoxDecoration(
                  color: ThemeHandler.backgroundColor(),
                  // border: Border.all(
                  //   width: 0.3,
                  //   color: ThemeHandler.widgetColor(),
                  // ),
                  // borderRadius: BorderRadius.circular(16.r),
                ),
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ProfileDataItemTileWidget(
                          index: index,
                          title: testScores![index].testName,
                          subTitlePrefix:
                              '${testScores[index].scoredMarks}/${testScores[index].maxMarks}',
                          subTitle: '',
                          subTitleWebsite: testScores[index].website,
                          description: testScores[index].description,
                          fromDate: 'Issue date',
                          toDate: testScores[index].testDate?.abrMMMyyyy,
                          icon: Iconsax.document,
                          onIconPress: () {
                            showDialog(
                              context: context,
                              builder: (context) => ProfileAddEditTestScores(
                                isAdd: false,
                                editingIndex: index,
                              ),
                            );
                          },
                        ),
                    separatorBuilder: (_, __) => sizedBoxWithHeight(24),
                    itemCount: testScores?.length ?? 0),
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

// class ProfileTestScores extends StatelessWidget {
//   const ProfileTestScores({Key? key}) : super(key: key);

//   Widget _buildTestScoresListTile(
//       bool kIsLargeScreen, UserTestScores userTestScore) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           alignment: Alignment.center,
//           height: kIsLargeScreen ? 56.h : 48.h,
//           width: kIsLargeScreen ? 16.w : 48.w,
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: AppColors.novaDarkGreen,
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
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     userTestScore.testName ?? '',
//                     style: AppTextStyles.text14w600,
//                   ),
//                   Text(
//                     '${userTestScore.scoredMarks}/${userTestScore.maxMarks}',
//                     style: AppTextStyles.text12w400,
//                   ),
//                   sizedBoxWithHeight(4),
//                   Text(
//                     '${userTestScore.testDate?.abrMMMyyyy}',
//                     style: AppTextStyles.text10w400,
//                   ),
//                 ],
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
//     final notifier = Provider.of<AuthNotifier>(context);
//     final testScores = notifier.userProfile?.testScores;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Row(
//           children: [
//             Text(
//               'Test Scores',
//               style: AppTextStyles.text16w700,
//             ),
//             const Spacer(),
//             InkWell(
//               hoverColor: AppColors.novaLightMutedPlus,
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) => const AddEditTestScores(
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
//         ListView.separated(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           separatorBuilder: (_, indx) => sizedBoxWithHeight(16),
//           itemBuilder: (ctx, index) {
//             return Row(
//               children: [
//                 Expanded(
//                   child: _buildTestScoresListTile(
//                     kIsLargeScreen,
//                     testScores![index],
//                   ),
//                 ),
//                 InkWell(
//                   hoverColor: AppColors.novaLightMutedPlus,
//                   onTap: () {
//                     showDialog(
//                       context: context,
//                       builder: (context) => AddEditTestScores(
//                         isAdd: false,
//                         editingIndex: index,
//                       ),
//                     );
//                   },
//                   child: Icon(
//                     Icons.edit,
//                     size: 16,
//                     color: AppColors.novaDarkMuted,
//                   ),
//                 ),
//               ],
//             );
//           },
//           itemCount: testScores?.length ?? 0,
//         ),
//       ],
//     );
//   }
// }
