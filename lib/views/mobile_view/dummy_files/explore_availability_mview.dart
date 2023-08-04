// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:nova_social/data/constants/constants.dart';
// import 'package:nova_social/data/models/models.dart';
// import 'package:nova_social/notifiers/notifiers.dart';
// import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
// import 'package:nova_social/routes/route_arguments.dart';
// import 'package:nova_social/utils/utils.dart';
// import 'package:nova_social/views/mobile_view/common/common.dart';
// import 'package:nova_social/views/mobile_view/profile/common/profile_availability_mwidget.dart';
// import 'package:nova_social/views/mobile_view/profile/explore/widgets/explore_user_info_mtile.dart';
// import 'package:provider/provider.dart';

// class ExploreAvailabiltyMView extends StatefulWidget {
//   final ExploreAvailabiltyMViewArgs args;
//   const ExploreAvailabiltyMView({
//     super.key,
//     required this.args,
//   });

//   @override
//   State<ExploreAvailabiltyMView> createState() =>
//       _ExploreAvailabiltyMViewState();
// }

// class _ExploreAvailabiltyMViewState extends State<ExploreAvailabiltyMView> {
//   late NovaOpportunities selectedOpportunity;

//   late ScrollController _controller;
//   late ProfileNotifier _profileNoti;

//   void onChipTap(NovaOpportunities novaOpportunities) {
//     selectedOpportunity = novaOpportunities;
//     _profileNoti.clearFilterUsers();
//     populateData();
//   }

//   @override
//   void initState() {
//     super.initState();
//     selectedOpportunity = widget.args.selectedOpportunity;
//     _profileNoti = Provider.of<ProfileNotifier>(context, listen: false);
//     _profileNoti.clearFilterUsers();
//     populateData();
//     _controller = ScrollController();
//     _controller.addListener(_scrollListener);
//   }

//   Future<void> populateData() async {
//     await _profileNoti.fetchUserByFilter(
//       selectedOpportunity.id ?? '',
//       AppKeyNames.userOpportunitiesIds,
//     );
//   }

//   Future<void> _scrollListener() async {
//     if (_controller.offset >= _controller.position.maxScrollExtent &&
//         !_controller.position.outOfRange) {
//       // "reach the bottom";
//       appLoadingMPopup(context);
//       await populateData().then((value) {
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
//                             'Availability',
//                             style: AppTextStyles.text24w700,
//                           ),
//                         ),
//                       ),
//                       if (widget.args.profileArgs.isCurrentUser ?? false) ...{
//                         AppIconButton(
//                           color: AppColors.novaWhite,
//                           icon: Icons.edit,
//                           onTap: () {
//                             context
//                                 .push(AddEditMRouter.addEditAvailabilityRoute);
//                           },
//                         ),
//                       },
//                     ],
//                   ),
//                   sizedBoxWithHeight(24),
//                   AvailabilityMWidget(
//                     onTap: (selectedOpportunity) =>
//                         onChipTap(selectedOpportunity),
//                     selectedOpportunity: selectedOpportunity,
//                     profileArgs: widget.args.profileArgs,
//                   ),
//                   sizedBoxWithHeight(24),
//                   Text(
//                     'People with \'${selectedOpportunity.name}\' tag',
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
