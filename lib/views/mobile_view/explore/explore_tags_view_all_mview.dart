import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/nova/nova.dart';
import 'package:nova_social/data/models/user/user.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

class ExploreTagsViewAllMView extends StatefulWidget {
  final ExploreTagsViewAllMViewArgs args;

  const ExploreTagsViewAllMView({
    super.key,
    required this.args,
  });

  @override
  State<ExploreTagsViewAllMView> createState() =>
      _ExploreTagsViewAllMViewState();
}

class _ExploreTagsViewAllMViewState extends State<ExploreTagsViewAllMView> {
  late ProfileNotifier _profileNotifier;
  late ScrollController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    _populateData();
  }

  Future<void> _populateData() async {
    if (_profileNotifier.globalInterests?.isEmpty ?? true) {
      await _profileNotifier.fetchGlobalInterests();
    }
    if (_profileNotifier.globalOpportunities?.isEmpty ?? true) {
      await _profileNotifier.fetchGlobalOpportunities();
    }

    if (widget.args.selectedInterest != null &&
        widget.args.selectedOpportunity != null) {
      await _profileNotifier.fetchUserByFilter(
        widget.args.selectedInterest!.id ?? '',
        AppKeyNames.userInterestsIds,
        id2: widget.args.selectedOpportunity!.id ?? '',
        filter2: AppKeyNames.userOpportunitiesIds,
      );
    } else if (widget.args.selectedInterest != null) {
      await _profileNotifier.fetchUserByFilter(
        widget.args.selectedInterest!.id ?? '',
        AppKeyNames.userInterestsIds,
        filterNumber: widget.args.filterIndex?.toString(),
      );
    } else if (widget.args.selectedOpportunity != null) {
      await _profileNotifier.fetchUserByFilter(
        widget.args.selectedOpportunity!.id ?? '',
        AppKeyNames.userOpportunitiesIds,
        filterNumber: widget.args.filterIndex?.toString(),
      );
    }
  }

  Future<void> _scrollListener() async {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      _populateData();
    }
  }

  @override
  Widget build(BuildContext context) {
    _profileNotifier = Provider.of<ProfileNotifier>(context);
    final List<UserModel?>? filterProfiles = widget.args.filterIndex == 2
        ? _profileNotifier.filterProfiles2
        : (widget.args.filterIndex == 3
            ? _profileNotifier.filterProfiles3
            : _profileNotifier.filterProfiles);
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 16.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxWithHeight(24),
              Row(
                children: [
                  AppIconButton(
                    icon: Icons.arrow_back,
                    onTap: () {
                      context.pop();
                    },
                  ),
                  Expanded(
                    child: Text(
                      'Explore',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.text22w500,
                    ),
                  ),
                ],
              ),
              sizedBoxWithHeight(32),
              Text(
                widget.args.displaySearchHead ?? '',
                style: AppTextStyles.text16w600,
              ),
              sizedBoxWithHeight(16),
              Expanded(
                child: ListView.separated(
                  controller: _controller,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ExploreUserDetailsMTile(
                    userModel: filterProfiles?[index],
                  ),
                  separatorBuilder: (_, __) => sizedBoxWithHeight(16),
                  itemCount: filterProfiles?.length ?? 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExploreUserDetailsMTile extends StatelessWidget {
  final UserModel? userModel;
  const ExploreUserDetailsMTile({super.key, this.userModel});

  @override
  Widget build(BuildContext context) {
    if (userModel == null) {
      return const SizedBox();
    }

    return GestureDetector(
      onTap: () {
        context.push(
          MobileRouter.profileRoute,
          extra: ProfileMViewArgs(
            isCurrentUser: false,
            profile: userModel,
          ),
        );
      },
      child: Row(
        children: [
          AppUserProfileCircle(
            radius: 32.r,
            imageUrl: userModel!.profilePictureUrl ?? '',
            errorText: 'NA',
          ),
          sizedBoxWithWidth(8),
          SizedBox(
            width: ScreenUtil.instance.screenWidth * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userModel!.name ?? '',
                  style: AppTextStyles.text14w600,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (userModel!.tagline?.isNotEmpty ?? false) ...{
                  sizedBoxWithHeight(4),
                  Text(
                    userModel!.tagline ?? '',
                    style: AppTextStyles.text14w600,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                },
                if (userModel!.location?.city?.isNotEmpty ?? false) ...{
                  sizedBoxWithHeight(8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16.r,
                        color: AppColors.novaLightMuted.withOpacity(0.8),
                      ),
                      Text(
                        ' ${userModel!.location!.city} ',
                        style: AppTextStyles.text14w300.muted,
                      ),
                    ],
                  ),
                },
              ],
            ),
          ),
        ],
      ),
    );
  }
}
