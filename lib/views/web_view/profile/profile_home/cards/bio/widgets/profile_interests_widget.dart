import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/routes/web/nova_router.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/add_edit_profile.dart';
import 'package:provider/provider.dart';

class ProfileInterestsWidget extends StatefulWidget {
  const ProfileInterestsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileInterestsWidget> createState() => _ProfileInterestsWidgetState();
}

class _ProfileInterestsWidgetState extends State<ProfileInterestsWidget> {
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

  int itemLengthCap = 8;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileNotifier>(context).profileAsPerRoute();
    final isCurrentUser = Provider.of<ProfileNotifier>(context).isCurrentUser;
    final length = user?.userInterests?.length ?? 0;
    final showItemLength = length <= itemLengthCap
        ? length
        : (isExpanded ? length : itemLengthCap);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          alignment: WrapAlignment.start,
          direction: Axis.horizontal,
          runSpacing: 8.r,
          spacing: 8.r,
          children: [
            if (user?.userInterests?.isNotEmpty ?? false) ...{
              ...user!.userInterests!.sublist(0, showItemLength).map(
                (e) {
                  final length = (e.name?.length ?? 0) % 8;
                  final color = dummyColor[length];
                  return FittedBox(
                    child: AppChip(
                      onTap: () {
                        context.go(
                          '${NovaRouter.exploreInterestRoute}/${e.name?.replaceAll(' ', '-')}',
                          extra: e,
                        );
                      },
                      text: e.name ?? 'NA',
                      prefixColor: color,
                      type: AppChipType.outlined,
                      color: AppColors.novaWhite.withOpacity(0.4),
                      prefix: SizedBox(
                        width: 18.r,
                        height: 18.r,
                        child: CachedNetworkImage(
                          imageUrl: e.iconUrl ?? '',
                          color: color,
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
                child: AppChip(
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
            if (isCurrentUser ?? false) ...{
              FittedBox(
                child: AppChip(
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
                    showDialog(
                      context: context,
                      builder: (context) => ProfileAddEditInterest(
                        isAdd: user?.userInterests?.isEmpty ?? false,
                      ),
                    );
                  },
                ),
              ),
            },
          ],
        ),
        sizedBoxWithHeight(16),
        Divider(
          color: ThemeHandler.novaMutedColor(),
          thickness: 0.2,
        ),
        sizedBoxWithHeight(16),
      ],
    );
  }
}
