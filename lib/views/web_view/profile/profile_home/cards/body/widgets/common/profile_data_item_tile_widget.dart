import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileDataItemTileWidget extends StatefulWidget {
  final int index;
  final String? title;
  final String? subTitle;
  final String? titleWebsite;
  final String? subTitleWebsite;
  final String? subTitlePrefix;
  final String? description;
  final String? fromDate;
  final String? toDate;
  final String? duration;
  final String? location;
  final IconData? icon;
  final String? imageAssetPath;
  final Function() onIconPress;
  final String? networkImage;
  const ProfileDataItemTileWidget({
    Key? key,
    required this.index,
    this.title,
    this.titleWebsite,
    this.subTitlePrefix,
    this.subTitle,
    this.subTitleWebsite,
    this.description,
    this.fromDate,
    this.toDate,
    this.duration,
    this.location,
    this.icon,
    this.imageAssetPath,
    required this.onIconPress,
    this.networkImage,
  }) : super(key: key);

  @override
  State<ProfileDataItemTileWidget> createState() =>
      _ProfileDataItemTileWidgetState();
}

class _ProfileDataItemTileWidgetState extends State<ProfileDataItemTileWidget> {
  bool isEditHover = false;
  bool isShowMoreHover = false;
  // bool subTextWebsiteHover = false;
  bool isShowMore = false;

  final List<LinearGradient> _dummyGradientList = [
    AppColors.novaBlueGradient,
    AppColors.novaGreenGradient,
    AppColors.novaIndigoGradient,
    AppColors.novaYellowGradient,
  ];

  @override
  Widget build(BuildContext context) {
    final isCurrentUser = Provider.of<ProfileNotifier>(context).isCurrentUser;
    final LinearGradient _gradientColor = _dummyGradientList[widget.index % 4];
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.networkImage?.isNotEmpty ?? false) ...{
            CachedNetworkImage(
              imageUrl: widget.networkImage ?? '',
              errorWidget: (_, __, ___) => const AppErrorIcon(),
              imageBuilder: (context, imageProvider) => Container(
                width: 64.r,
                height: 64.r,
                decoration: BoxDecoration(
                  color: ThemeHandler.mutedPlusColor(nonInverse: false),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          } else ...{
            Container(
              width: 64.r,
              height: 64.r,
              decoration: BoxDecoration(
                // color: ThemeHandler.mutedPlusColor(nonInverse: false),
                borderRadius: BorderRadius.circular(8.r),
                gradient: _gradientColor,
              ),
              child: widget.imageAssetPath == null
                  ? Icon(
                      widget.icon ?? Iconsax.safe_home,
                      color: AppColors.novaWhite,
                    )
                  : Center(
                      child: SizedBox(
                        height: 32.h,
                        width: 32.w,
                        child: Image.asset(
                          widget.imageAssetPath!,
                        ),
                      ),
                    ),
            ),
          },
          sizedBoxWithWidth(24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.title ?? 'NA',
                              style: AppTextStyles.text16w600,
                            ),
                            if (widget.titleWebsite?.isNotEmpty ?? false) ...{
                              sizedBoxWithWidth(4),
                              InkWell(
                                hoverColor: ThemeHandler.mutedPlusColor(
                                    nonInverse: false),
                                onTap: widget.titleWebsite?.isEmpty ?? true
                                    ? null
                                    : () async {
                                        if (!await launchUrl(
                                            Uri.parse(widget.titleWebsite!))) {
                                          throw 'Could not launch ${widget.titleWebsite}';
                                        }
                                      },
                                child: Icon(
                                  Icons.open_in_new,
                                  size: 14,
                                  color: AppColors.novaIndigo,
                                ),
                              ),
                            },
                          ],
                        ),
                        sizedBoxWithHeight(6),
                        Row(
                          children: [
                            Text.rich(
                              TextSpan(
                                text: widget.subTitlePrefix,
                                children: [
                                  TextSpan(
                                    text: widget.subTitle ?? 'NA',
                                    style: AppTextStyles.text14w300,
                                  ),
                                ],
                              ),
                              style: AppTextStyles.text14w100,
                            ),
                            if (widget.subTitleWebsite?.isNotEmpty ??
                                false) ...{
                              sizedBoxWithWidth(4),
                              InkWell(
                                hoverColor: ThemeHandler.mutedPlusColor(
                                    nonInverse: false),
                                onTap: widget.subTitleWebsite?.isEmpty ?? true
                                    ? null
                                    : () async {
                                        if (!await launchUrl(Uri.parse(
                                            widget.subTitleWebsite!))) {
                                          throw 'Could not launch ${widget.subTitleWebsite}';
                                        }
                                      },
                                child: Icon(
                                  Icons.open_in_new,
                                  size: 14,
                                  color: AppColors.novaIndigo,
                                ),
                              ),
                            },
                          ],
                        ),
                        sizedBoxWithHeight(6),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.fromDate ?? 'NA',
                              style: AppTextStyles.text14w300,
                            ),
                            sizedBoxWithWidth(4),
                            Text(
                              '-',
                              style: AppTextStyles.text14w300,
                            ),
                            sizedBoxWithWidth(4),
                            Text(
                              widget.toDate ?? 'NA',
                              style: AppTextStyles.text14w300,
                            ),
                            if (widget.duration != null) ...{
                              sizedBoxWithWidth(8),
                              CircleAvatar(
                                backgroundColor: ThemeHandler.widgetColor(),
                                radius: 2.r,
                              ),
                              sizedBoxWithWidth(8),
                              Text(
                                widget.duration ?? '',
                                style: AppTextStyles.text14w300,
                              ),
                            },
                          ],
                        ),
                        sizedBoxWithHeight(6),
                      ],
                    ),
                    if (isCurrentUser ?? false) ...{
                      AppIconButton(
                        onTap: widget.onIconPress,
                        icon: Icons.edit_outlined,
                      ),
                    },
                  ],
                ),
                sizedBoxWithHeight(6),
                if (widget.description?.isNotEmpty ?? false) ...{
                  sizedBoxWithHeight(6),
                  ReadMoreText(
                    widget.description ?? '',
                    trimLines: 2,
                    colorClickableText: AppColors.novaIndigo,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Show less',
                    style: AppTextStyles.text14w400.darkModeSupport.copyWith(
                      height: 1.4,
                    ),
                    moreStyle: AppTextStyles.text14w400.indigo,
                  ),
                  sizedBoxWithHeight(6),
                },
                if (widget.location?.isNotEmpty ?? false) ...{
                  sizedBoxWithHeight(6),
                  Row(
                    children: [
                      Icon(
                        Iconsax.location,
                        size: 12,
                        color: ThemeHandler.widgetColor(),
                      ),
                      sizedBoxWithWidth(8),
                      Text(
                        widget.location ?? '',
                        style: AppTextStyles.text14w300,
                      ),
                    ],
                  ),
                },
              ],
            ),
          ),
        ],
      ),
    );
  }
}
