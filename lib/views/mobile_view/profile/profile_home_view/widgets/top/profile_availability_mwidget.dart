import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/data/models/nova/opportunities/nova_opportunities.dart';
import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
import 'package:nova_social/routes/mobile/explore_routes.dart/explore_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';

class ProfileAvailabilityMWidget extends StatefulWidget {
  final ProfileMViewArgs args;
  const ProfileAvailabilityMWidget({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  State<ProfileAvailabilityMWidget> createState() =>
      _ProfileAvailabilityMWidgetState();
}

class _ProfileAvailabilityMWidgetState
    extends State<ProfileAvailabilityMWidget> {
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

  int itemLengthCap = 5;

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final user = widget.args.profile;
    final isCurrentUser = widget.args.isCurrentUser;
    final length = user?.userOpportunities?.length ?? 0;
    final showItemLength = length <= itemLengthCap
        ? length
        : (isExpanded ? length : itemLengthCap);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: 'I am open to ',
                    style: AppTextStyles.text18w400,
                    children: [
                      if (user?.userOpportunities?.isNotEmpty ?? false) ...{
                        ...user!.userOpportunities!
                            .sublist(0, showItemLength)
                            .mapIndexed(
                          (i, NovaOpportunities e) {
                            int index = (e.name!.length) % 8;
                            Color color = dummyColor[index];
                            return TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '${e.name ?? ''}${i == (length - 1) ? '.' : ','}',
                                  style: AppTextStyles.text18w600.copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationStyle: TextDecorationStyle.dotted,
                                    decorationColor: color,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.push(
                                        ExploreMRouter.exploreByTagsRoute,
                                        extra: ExploreByTagsMViewArgs(
                                          selectedOpportunity: e,
                                        ),
                                      );
                                    },
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: AppTextStyles.text18w600,
                                ),
                              ],
                            );
                          },
                        ).toList(),
                      },
                      if (length > itemLengthCap) ...{
                        TextSpan(
                          text: ' ',
                          style: AppTextStyles.text18w800,
                        ),
                        TextSpan(
                          text: 'and ${length - showItemLength} more',
                          style: AppTextStyles.text18w600.copyWith(),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              itemLengthCap = length;
                              setState(() {});
                            },
                        ),
                      },
                      if (length == itemLengthCap) ...{
                        TextSpan(
                          text: ' ',
                          style: AppTextStyles.text18w800,
                        ),
                        TextSpan(
                          text: 'show less',
                          style: AppTextStyles.text18w600.copyWith(),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              itemLengthCap = 5;
                              setState(() {});
                            },
                        ),
                      },
                    ],
                  ),
                ),
              ),
              if (isCurrentUser ?? false) ...{
                AppIconButton(
                  icon: user?.userOpportunities?.isEmpty ?? true
                      ? Icons.add
                      : Icons.edit,
                  onTap: () {
                    context.push(AddEditMRouter.addEditAvailabilityRoute);
                  },
                ),
              },
            ],
          ),
          sizedBoxWithHeight(24),
          const AppDividerMwidget(),
          sizedBoxWithHeight(24),
        ],
      ),
    );
  }
}
