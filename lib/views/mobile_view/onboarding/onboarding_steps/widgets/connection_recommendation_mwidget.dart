import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/loading/loading_mview.dart';
import 'package:provider/provider.dart';

class ConnectionRecommendationFilteredProfileModel {
  final String? filterName;
  final UserModel? userModel;

  ConnectionRecommendationFilteredProfileModel({
    this.filterName,
    this.userModel,
  });
}

class ConnectionRecommendation extends StatefulWidget {
  const ConnectionRecommendation({super.key});

  @override
  State<ConnectionRecommendation> createState() =>
      _ConnectionRecommendationState();
}

class _ConnectionRecommendationState extends State<ConnectionRecommendation> {
  late ProfileNotifier _profileNotifier;
  late final UserModel? userModel;
  List<ConnectionRecommendationFilteredProfileModel>? _filteredProfiles = [];
  bool _fetchingRecommendations = false;

  // bool _buttomSubmitPressed = false;

  @override
  void initState() {
    super.initState();
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    _initValues();
  }

  void _initValues() async {
    // print('Init Values : Connection Step');

    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    userModel = _profileNotifier.userProfile;
    if (userModel == null) {
      // print('User Model Null : Connection Step');
      return;
    }
    setState(() {
      _fetchingRecommendations = true;
    });
    final List<NovaInterests>? userInterests = userModel?.userInterests;
    await _profileNotifier.fetchRecommendedUsers(
      // schoolId: [
      //   userModel?.educations?.first.school ?? '',
      //   userModel?.educations?.first.school ?? ''
      // ],
      interestId1: [userInterests?[0].id ?? '', userInterests?[0].name ?? ''],
      interestId2: [userInterests?[1].id ?? '', userInterests?[1].name ?? ''],
      interestId3: [userInterests?[2].id ?? '', userInterests?[2].name ?? ''],
      // interestId4: [userInterests?[3].id ?? '', userInterests?[3].name ?? ''],
      // interestId5: [userInterests?[4].id ?? '', userInterests?[4].name ?? ''],
    );

    _profileNotifier.recommendedProfiles?.forEach((key, value) {
      _filteredProfiles ??= [];
      for (int i = 0; i < (value?.length ?? 0); i++) {
        _filteredProfiles!.add(
          ConnectionRecommendationFilteredProfileModel(
            filterName: key,
            userModel: value?[i],
          ),
        );
      }
    });
    setState(() {
      _fetchingRecommendations = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // if (_buttomSubmitPressed.not) {
    //   _butonSubmit();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'People you may connect with',
          style: AppTextStyles.text16w600,
        ),
        // sizedBoxWithHeight(16),
        // const AppDividerMwidget(),
        sizedBoxWithHeight(26),
        if (_fetchingRecommendations) ...{
          const Center(
            child: CircularProgressIndicator(),
          ),
        } else ...{
          if (_filteredProfiles?.isNotEmpty ?? false) ...{
            ..._filteredProfiles!.map(
              (e) {
                if (_profileNotifier.userProfile?.id == e.userModel?.id) {
                  // print('Same user');
                  return Container();
                }
                return Column(
                  children: [
                    ConnectionUserTileMWidget(
                      connectionStepFilteredProfileModel: e,
                    ),
                    sizedBoxWithHeight(25),
                  ],
                );
              },
            ).toList(),
          },
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: _filteredProfiles?.length ?? 0,
          //     itemBuilder: (_, index) {
          //       // if (_profileNotifier.userProfile?.id ==
          //       //     _filteredProfiles?[index].userModel?.id) {
          //       //   // print('Same user');
          //       //   return Container();
          //       // }
          //       // return Column(
          //       //   children: [
          //       //     ConnectionUserTileMWidget(
          //       //       connectionStepFilteredProfileModel:
          //       //           _filteredProfiles?[index],
          //       //     ),
          //       //     sizedBoxWithHeight(16),
          //       //   ],
          //       // );
          //     },
          //   ),
          // ),
        },
      ],
    );
  }
}

class ConnectionUserTileMWidget extends StatefulWidget {
  final ConnectionRecommendationFilteredProfileModel?
      connectionStepFilteredProfileModel;
  const ConnectionUserTileMWidget({
    super.key,
    this.connectionStepFilteredProfileModel,
  });

  @override
  State<ConnectionUserTileMWidget> createState() =>
      _ConnectionUserTileMWidgetState();
}

class _ConnectionUserTileMWidgetState extends State<ConnectionUserTileMWidget> {
  late ProfileNotifier _profileNotifier;

  bool isTapped = false;

  Future<void> connectionButtonApiCall({UserModel? toUserProfile}) async {
    isTapped = true;
    setState(() {});
    final noti = Provider.of<ProfileNotifier>(context, listen: false);
    await noti.sendConnectionRequest(
      UserMinimum.getUserMinimum(toUserProfile),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final String subTitlePreText =
        widget.connectionStepFilteredProfileModel?.filterName == 'school'
            ? 'Studies in '
            : 'Interested in ';

    return Row(
      children: [
        AppUserProfileCircle(
          radius: 24.r,
          imageUrl: widget.connectionStepFilteredProfileModel?.userModel
                  ?.profilePictureUrl ??
              '',
          errorText: 'A',
        ),
        sizedBoxWithWidth(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.connectionStepFilteredProfileModel?.userModel?.name ??
                    '',
                style: AppTextStyles.text14w600,
              ),
              sizedBoxWithHeight(4),
              Text.rich(
                TextSpan(
                  text: subTitlePreText,
                  style: AppTextStyles.text12w300.setOpacity(0.8),
                  children: [
                    TextSpan(
                      text: widget
                              .connectionStepFilteredProfileModel?.filterName ??
                          '',
                      style: AppTextStyles.text12w300,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        sizedBoxWithWidth(8),
        CustomButton(
          hoverColor: ThemeHandler.mutedPlusColor(nonInverse: false),
          hoverTextColor: AppColors.novaIndigo,
          text: isTapped ? 'Request Sent' : 'Connect',
          onPressed: () async {
            if (isTapped.not) {
              await connectionButtonApiCall(
                toUserProfile:
                    widget.connectionStepFilteredProfileModel?.userModel,
              );
            }
          },
          height: 32.h,
          width: 104.w,
        ),
      ],
    );
  }
}
