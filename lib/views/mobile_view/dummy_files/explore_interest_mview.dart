// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:nova_social/data/constants/app_colors.dart';
// import 'package:nova_social/data/constants/app_key_names.dart';
// import 'package:nova_social/data/constants/app_text_styles.dart';
// import 'package:nova_social/data/models/models.dart';
// import 'package:nova_social/notifiers/notifiers.dart';
// import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
// import 'package:nova_social/routes/route_arguments.dart';
// import 'package:nova_social/utils/utils.dart';
// import 'package:nova_social/views/mobile_view/common/common.dart';
// import 'package:nova_social/views/mobile_view/profile/common/profile_interest_mwidget.dart';
// import 'package:nova_social/views/mobile_view/profile/explore/widgets/explore_user_info_mtile.dart';
// import 'package:provider/provider.dart';

// class ExploreInterestMView extends StatefulWidget {
//   final ExploreInterestMViewArgs args;
//   const ExploreInterestMView({
//     super.key,
//     required this.args,
//   });

//   @override
//   State<ExploreInterestMView> createState() => _ExploreInterestMViewState();
// }

// class _ExploreInterestMViewState extends State<ExploreInterestMView> {
//   late ScrollController _controller;
//   late ProfileNotifier _profileNoti;
//   late NovaInterests selectedInterest;

//   void onChipTap(NovaInterests novaInterests) {
//     selectedInterest = novaInterests;
//     _profileNoti.clearFilterUsers();
//     populateData();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   Future<void> _init() async {
//     selectedInterest = widget.args.selectedInterest;
//     _profileNoti = Provider.of<ProfileNotifier>(context, listen: false);
//     _controller = ScrollController();
//     _controller.addListener(_scrollListener);
//     _profileNoti.clearFilterUsers();
//     populateData();
//   }

//   Future<void> populateData() async {
//     await _profileNoti.fetchUserByFilter(
//       selectedInterest.id ?? '',
//       AppKeyNames.userInterestsIds,
//     );
//   }

//   Future<void> _scrollListener() async {
//     if (_controller.offset >= _controller.position.maxScrollExtent &&
//         !_controller.position.outOfRange) {
//       // "reach the bottom";
//       appLoadingMPopup(context);
//       await _profileNoti
//           .fetchUserByFilter(
//         selectedInterest.id ?? '',
//         AppKeyNames.userInterestsIds,
//       )
//           .then((value) {
//         Navigator.pop(context);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ThemeHandler.backgroundColor(),
//       body: SafeArea(
//         child: Consumer<ProfileNotifier>(
//           builder: (ctx, profileNoti, _) {
//             final List<UserModel>? filterProfiles = profileNoti.filterProfiles;
//             return SingleChildScrollView(
//               controller: _controller,
//               padding: EdgeInsets.symmetric(horizontal: 24.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   sizedBoxWithHeight(32),
//                   Row(
//                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       AppIconButton(
//                         color: AppColors.novaWhite,
//                         icon: Icons.arrow_back,
//                         onTap: () {
//                           Navigator.of(context).pop();
//                         },
//                       ),
//                       Expanded(
//                         child: Center(
//                           child: Text(
//                             'Interests',
//                             style: AppTextStyles.text24w700,
//                           ),
//                         ),
//                       ),
//                       if (widget.args.profileArgs.isCurrentUser ?? false) ...{
//                         AppIconButton(
//                           color: AppColors.novaWhite,
//                           icon: Icons.edit,
//                           onTap: () {
//                             context.push(AddEditMRouter.addEditInterestRoute);
//                           },
//                         ),
//                       },
//                     ],
//                   ),
//                   sizedBoxWithHeight(24),
//                   InterestsMWidget(
//                     onTap: (selectedInterest) => onChipTap(selectedInterest),
//                     selectedInterest: selectedInterest,
//                     profileArgs: widget.args.profileArgs,
//                   ),
//                   sizedBoxWithHeight(24),
//                   Text(
//                     'People with \'${selectedInterest.name}\' tag',
//                     style: AppTextStyles.text16w600,
//                   ),
//                   sizedBoxWithHeight(24),
//                   ListView.separated(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) => ExploreUserInfoMTile(
//                       profile: filterProfiles?[index],
//                     ),
//                     separatorBuilder: (_, __) => sizedBoxWithHeight(24),
//                     itemCount: filterProfiles?.length ?? 0,
//                   ),
//                   // sizedBoxWithHeight(96),
//                   // sizedBoxWithHeight(96),
//                   // sizedBoxWithHeight(96),
//                   // sizedBoxWithHeight(96),
//                   // sizedBoxWithHeight(96),
//                   // sizedBoxWithHeight(96),
//                   if ((filterProfiles?.length ?? 0) > 4) ...{
//                     sizedBoxWithHeight(24),
//                     GestureDetector(
//                       onTap: () => _scrollListener(),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             'Show More',
//                             style: AppTextStyles.text14w400,
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                     ),
//                   },
//                   sizedBoxWithHeight(24),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
