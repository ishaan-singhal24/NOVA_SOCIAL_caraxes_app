import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:readmore/readmore.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileDataItemMTile extends StatelessWidget {
  final int index;
  final String? iconAssetLink;
  final Color? iconColor;
  final String? title;
  final String? websiteNearTitle;
  final Function()? onEdit;
  final bool? isCurrentUser;
  final String? subTitleNearWebsite;
  final String? subTitleMutedText;
  final String? subSubTitleLeft;
  final String? subSubTitleRight;
  final String? subSubTitleRightWebsite;
  final String? fromDate;
  final String? toDate;
  final String? duration;
  final String? description;
  final String? location;
  final String? website;
  final String? relatedLink;
  final String? relatedTag;
  final Color? relatedTagColor;

  ProfileDataItemMTile({
    super.key,
    required this.index,
    this.iconAssetLink,
    this.iconColor,
    this.title,
    this.websiteNearTitle,
    this.onEdit,
    this.isCurrentUser = false,
    this.subTitleNearWebsite,
    this.subTitleMutedText,
    this.subSubTitleLeft,
    this.subSubTitleRight,
    this.subSubTitleRightWebsite,
    this.fromDate,
    this.toDate,
    this.duration,
    this.description,
    this.location,
    this.website,
    this.relatedLink,
    this.relatedTag,
    this.relatedTagColor,
  });

  final List<LinearGradient> _dummyGradientList = [
    AppColors.novaBlueGradient,
    AppColors.novaGreenGradient,
    AppColors.novaIndigoGradient,
    AppColors.novaYellowGradient,
  ];

  Future<void> _launchUrl(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $link');
    }
  }

  @override
  Widget build(BuildContext context) {
    final LinearGradient gradientColor = _dummyGradientList[index % 4];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 48.r,
          height: 48.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            gradient: gradientColor,
          ),
          child: iconAssetLink == null
              ? Icon(
                  Iconsax.safe_home,
                  color: AppColors.novaWhite,
                )
              : Center(
                  child: SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: Image.asset(
                      iconAssetLink!,
                    ),
                  ),
                ),
        ),
        sizedBoxWithWidth(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            title ?? '',
                            style: AppTextStyles.text16w600,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (websiteNearTitle?.isNotEmpty ?? false) ...{
                          sizedBoxWithWidth(8),
                          InkWell(
                            onTap: () {
                              //Open link in web view
                              // Or open browser app
                              _launchUrl(websiteNearTitle!);
                            },
                            child: Icon(
                              Icons.open_in_new,
                              size: 16.r,
                              color: AppColors.novaIndigo,
                            ),
                          ),
                        },
                      ],
                    ),
                  ),
                  if (onEdit != null && (isCurrentUser ?? false)) ...{
                    AppIconButton(
                      color: AppColors.novaWhite.withOpacity(0.8),
                      icon: Icons.edit,
                      onTap: onEdit ?? () {},
                    ),
                  },
                ],
              ),
              if (subTitleNearWebsite != null || website != null) ...{
                sizedBoxWithHeight(8),
              },
              Row(
                children: [
                  if (subTitleNearWebsite != null) ...{
                    Flexible(
                      child: Text(
                        subTitleNearWebsite ?? '',
                        style: AppTextStyles.text14w500,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  },
                  if (website?.isNotEmpty ?? false) ...{
                    sizedBoxWithWidth(8),
                    InkWell(
                      onTap: () {
                        //Open link in web view
                        // Or open browser app
                        _launchUrl(website!);
                      },
                      child: Icon(
                        Icons.open_in_new,
                        size: 16.r,
                        color: AppColors.novaIndigo,
                      ),
                    ),
                  },
                ],
              ),
              if (subTitleMutedText != null) ...{
                sizedBoxWithHeight(8),
                Text(
                  subTitleMutedText ?? '',
                  style: AppTextStyles.text14w300,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              },
              if (subSubTitleLeft != null || subSubTitleRight != null) ...{
                sizedBoxWithHeight(8),
              },
              Row(
                children: [
                  if (subSubTitleLeft != null) ...{
                    Flexible(
                      child: Text(
                        subSubTitleLeft ?? '',
                        style: AppTextStyles.text14w300,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  },
                  if (subSubTitleLeft != null && subSubTitleRight != null) ...{
                    Text(
                      ' - ',
                      style: AppTextStyles.text14w300,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  },
                  if (subSubTitleRight != null) ...{
                    Flexible(
                      child: Text(
                        subSubTitleRight ?? '',
                        style: AppTextStyles.text14w500,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  },
                  if (subSubTitleRightWebsite != null) ...{
                    sizedBoxWithWidth(8),
                    InkWell(
                      onTap: () {
                        //Open link in web view
                        // Or open browser app
                        _launchUrl(subSubTitleRightWebsite!);
                      },
                      child: Icon(
                        Icons.open_in_new,
                        size: 16.r,
                        color: AppColors.novaIndigo,
                      ),
                    ),
                  },
                ],
              ),
              if (fromDate != null || toDate != null || duration != null) ...{
                sizedBoxWithHeight(8),
              },
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (relatedTag?.isNotEmpty ?? false) ...{
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: relatedTagColor ?? AppColors.novaOrange,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Text(
                          relatedTag!,
                          style: AppTextStyles.text12w500,
                        ),
                      ),
                    ),
                    sizedBoxWithWidth(8),
                    CircleAvatar(
                      backgroundColor: AppColors.novaWhite.withOpacity(0.8),
                      radius: 2.r,
                    ),
                    sizedBoxWithWidth(8),
                  },
                  Text(
                    fromDate ?? 'NA',
                    style: AppTextStyles.text14w300.setOpacity(0.8),
                  ),
                  sizedBoxWithWidth(4),
                  Text(
                    '-',
                    style: AppTextStyles.text14w300.setOpacity(0.8),
                  ),
                  sizedBoxWithWidth(4),
                  Text(
                    toDate ?? 'NA',
                    style: AppTextStyles.text14w300.setOpacity(0.8),
                  ),
                  // if (duration != null) ...{
                  //   sizedBoxWithWidth(8),
                  //   CircleAvatar(
                  //     backgroundColor: ThemeHandler.widgetColor(),
                  //     radius: 2.r,
                  //   ),
                  //   sizedBoxWithWidth(8),
                  //   Text(
                  //     duration ?? '',
                  //     style: AppTextStyles.text14w300,
                  //   ),
                  // },
                ],
              ),
              if (description?.isNotEmpty ?? false) ...{
                sizedBoxWithHeight(16),
                ReadMoreText(
                  description ?? '',
                  trimLines: 3,
                  colorClickableText: AppColors.novaIndigo,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' Show less',
                  style: AppTextStyles.text14w400.darkModeSupport.copyWith(
                    height: 1.4,
                  ),
                  moreStyle: AppTextStyles.text14w400.indigo,
                ),
              },
              if (location?.isNotEmpty ?? false) ...{
                sizedBoxWithHeight(12),
                Row(
                  children: [
                    Icon(
                      Iconsax.location,
                      size: 14.r,
                      color: ThemeHandler.widgetColor().withOpacity(0.8),
                    ),
                    sizedBoxWithWidth(8),
                    Text(
                      location ?? '',
                      style: AppTextStyles.text14w300.setOpacity(0.8),
                    ),
                  ],
                ),
              },
              if (relatedLink?.isNotEmpty ?? false) ...{
                sizedBoxWithHeight(12),
                InkWell(
                  onTap: () {
                    _launchUrl(relatedLink!);
                  },
                  child: Container(
                    height: 40.h,
                    width: 130.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(
                        color: AppColors.novaDarkIndigo,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Related Link',
                            style: AppTextStyles.text14w600,
                          ),
                          sizedBoxWithWidth(8),
                          Icon(
                            Icons.open_in_new,
                            size: 16.r,
                            color: AppColors.novaIndigo,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              },
            ],
          ),
        ),
      ],
    );
  }
}
