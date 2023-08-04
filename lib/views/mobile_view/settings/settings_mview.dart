import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

class SettingsMView extends StatefulWidget {
  const SettingsMView({
    super.key,
  });

  @override
  State<SettingsMView> createState() => _SettingsMViewState();
}

class _SettingsMViewState extends State<SettingsMView> {
  late ProfileNotifier _profileNoti;

  @override
  void initState() {
    super.initState();
    _profileNoti = Provider.of<ProfileNotifier>(context, listen: false);
  }

  @override
  void dispose() {
    _profileNoti.cancellistenAllConnections();
    super.dispose();
    Provider.of<AuthNotifier>(context, listen: false).deleteActionResponse = '';
  }

  @override
  Widget build(BuildContext context) {
    final authNoti = Provider.of<AuthNotifier>(context);
    print('Hihi : ${authNoti.deleteActionResponse}');
    return Scaffold(
      appBar: AppTopNavBarMWidget(height: 60.h, title: 'Settings'),
      extendBody: true,
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  showDialog(
                    context: context,
                    builder: (context) => AppConfirmationDialog(
                      title: 'Logout Account',
                      message: 'Are you sure you want to logout ?',
                      buttonName: 'Logout',
                      onConfirm: () {
                        appLoadingMPopup(context);
                        Provider.of<AuthNotifier>(
                          context,
                          listen: false,
                        ).signOut().then((value) {
                          Navigator.pop(context);
                          Navigator.pop(context);

                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                          context.go(MobileRouter.baseRoute);
                        });
                      },
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: AppColors.novaDarkIndigo,
                  ),
                  title: Text(
                    'Log out',
                    style: AppTextStyles.text16w700,
                  ),
                ),
              ),
              sizedBoxWithHeight(8),
              const AppDividerMwidget(),
              sizedBoxWithHeight(8),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) =>
                        StatefulBuilder(builder: (_, dialogSetState) {
                      return AppConfirmationDialog(
                        title: 'Delete Account',
                        message: (authNoti.deleteActionResponse?.isEmpty ??
                                true)
                            ? 'If you delete the account, you will loose track of all the details related to your account.'
                            : (authNoti.deleteActionResponse ?? ''),
                        buttonName: 'Delete Permanently',
                        messageColor:
                            (authNoti.deleteActionResponse?.isEmpty ?? true)
                                ? null
                                : AppColors.novaRed,
                        onConfirm: () {
                          appLoadingMPopup(context);
                          if (authNoti.deleteActionResponse?.isNotEmpty ??
                              false) {
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            }
                            return;
                          }
                          Provider.of<AuthNotifier>(
                            context,
                            listen: false,
                          ).deleteAccount().then((value) {
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            }
                            if (authNoti.deleteActionResponse?.isEmpty ??
                                true) {
                              if (Navigator.canPop(context)) {
                                Navigator.pop(context);
                              }
                              context.go(MobileRouter.baseRoute);
                            } else {
                              dialogSetState(() {});
                            }
                          });
                        },
                      );
                    }),
                  ).then((value) {
                    authNoti.deleteActionResponse = '';
                  });
                },
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: AppColors.novaRed,
                  ),
                  title: Text(
                    'Delete Account',
                    style: AppTextStyles.text16w700.novaRed,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
