import 'package:flutter/material.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/connection/widgets/manage_network_app_bar_mwidget.dart';
import 'package:nova_social/views/mobile_view/connection/widgets/toggle_recieved_sent_mwidget.dart';
import 'package:nova_social/views/mobile_view/connection/widgets/user_request_mtile.dart';
import 'package:provider/provider.dart';

class ConnectionRequestsMView extends StatefulWidget {
  // final ConnectionRequestsMViewArgs args;
  const ConnectionRequestsMView({
    super.key,
    // required this.args,
  });

  @override
  State<ConnectionRequestsMView> createState() =>
      _ConnectionRequestsMViewState();
}

class _ConnectionRequestsMViewState extends State<ConnectionRequestsMView> {
  late ProfileNotifier _profileNoti;
  UserModel? userProfile;
  int selectedMode = 0;

  @override
  void initState() {
    super.initState();
    _profileNoti = Provider.of<ProfileNotifier>(context, listen: false);
    _profileNoti.listenSentConnectionReqs();
  }

  @override
  void dispose() {
    _profileNoti.cancelListenSentConnectionReqs();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileNoti = Provider.of<ProfileNotifier>(context);
    return Scaffold(
      appBar: ManageNetworkAppBarMWidget(
        height: 60.h,
        title: 'Requests',
      ),
      extendBody: true,
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              sizedBoxWithHeight(24),
              ToggleRecievedSentMWidget(
                selectToggle: (v) {
                  setState(() {
                    selectedMode = v;
                  });
                },
                selectedToggle: selectedMode,
              ),
              sizedBoxWithHeight(32),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final connections = selectedMode == 0
                      ? _profileNoti.recievedConnectionReqs
                      : _profileNoti.sentConnectionReqs;
                  if (connections?.isEmpty ?? true) {
                    return const SizedBox();
                  }
                  return UserRequestMTile(
                    user: selectedMode == 0
                        ? (connections?[index].user1)
                        : (connections?[index].user2),
                    connection: connections![index],
                    selectedToggle: selectedMode,
                  );
                },
                separatorBuilder: (context, index) => Column(
                  children: [
                    sizedBoxWithHeight(8),
                    Divider(
                      color: ThemeHandler.widgetColor(),
                    ),
                    sizedBoxWithHeight(8),
                  ],
                ),
                itemCount: selectedMode == 0
                    ? profileNoti.recievedConnectionReqs?.length ?? 0
                    : profileNoti.sentConnectionReqs?.length ?? 0,
              ),
              sizedBoxWithHeight((ScreenUtil.instance.height * 0.5).toInt()),
            ],
          ),
        ),
      ),
    );
  }
}
