import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
import 'package:nova_social/routes/mobile/explore_routes.dart/explore_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';

class ProfileInterestsMWidget extends StatefulWidget {
  final ProfileMViewArgs args;
  final NovaInterests? selectedInterest;
  const ProfileInterestsMWidget({
    super.key,
    this.selectedInterest,
    required this.args,
  });

  @override
  State<ProfileInterestsMWidget> createState() =>
      _ProfileInterestsMWidgetState();
}

class _ProfileInterestsMWidgetState extends State<ProfileInterestsMWidget> {
  final List<Color> dummyColor = [
    AppColors.novaBlue,
    AppColors.novaDarkGreen,
    AppColors.novaDarkYellow,
    AppColors.novaLightGreen,
    AppColors.novaOrange,
    AppColors.novaPeach,
    AppColors.novaPink,
    AppColors.novaPurple,
  ];

  bool isExpanded = false;

  int itemLengthCap = 5;

  @override
  Widget build(BuildContext context) {
    final length = widget.args.profile?.userInterests?.length ?? 0;
    final showItemLength = length <= itemLengthCap
        ? length
        : (isExpanded ? length : itemLengthCap);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            alignment: WrapAlignment.start,
            direction: Axis.horizontal,
            runSpacing: 8.r,
            spacing: 8.r,
            children: [
              if (widget.args.profile?.userInterests?.isNotEmpty ?? false) ...{
                ...widget.args.profile!.userInterests!
                    .sublist(0, showItemLength)
                    .map(
                  (e) {
                    final bool isSelected = (e.name ?? false) ==
                        (widget.selectedInterest?.name ?? false);
                    final length = (e.name?.length ?? 0) % 8;
                    final color = dummyColor[length];
                    return FittedBox(
                      child: AppMChip(
                        onTap: () {
                          context.push(
                            ExploreMRouter.exploreByTagsRoute,
                            extra: ExploreByTagsMViewArgs(
                              selectedInterest: e,
                            ),
                          );
                        },
                        text: e.name ?? 'NA',
                        prefixColor: color,
                        type: AppChipType.filled,
                        borderColor: color,
                        isSelected: isSelected,
                        color: ThemeHandler.mutedPlusColor(nonInverse: false),
                        prefix: SizedBox(
                          width: 18.r,
                          height: 18.r,
                          child: CachedNetworkImage(
                            imageUrl: e.iconUrl ?? '',
                            color: isSelected ? AppColors.novaWhite : color,
                            errorWidget: (context, url, error) =>
                                const SizedBox(),
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              },
              if (length > itemLengthCap) ...{
                FittedBox(
                  child: AppMChip(
                    prefix: SizedBox(
                      height: 18.r,
                    ),
                    hasPrefixSpacing: false,
                    text: isExpanded.not
                        ? '+${length - itemLengthCap}'
                        : 'Show Less',
                    type: AppChipType.outlined,
                    textColor: isExpanded.not
                        ? AppChipTextColor.themeSupportColor
                        : AppChipTextColor.outlineColor,
                    color: AppColors.novaWhite.withOpacity(0.4),
                    onTap: () {
                      isExpanded = isExpanded.not;
                      setState(() {});
                    },
                  ),
                ),
              },
              if (widget.args.isCurrentUser ?? false) ...{
                FittedBox(
                  child: AppMChip(
                    prefix: SizedBox(
                      height: 18.r,
                      child: Icon(
                        Icons.add,
                        color: AppColors.novaWhite.withOpacity(0.4),
                        size: 16.r,
                      ),
                    ),
                    text: 'Add more',
                    type: AppChipType.outlined,
                    textColor: AppChipTextColor.outlineColor,
                    color: AppColors.novaWhite.withOpacity(0.4),
                    onTap: () {
                      context.push(AddEditMRouter.addEditInterestRoute);
                    },
                  ),
                ),
              },
            ],
          ),
          sizedBoxWithHeight(40),
        ],
      ),
    );
  }
}
