// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:nova_social/data/constants/app_colors.dart';
// import 'package:nova_social/data/enums/enums.dart';
// import 'package:nova_social/data/models/nova/opportunities/nova_opportunities.dart';
// import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
// import 'package:nova_social/routes/mobile/explore_routes.dart/explore_mroutes.dart';
// import 'package:nova_social/routes/route_arguments.dart';
// import 'package:nova_social/utils/utils.dart';
// import 'package:nova_social/views/mobile_view/common/common.dart';

// class AvailabilityMWidget extends StatefulWidget {
//   final ProfileMViewArgs profileArgs;
//   final Function(NovaOpportunities novaOpportunities)? onTap;

//   final NovaOpportunities? selectedOpportunity;

//   const AvailabilityMWidget({
//     Key? key,
//     this.selectedOpportunity,
//     this.onTap,
//     required this.profileArgs,
//   }) : super(key: key);

//   @override
//   State<AvailabilityMWidget> createState() => _AvailabilityMWidgetState();
// }

// class _AvailabilityMWidgetState extends State<AvailabilityMWidget> {
//   final List<Color> dummyColor = [
//     AppColors.novaBlue,
//     AppColors.novaDarkGreen,
//     AppColors.novaDarkYellow,
//     AppColors.novaLightGreen,
//     AppColors.novaOrange,
//     AppColors.novaPeach,
//     AppColors.novaPink,
//     AppColors.novaPurple,
//   ];

//   int itemLengthCap = 5;

//   bool isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     final user = widget.profileArgs.profile;
//     final isCurrentUser = widget.profileArgs.isCurrentUser;
//     final length = user?.userOpportunities?.length ?? 0;
//     final showItemLength = length <= itemLengthCap
//         ? length
//         : (isExpanded ? length : itemLengthCap);
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Wrap(
//           alignment: WrapAlignment.start,
//           direction: Axis.horizontal,
//           runSpacing: 8.r,
//           spacing: 8.r,
//           children: [
//             if (user?.userOpportunities?.isNotEmpty ?? false) ...{
//               ...user!.userOpportunities!.sublist(0, showItemLength).map(
//                 (e) {
//                   final bool isSelected = (e.name ?? false) ==
//                       (widget.selectedOpportunity?.name ?? false);
//                   final length = (e.name?.length ?? 0) % 8;
//                   final color = dummyColor[length];
//                   return FittedBox(
//                     child: AppMChip(
//                       onTap: () {
//                         if (widget.onTap != null) {
//                           widget.onTap!(e);
//                         } else {
//                           context.push(
//                             ExploreMRouter.exploreAvailabilityRoute,
//                             extra: ExploreAvailabiltyMViewArgs(
//                               selectedOpportunity: e,
//                               profileArgs: widget.profileArgs,
//                             ),
//                           );
//                         }
//                       },
//                       text: e.name ?? 'NA',
//                       type: AppChipType.filled,
//                       color: ThemeHandler.mutedPlusColor(nonInverse: false),
//                       prefixColor: color,
//                       borderColor: color,
//                       isSelected: isSelected,
//                       prefix: SizedBox(
//                         width: 18.r,
//                         height: 18.r,
//                         child: CachedNetworkImage(
//                           imageUrl: e.iconUrl ?? '',
//                           color: isSelected ? AppColors.novaWhite : color,
//                           errorWidget: (context, url, error) =>
//                               const SizedBox(),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ).toList(),
//             },
//             if (length > itemLengthCap) ...{
//               FittedBox(
//                 child: AppMChip(
//                   prefix: SizedBox(
//                     height: 18.r,
//                   ),
//                   hasPrefixSpacing: false,
//                   text: isExpanded.not
//                       ? '+${length - itemLengthCap}'
//                       : 'Show Less',
//                   type: AppChipType.outlined,
//                   textColor: isExpanded.not
//                       ? AppChipTextColor.themeSupportColor
//                       : AppChipTextColor.outlineColor,
//                   color: AppColors.novaWhite.withOpacity(0.4),
//                   onTap: () {
//                     isExpanded = isExpanded.not;
//                     setState(() {});
//                   },
//                 ),
//               ),
//             },
//             if (isCurrentUser ?? false) ...{
//               FittedBox(
//                 child: AppMChip(
//                   prefix: SizedBox(
//                     height: 18.r,
//                     child: Icon(
//                       Icons.add,
//                       color: AppColors.novaWhite.withOpacity(0.4),
//                       size: 16.r,
//                     ),
//                   ),
//                   text: 'Add more',
//                   type: AppChipType.outlined,
//                   textColor: AppChipTextColor.outlineColor,
//                   color: AppColors.novaWhite.withOpacity(0.4),
//                   onTap: () {
//                     context.push(AddEditMRouter.addEditAvailabilityRoute);
//                   },
//                 ),
//               ),
//             },
//           ],
//         ),
//         sizedBoxWithHeight(16),
//       ],
//     );
//   }
// }
