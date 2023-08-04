import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class ProfileDreamWidget extends StatelessWidget {
  final bool isCurrentUser;
  final List<DreamInterface>? dream;
  final ProfileAddEditDreamType type;
  final Function()? onTap;
  ProfileDreamWidget({
    super.key,
    required this.isCurrentUser,
    this.dream,
    required this.type,
    this.onTap,
  });

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

  Widget dreamItem(DreamInterface item) {
    dummyColor.shuffle();
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (type != ProfileAddEditDreamType.colleges) ...{
              CachedNetworkImage(
                imageUrl: item.iconUrl ?? '',
                color: type == ProfileAddEditDreamType.careers
                    ? dummyColor.first
                    : null,
                errorWidget: (context, url, error) => const SizedBox(),
                width: 32.r,
                height: 32.r,
              ),
            } else ...{
              AppNetworkImage(
                url: item.iconUrl ?? 'NA',
                width: 32.r,
                height: 32.r,
              ),
            },
            sizedBoxWithHeight(6),
            Text(
              item.name ?? 'NA',
              style: AppTextStyles.text12w700.darkModeSupport,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
  }

  Widget dreamItems(List<DreamInterface> data) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...data.mapIndexed(
            (i, e) => dreamItem(data[i]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if ((dream?.isEmpty ?? true) && isCurrentUser.not) {
      return const SizedBox();
    }
    return Column(
      children: [
        sizedBoxWithHeight(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${isCurrentUser ? '${AppStrings.my} ' : ''}Dream ${type.name.firstCap}',
              style: AppTextStyles.text20w400.darkModeSupport,
            ),
            if (isCurrentUser) ...{
              AppIconButton(
                icon: (dream?.isNotEmpty ?? false) ? Icons.edit : Icons.add,
                onTap: () {
                  if (onTap != null) {
                    onTap!();
                  }
                },
              ),
            },
          ],
        ),
        if (dream?.isNotEmpty ?? false) ...{
          sizedBoxWithHeight(16),
          dreamItems(dream!),
        },
        sizedBoxWithHeight(16),
        Divider(
          color: ThemeHandler.novaMutedColor(),
          thickness: 0.5,
        ),
      ],
    );
  }
}
