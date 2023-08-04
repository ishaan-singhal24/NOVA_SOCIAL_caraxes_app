import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_strings.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/routes.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/add_edit_profile.dart';
import 'package:provider/provider.dart';

class ProfileOpportunityWidget extends StatefulWidget {
  const ProfileOpportunityWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileOpportunityWidget> createState() =>
      _ProfileOpportunityWidgetState();
}

class _ProfileOpportunityWidgetState extends State<ProfileOpportunityWidget> {
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

  int itemLengthCap = 8;

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileNotifier>(context).profileAsPerRoute();
    final isCurrentUser = Provider.of<ProfileNotifier>(context).isCurrentUser;
    final length = user?.userOpportunities?.length ?? 0;
    final showItemLength = length <= itemLengthCap
        ? length
        : (isExpanded ? length : itemLengthCap);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.iAmAvailableFor,
          style: AppTextStyles.text22w500.darkModeSupport,
        ),
        sizedBoxWithHeight(16),
        Wrap(
          alignment: WrapAlignment.start,
          direction: Axis.horizontal,
          runSpacing: 8.r,
          spacing: 8.r,
          children: [
            if (user?.userOpportunities?.isNotEmpty ?? false) ...{
              ...user!.userOpportunities!.sublist(0, showItemLength).map(
                (e) {
                  final length = (e.name?.length ?? 0) % 8;
                  final color = dummyColor[length];
                  return FittedBox(
                    child: AppChip(
                      onTap: () {
                        context.go(
                          '${NovaRouter.exploreOpportunityRoute}/${e.name?.replaceAll(' ', '-')}',
                          extra: e,
                        );
                      },
                      text: e.name ?? 'NA',
                      type: AppChipType.outlined,
                      color: AppColors.novaWhite.withOpacity(0.4),
                      prefixColor: color,
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
                    width: 18.r,
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
                      builder: (context) => ProfileAddEditAvailability(
                        isAdd: user?.userOpportunities?.isEmpty ?? false,
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
