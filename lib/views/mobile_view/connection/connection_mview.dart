import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/connection/widgets/user_request_mtile.dart';
import 'package:nova_social/views/mobile_view/onboarding/onboarding_steps/widgets/connection_recommendation_mwidget.dart';
import 'package:provider/provider.dart';

class ConnectionMView extends StatefulWidget {
  const ConnectionMView({super.key});

  @override
  State<ConnectionMView> createState() => _ConnectionMViewState();
}

class _ConnectionMViewState extends State<ConnectionMView> {
  late ProfileNotifier profileNoti;
  UserModel? userProfile;
  int selectedMode = 0;
  String buttonText = 'view Sent Request';
  late int length;
  bool viewAll = false;
  String viewButtonText = "View All";
  late int totalLength;

  @override
  void initState() {
    super.initState();
    profileNoti = Provider.of<ProfileNotifier>(context, listen: false);
    profileNoti.listenRecievedConnectionReqs();
    profileNoti.listenSentConnectionReqs();
  }

  @override
  void dispose() {
    profileNoti.cancelListenRecievedConnectionReqs();
    profileNoti.cancelListenSentConnectionReqs();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    profileNoti = Provider.of<ProfileNotifier>(context);
    totalLength = selectedMode == 0
        ? profileNoti.recievedConnectionReqs?.length ?? 0
        : profileNoti.sentConnectionReqs?.length ?? 0;
    if (viewAll) {
      length = selectedMode == 0
          ? profileNoti.recievedConnectionReqs?.length ?? 0
          : profileNoti.sentConnectionReqs?.length ?? 0;
      viewButtonText = "View Less";
    } else {
      length = selectedMode == 0
          ? min(profileNoti.recievedConnectionReqs?.length ?? 0, 4)
          : min(profileNoti.sentConnectionReqs?.length ?? 0, 4);
      viewButtonText = "View All";
    }

    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              sizedBoxWithHeight(18),
              InkWell(
                onTap: () {
                  context.push(
                    MobileRouter.manageNetworkRoute,
                    extra: ManageNetworkMViewArgs(
                      profile: profileNoti.userProfile,
                      isCurrentUser: true,
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.manageConnections,
                      style: AppTextStyles.text16w600,
                    ),
                    Iconify(
                      MaterialSymbols.arrow_forward_ios,
                      color: AppColors.novaWhite,
                    ),
                  ],
                ),
              ),

              sizedBoxWithHeight(16),

              const AppDividerMwidget(
                thickness: 0.2,
              ),

              sizedBoxWithHeight(16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.connectionRequest,
                    style: AppTextStyles.text16w600,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     context.push(
                  //       MobileRouter.connectionReqRoute,
                  //     );
                  //   },
                  //   child: Text(
                  //     AppStrings.viewAll,
                  //     style: AppTextStyles.text12w400,
                  //   ),
                  // ),

                  InkWell(
                    onTap: () {
                      // context.push(
                      //   MobileRouter.connectionReqRoute,
                      // );

                      if (selectedMode == 0) {
                        selectedMode = 1;
                        buttonText = AppStrings.viewReceivedRequest;
                        setState(() {});
                      } else {
                        selectedMode = 0;
                        buttonText = AppStrings.viewSentRequest;
                        setState(() {});
                      }
                    },
                    child: Text(
                      // AppStrings.viewSentRequest,
                      buttonText,
                      style: AppTextStyles.text12w400,
                    ),
                  ),
                ],
              ),

              if (length != 0) ...{
                sizedBoxWithHeight(24),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final connections = selectedMode == 0
                        ? profileNoti.recievedConnectionReqs
                        : profileNoti.sentConnectionReqs;
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
                      sizedBoxWithHeight(24),
                    ],
                  ),
                  itemCount: length,
                ),
              },

              if (totalLength > 4) ...{
                sizedBoxWithHeight(32),
                GestureDetector(
                  child: InkWell(
                    // splashColor: AppColors.novaDarkIndigo,
                    onTap: () {
                      setState(() {
                        viewAll = viewAll.not;
                      });
                    },
                    child: Text(
                      viewButtonText,
                      style: AppTextStyles.text12w400.indigo,
                    ),
                  ),
                )
              },

              sizedBoxWithHeight(30),

              const ConnectionRecommendation(),

              sizedBoxWithHeight(24),

              // ListView.separated(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemBuilder: (context, index) {
              //     final connections = _profileNoti.recievedConnectionReqs;
              //     if (connections?.isEmpty ?? true) {
              //       return const SizedBox();
              //     }
              //     return UserRequestMTile(
              //       user: (connections?[index].user1),
              //       connection: connections![index],
              //       selectedToggle: 0,
              //     );
              //   },
              //   separatorBuilder: (context, index) => Column(
              //     children: [
              //       sizedBoxWithHeight(8),
              //       Divider(
              //         color: ThemeHandler.widgetColor(),
              //       ),
              //       sizedBoxWithHeight(8),
              //     ],
              //   ),
              //   itemCount: max(
              //     _profileNoti.recievedConnectionReqs?.length ?? 0,
              //     min(_profileNoti.recievedConnectionReqs?.length ?? 0, 4),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
