import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/explore/cards/widgets/explore_user_tile.dart';
import 'package:provider/provider.dart';

class ExploreBody extends StatefulWidget {
  final ExploreViewArgs? args;
  final Function(bool)? showAll;
  const ExploreBody({
    Key? key,
    this.args,
    this.showAll,
  }) : super(key: key);

  @override
  State<ExploreBody> createState() => _ExploreBodyState();
}

class _ExploreBodyState extends State<ExploreBody> {
  bool showAll = false;

  String pageTagName = AppStrings.interest;
  String pageSubtitle = AppStrings.peopleYouMayWantToConnect;

  void _textInit() {
    switch (widget.args?.pageType) {
      case ExploreViewArgsPageType.available:
        pageTagName = AppStrings.available;
        pageSubtitle = AppStrings.peopleYouMayWantToCollaborate;
        break;
      case ExploreViewArgsPageType.interest:
        pageTagName = AppStrings.interest;
        pageSubtitle = AppStrings.peopleYouMayWantToConnect;
        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
    _textInit();
  }

  Future<void> _addToYourProfile() async {
    final noti = Provider.of<ProfileNotifier>(context, listen: false);
    List<GlobalDocHelperInterface>? globalList = [];
    switch (widget.args?.pageType) {
      case ExploreViewArgsPageType.available:
        await noti.fetchGlobalOpportunities();
        globalList = noti.globalOpportunities;
        NovaOpportunities? opportunity =
            globalList?.firstWhere((element) => element.id == widget.args?.id)
                as NovaOpportunities;
        UserModel? userModel = noti.userProfile;
        List<NovaOpportunities>? userOpportunities =
            userModel?.userOpportunities?.toList() ?? [];
        userOpportunities.add(opportunity);
        userModel = userModel?.copyWith(userOpportunities: userOpportunities);
        noti.saveProfile(userModel!);

        break;
      case ExploreViewArgsPageType.interest:
        await noti.fetchGlobalOpportunities();
        globalList = noti.globalInterests;
        NovaInterests? interest =
            globalList?.firstWhere((element) => element.id == widget.args?.id)
                as NovaInterests;
        UserModel? userModel = noti.userProfile;
        List<NovaInterests>? userInterests =
            userModel?.userInterests?.toList() ?? [];
        userInterests.add(interest);
        userModel = userModel?.copyWith(userInterests: userInterests);
        noti.saveProfile(userModel!);
        break;
      default:
    }
  }

  var _showCopiedText = false;

  @override
  Widget build(BuildContext context) {
    final profileNoti = context.watch<ProfileNotifier>();
    final List<UserModel>? filterProfiles = profileNoti.filterProfiles;
    final username = profileNoti.userProfile?.username ?? '';
    final inviteCode = profileNoti.userProfile?.inviteCode ?? 'NA';
    final inviteLink =
        'https://app.novasocial.club/invite/$username/$inviteCode';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.args?.name ?? 'NA',
              style: AppTextStyles.text30w400,
            ),
            const Spacer(),
            // CustomButton(
            //   text: 'Add to your profile',
            //   onPressed: () {
            //     _addToYourProfile();
            //   },
            //   width: 135.w,
            // ),
          ],
        ),
        sizedBoxWithHeight(8),
        Text(
          pageTagName,
          style: AppTextStyles.text16w600.subHead,
        ),
        sizedBoxWithHeight(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              pageSubtitle,
              style: AppTextStyles.text20w400,
            ),
            TextButton(
              onPressed: () {
                showAll = !showAll;
                widget.showAll!(showAll);
                setState(() {});

                if (showAll) {
                  context.read<ProfileNotifier>().fetchUserByFilter(
                        widget.args?.id ?? '',
                        widget.args?.filterBy ?? '',
                      );
                }
              },
              child: Row(
                children: [
                  Text(
                    'Show ${showAll ? 'Less' : 'All'}',
                    style: AppTextStyles.text14w600,
                  ),
                  sizedBoxWithWidth(6),
                  Icon(
                    showAll ? Icons.arrow_upward : Icons.arrow_downward,
                    size: 12.r,
                    color: ThemeHandler.widgetColor(),
                  ),
                ],
              ),
            ),
          ],
        ),
        sizedBoxWithHeight(24),
        if (filterProfiles?.isNotEmpty ?? false) ...{
          Wrap(
            runSpacing: 16.r,
            spacing: 16.r,
            children: [
              ...filterProfiles!
                  .getRange(
                      0,
                      showAll
                          ? filterProfiles.length
                          : min(4, filterProfiles.length))
                  .map(
                    (profile) => ExploreUserTile(
                      profile: profile,
                    ),
                  ),
            ],
          ),
          sizedBoxWithHeight(24),
        },
        Divider(
          height: 0.5,
          color: ThemeHandler.novaMutedColor(),
        ),
        sizedBoxWithHeight(24),
        if (showAll.not) ...{
          Text(
            'Know some ${widget.args?.name ?? 'NA'} friends? Introduce them to Nova!',
            style: AppTextStyles.text20w400,
          ),
          sizedBoxWithHeight(16),
          Row(
            children: [
              Container(
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: AppColors.novaIndigo,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 8.h,
                ),
                child: Text(
                  inviteLink,
                  style: AppTextStyles.text14w500,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              sizedBoxWithWidth(8),
              CustomButton(
                height: 40.h,
                text: 'Copy',
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(
                      text: inviteLink,
                    ),
                  ).then((value) {
                    setState(() {
                      _showCopiedText = true;
                    });
                    Future.delayed(
                      const Duration(
                        seconds: 1,
                      ),
                    ).then((value) {
                      setState(() {
                        _showCopiedText = false;
                      });
                    });
                  });
                },
                width: 100.w,
              ),
            ],
          ),
          if (_showCopiedText) ...{
            sizedBoxWithHeight(16),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: ThemeHandler.mutedPlusColor(nonInverse: false),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 8.h,
                ),
                child: Text(
                  'Link Copied',
                  style: AppTextStyles.text14w300,
                ),
              ),
            ),
          },
        },
      ],
    );
  }
}
