import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/notification/widgets/notification_item_mtile.dart';
import 'package:provider/provider.dart';

class NotificationMView extends StatefulWidget {
  const NotificationMView({super.key});

  @override
  State<NotificationMView> createState() => _NotificationMViewState();
}

class _NotificationMViewState extends State<NotificationMView> {
  late ScrollController _controller;
  UserModel? userProfile;

  List<RepoNotification>? noti;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    userProfile =
        Provider.of<ProfileNotifier>(context, listen: false).userProfile;
  }

  // manipNoti() {
  //   noti?.sort(
  //       (a, b) => b == null ? 1 : a.createdAt?.compareTo(b.createdAt!) ?? -1);
  //   for (var i = 0; i < (noti?.length ?? 0); i++) {}
  // }

  @override
  Widget build(BuildContext context) {
    final noti = Provider.of<NotificationNotifier>(context);

    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              sizedBoxWithHeight(24),
              if (noti.notifications?.isEmpty ?? true) ...{
                SizedBox(
                  height: ScreenUtil.instance.height * 0.35,
                ),
                Center(
                  child: Text(
                    'No Recent Notifications to Show!',
                    style: AppTextStyles.text16w400,
                    textAlign: TextAlign.center,
                  ),
                ),
              },
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var notification = noti.notifications?[index];
                  return NotificationItemMTile(
                    notification: notification!,
                    tileSeen: (v) {
                      if (v != true) {
                        return;
                      }
                      notification = notification?.copyWith(isRead: true);
                      noti.updateNotification(notification!);
                    },
                  );
                },
                separatorBuilder: (_, __) => sizedBoxWithHeight(12),
                itemCount: noti.notifications?.length ?? 0,
              ),
              sizedBoxWithHeight((ScreenUtil.instance.height * 0.3).toInt()),
            ],
          ),
        ),
      ),
    );
  }
}
