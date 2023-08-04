import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

void showReportPostSnackbar({
  required BuildContext context,
}) {
  appSnackBarMWidget(
    context: context,
    content: GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => const FeedReportPopupMWidget(),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Icon(
              Icons.crisis_alert,
              size: 16.r,
              color: AppColors.novaWhite,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              'Report Inappropriate',
              style: AppTextStyles.text14w400,
            ),
          ),
        ],
      ),
    ),
  );
}

class FeedReportPopupMWidget extends StatelessWidget {
  const FeedReportPopupMWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final FeedNotifier feedNotifier = Provider.of<FeedNotifier>(context);
    final ProfileNotifier profileNotifier =
        Provider.of<ProfileNotifier>(context);

    final UserModel? currentUser = profileNotifier.userProfile;
    final UserMinimum? userReported =
        feedNotifier.currentReportedByList?.firstWhere(
      (element) => element.id == currentUser?.id,
      orElse: () => const UserMinimum(),
    );
    final bool hasAlreadyReported = userReported?.id?.isNotEmpty ?? false;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: AppColors.novaIndigo.withOpacity(0.5),
        child: FittedBox(
          child: Container(
            width: ScreenUtil.instance.screenWidth * 0.9,
            padding: EdgeInsets.all(24.r),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ThemeHandler.backgroundColor(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Report Inappropriate',
                    style: AppTextStyles.text20w600,
                  ),
                ),
                sizedBoxWithHeight(24),
                _buildReportWidget(
                  context: context,
                  userModel: currentUser,
                  hasAlreadyReported: hasAlreadyReported,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReportWidget({
    required BuildContext context,
    UserModel? userModel,
    required bool hasAlreadyReported,
  }) {
    return hasAlreadyReported
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'You have already reported this post!',
                style: AppTextStyles.text14w600,
              ),
              sizedBoxWithHeight(8),
              Text(
                'Don\'t worry! Sit back and relax. Our team is already looking after this post. We will take all the necessary actions soon.',
                style: AppTextStyles.text14w400,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              sizedBoxWithHeight(24),
              CustomButton(
                text: 'Okay',
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Is this post inappropriate?',
                style: AppTextStyles.text14w600,
              ),
              sizedBoxWithHeight(8),
              Text(
                'After you report the post, we will review it within 24 hrs and if deemed inappropriate, the post will be removed within that timeframe. We will also take actions against it\'s author.',
                style: AppTextStyles.text14w400,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              sizedBoxWithHeight(24),
              CustomButton(
                text: 'Report',
                onPressed: () async {
                  appLoadingMPopup(context);
                  UserMinimum userMinimum =
                      UserMinimum.getUserMinimum(userModel);
                  await Provider.of<FeedNotifier>(context, listen: false)
                      .reportFeed(currentUser: userMinimum)
                      .then((_) {
                    context.pop();
                    context.pop();
                  });
                  appSnackBarMWidget(
                    context: context,
                    content: Center(
                      child: Text(
                        'Post Reported Inappropriate!',
                        style: AppTextStyles.text14w400,
                      ),
                    ),
                  );
                },
              ),
              sizedBoxWithHeight(16),
              CustomButton(
                color: ThemeHandler.backgroundColor(),
                text: 'Cancel',
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          );
  }
}
