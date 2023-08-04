import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/add_edit_profile.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/profile_add_edit_awards.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/profile_add_edit_test_scores.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/body/widgets/common/profile_data_item_tile_widget.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/body/widgets/common/profile_sub_head_tile.dart';
import 'package:provider/provider.dart';

class ProfileAwardsWidget extends StatelessWidget {
  const ProfileAwardsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileNotifier>(
      builder: (context, profileNoti, child) {
        final awards = profileNoti.profileAsPerRoute()?.awards;
        if (awards?.isEmpty ?? true) return const SizedBox();
        return SizedBox(
          child: Column(
            children: [
              ProfileSubHeadTile(
                buttonText: AppStrings.addAwards,
                headText: AppStrings.profileAwards,
                iconUrl: AppAssets.trophy,
                onButtonPress: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ProfileAddEditAwards(
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
                          title: awards![index].name,
                          subTitlePrefix: 'Issued By ',
                          subTitle: awards[index].issuedBy,
                          subTitleWebsite: awards[index].website,
                          description: awards[index].description,
                          fromDate: 'Issue date',
                          toDate: awards[index].issueDate?.abrMMMyyyy,
                          icon: Iconsax.award,
                          imageAssetPath: AppAssets.awardsLogo,
                          onIconPress: () {
                            showDialog(
                              context: context,
                              builder: (context) => ProfileAddEditAwards(
                                isAdd: false,
                                editingIndex: index,
                              ),
                            );
                          },
                        ),
                    separatorBuilder: (_, __) => sizedBoxWithHeight(24),
                    itemCount: awards?.length ?? 0),
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

// class ProfileAwards extends StatelessWidget {
//   const ProfileAwards({Key? key}) : super(key: key);

//   Widget _buildAwardsListTile(bool kIsLargeScreen, Award award) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           alignment: Alignment.center,
//           height: kIsLargeScreen ? 56.h : 48.h,
//           width: kIsLargeScreen ? 16.w : 48.w,
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: AppColors.novaPink,
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
//                     award.name ?? '',
//                     style: AppTextStyles.text14w600,
//                   ),
//                   Text(
//                     'Issued By ${award.issuedBy ?? 'NA'}',
//                     style: AppTextStyles.text12w400,
//                   ),
//                   sizedBoxWithHeight(4),
//                   Text(
//                     '${award.issueDate?.abrMMMyyyy}',
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
//     final awards = notifier.userProfile?.awards;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Row(
//           children: [
//             Text(
//               'Awards and Achievements',
//               style: AppTextStyles.text16w700,
//             ),
//             const Spacer(),
//             InkWell(
//               hoverColor: AppColors.novaLightMutedPlus,
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) => const AddEditAwards(
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
//                   child: _buildAwardsListTile(
//                     kIsLargeScreen,
//                     awards![index],
//                   ),
//                 ),
//                 InkWell(
//                   hoverColor: AppColors.novaLightMutedPlus,
//                   onTap: () {
//                     showDialog(
//                       context: context,
//                       builder: (context) => AddEditAwards(
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
//           itemCount: awards?.length ?? 0,
//         ),
//       ],
//     );
//   }
// }
