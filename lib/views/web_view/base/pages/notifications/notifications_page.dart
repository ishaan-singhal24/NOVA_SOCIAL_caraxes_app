import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/base/pages/notifications/widgets/widgets.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxWithHeight(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  AppStrings.notifications,
                  style: AppTextStyles.text22w700,
                ),
              ),
              sizedBoxWithHeight(32),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            const [
              CommentNotification(),
              ReactionNotification(),
              ShareNotification(),
              RequestNotification(),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 0.2),
                  ),
                ),
              ),
              sizedBoxWithHeight(88),
            ],
          ),
        ),
      ],
    );
  }
}
