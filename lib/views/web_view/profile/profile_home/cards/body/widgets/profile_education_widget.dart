import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/auth/auth_notifier.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/formatter/time_duration_calculator.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/add_edit_profile.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/body/widgets/common/profile_data_item_tile_widget.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/body/widgets/common/profile_sub_head_tile.dart';
import 'package:provider/provider.dart';

class ProfileEducationWidget extends StatelessWidget {
  const ProfileEducationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileNotifier>(
      builder: (context, profileNoti, child) {
        final educations = profileNoti.profileAsPerRoute()?.educations;
        if (educations?.isEmpty ?? true) return const SizedBox();
        return SizedBox(
          child: Column(
            children: [
              ProfileSubHeadTile(
                iconUrl: AppAssets.educationProfile,
                headText: AppStrings.education,
                buttonText: AppStrings.addEducation,
                onButtonPress: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const ProfileAddEditEducation(
                        isAdd: true,
                      );
                    },
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
                    title: educations?[index].school,
                    subTitle: educations?[index].degree,
                    description: educations?[index].description,
                    fromDate: educations?[index].startDate?.abrMMMyyyy,
                    toDate: (educations?[index].currentlyStudyHere ?? false)
                        ? 'Studying'
                        : educations?[index].endDate?.abrMMMyyyy,
                    duration: DateTimeFormatter.timeDurationCalculator(
                        educations?[index].startDate,
                        educations?[index].endDate),
                    location: educations?[index].location,
                    icon: Iconsax.book_1,
                    imageAssetPath: AppAssets.educationLogo,
                    onIconPress: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ProfileAddEditEducation(
                            isAdd: false,
                            editingIndex: index,
                          );
                        },
                      );
                    },
                  ),
                  separatorBuilder: (_, __) => sizedBoxWithHeight(24),
                  itemCount: educations?.length ?? 0,
                ),
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

// class ProfileEducationWidget extends StatelessWidget {
//   const ProfileEducationWidget({Key? key}) : super(key: key);

//   Widget _buildEducationListTile(bool kIsLargeScreen, Education education) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           alignment: Alignment.center,
//           height: kIsLargeScreen ? 56.h : 48.h,
//           width: kIsLargeScreen ? 16.w : 48.w,
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: AppColors.novaYellow,
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
//                     education.school ?? '',
//                     style: AppTextStyles.text14w600,
//                   ),
//                   Text(
//                     education.degree ?? '',
//                     style: AppTextStyles.text12w400,
//                   ),
//                   sizedBoxWithHeight(4),
//                   Text(
//                     '${education.startDate?.abrMMMyyyy} - ${education.currentlyStudyHere == true ? 'Present' : education.endDate?.abrMMMyyyy}',
//                     style: AppTextStyles.text10w400,
//                   ),
//                 ],
//               ),
//               sizedBoxWithHeight(16),
//               Text(
//                 education.location ?? '',
//                 style: AppTextStyles.text10w400,
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
//     final educations = notifier.userProfile?.educations;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Row(
//           children: [
//             Text(
//               'Education',
//               style: AppTextStyles.text16w700,
//             ),
//             const Spacer(),
//             InkWell(
//               hoverColor: AppColors.novaLightMutedPlus,
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) => const AddEditEducation(
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
//                   child: _buildEducationListTile(
//                     kIsLargeScreen,
//                     educations![index],
//                   ),
//                 ),
//                 InkWell(
//                   hoverColor: AppColors.novaLightMutedPlus,
//                   onTap: () {
//                     showDialog(
//                       context: context,
//                       builder: (context) => AddEditEducation(
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
//           itemCount: educations?.length ?? 0,
//         ),
//       ],
//     );
//   }
// }
