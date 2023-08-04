import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/feed/feed_model.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

void showDeletePostSnackbar(BuildContext context, FeedModel feedModel) {
  appSnackBarMWidget(
    context: context,
    content: GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => FeedDeletePopupMWidget(
            feedId: (feedModel.id) ?? '',
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Icon(
              Icons.delete,
              size: 16.r,
              color: AppColors.novaWhite,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              'Delete',
              style: AppTextStyles.text14w400,
            ),
          ),
        ],
      ),
    ),
  );
}

class FeedDeletePopupMWidget extends StatelessWidget {
  final String feedId;
  const FeedDeletePopupMWidget({super.key, required this.feedId});

  @override
  Widget build(BuildContext context) {
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
                    'Delete Post',
                    style: AppTextStyles.text20w600,
                  ),
                ),
                sizedBoxWithHeight(24),
                _buildDeleteWidget(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Are you sure you want to delete this post?',
          style: AppTextStyles.text14w400,
        ),
        sizedBoxWithHeight(24),
        CustomButton(
          text: 'Confirm',
          onPressed: () async {
            appLoadingMPopup(context);
            await Provider.of<FeedNotifier>(context, listen: false)
                .deleteFeed(feedId: feedId)
                .then((_) {
              context.pop();
              context.pop();
            });
            appSnackBarMWidget(
              context: context,
              content: Center(
                child: Text(
                  'Post Deleted!',
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
