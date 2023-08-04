import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class ProfileAddTileWidget extends StatefulWidget {
  final String? title;
  final String? subTitle;
  final String? iconImage;
  final Function()? onTap;
  const ProfileAddTileWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.iconImage,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ProfileAddTileWidget> createState() => _ProfileAddTileWidgetState();
}

class _ProfileAddTileWidgetState extends State<ProfileAddTileWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (hover) {
        isHover = hover;
        setState(() {});
      },
      enableFeedback: true,
      hoverColor: ThemeHandler.mutedPlusColor(nonInverse: false),
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          decoration: BoxDecoration(
            color: ThemeHandler.mutedPlusColor(nonInverse: false),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              width: 0.5,
              color: ThemeHandler.mutedPlusColor(nonInverse: false),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.iconImage ?? '',
                width: 40.r,
                height: 40.r,
                errorBuilder: (context, error, stackTrace) =>
                    const AppErrorIcon(),
              ),
              sizedBoxWithHeight(8),
              Text(
                widget.title ?? AppStrings.addExperience,
                style: AppTextStyles.text20w400,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              sizedBoxWithHeight(8),
              Text(
                widget.subTitle ?? AppStrings.addExperienceSubTitle,
                style: AppTextStyles.text14w400,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );

    // InkWell(
    //   enableFeedback: true,
    //   excludeFromSemantics: true,
    //   onTap: () {},
    //   hoverColor: Colors.transparent,
    //   onHover: (hover) {
    //     isHover = hover;
    //     setState(() {});
    //   },
    //   child: Container(
    //     width: double.maxFinite,
    //     padding: EdgeInsets.symmetric(vertical: 24.w),
    //     decoration: BoxDecoration(
    //       color: ThemeHandler.backgroundColor(),
    //       border: Border.all(
    //         width: 0.3,
    //         color: isHover ? AppColors.novaIndigo : AppColors.novaWhite,
    //       ),
    //       borderRadius: BorderRadius.circular(16.r),
    //       boxShadow: [
    //         isHover
    //             ? BoxShadow(
    //                 color: AppColors.novaBlack, //New
    //                 blurRadius: 2.r,
    //                 offset: Offset(0, 16.h),
    //               )
    //             : const BoxShadow()
    //       ],
    //     ),
    //     child: Row(
    //       children: [
    //         Container(
    //           width: 48.r,
    //           height: 48.r,
    //           margin: EdgeInsets.symmetric(horizontal: 24.w),
    //           decoration: BoxDecoration(
    //               color: ThemeHandler.mutedPlusColor(),
    //               borderRadius: BorderRadius.circular(8.r),
    //               boxShadow: [
    //                 BoxShadow(
    //                   color: AppColors.novaPurple.withOpacity(0.2), //New
    //                   blurRadius: 32.r,
    //                   offset: const Offset(0, 0),
    //                 )
    //               ]),
    //           child: Icon(
    //             Iconsax.safe_home,
    //             color: AppColors.novaIndigo,
    //           ),
    //         ),
    //         Expanded(
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     widget.title ?? "Add Education",
    //                     style: AppTextStyles.text16w500,
    //                   ),
    //                   sizedBoxWithHeight(2),
    //                   Text(
    //                     widget.subTitle ?? "Add your school, college or course",
    //                     style: AppTextStyles.text12w300,
    //                   ),
    //                 ],
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.only(right: 24.w),
    //                 child: TextButton(
    //                   onPressed: widget.onTap,
    //                   child: Container(
    //                     decoration: BoxDecoration(
    //                       color: AppColors.novaIndigo,
    //                       borderRadius: BorderRadius.circular(4),
    //                     ),
    //                     padding: EdgeInsets.symmetric(
    //                       horizontal: 16.w,
    //                       vertical: 8.h,
    //                     ),
    //                     child: Text(
    //                       'ADD',
    //                       style: AppTextStyles.text16w700.darkModeSupport,
    //                     ),
    //                   ),
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
