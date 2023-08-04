import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/nova/nova.dart';
import 'package:nova_social/data/models/user/user.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/explore_routes.dart/explore_mroutes.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/loading/loading_mview.dart';
import 'package:provider/provider.dart';

class ExploreByTagsMView extends StatefulWidget {
  final ExploreByTagsMViewArgs args;

  const ExploreByTagsMView({
    super.key,
    required this.args,
  });

  @override
  State<ExploreByTagsMView> createState() => _ExploreByTagsMViewState();
}

class _ExploreByTagsMViewState extends State<ExploreByTagsMView> {
  bool _init = true;
  late ProfileNotifier _profileNotifier;
  InitEnum? initValues;
  final _exploreByTagsFormKey = GlobalKey<FormState>();

  final _interestTextEditingController = TextEditingController();
  final _availabilityTextEditingController = TextEditingController();

  NovaInterests? _selectedInterest;
  NovaOpportunities? _selectedOpportunity;

  NovaInterests? _secondaryInterests;
  NovaOpportunities? _secondaryOpportunities;

  String _displaySearchHead = 'People you searched for';

  void _initFields() {
    if (_init && (_selectedInterest == null && _selectedOpportunity == null)) {
      List<NovaInterests>? dummyInterests = _profileNotifier.globalInterests;
      dummyInterests?.shuffle();

      List<NovaOpportunities>? dummyOpportunities =
          _profileNotifier.globalOpportunities;
      dummyOpportunities?.shuffle();

      _selectedInterest = dummyInterests?.first;
      _selectedOpportunity = dummyOpportunities?.first;

      _interestTextEditingController.text = _selectedInterest?.name ?? '';
      _availabilityTextEditingController.text =
          _selectedOpportunity?.name ?? '';

      _init = false;
    }
    _init = false;
  }

  Future<void> _populateData() async {
    if (_profileNotifier.globalInterests?.isEmpty ?? true) {
      await _profileNotifier.fetchGlobalInterests();
    }
    if (_profileNotifier.globalOpportunities?.isEmpty ?? true) {
      await _profileNotifier.fetchGlobalOpportunities();
    }

    _profileNotifier.clearFilterUsers();

    if (_interestTextEditingController.text.isEmpty ||
        _interestTextEditingController.text == '') {
      _selectedInterest = null;
    }
    if (_availabilityTextEditingController.text.isEmpty ||
        _availabilityTextEditingController.text == '') {
      _selectedOpportunity = null;
    }

    _initFields();

    _displaySearchHead = 'People you searched for';

    if (_selectedInterest != null && _selectedOpportunity != null) {
      await _profileNotifier.fetchUserByFilter(
        _selectedInterest!.id ?? '',
        AppKeyNames.userInterestsIds,
        id2: _selectedOpportunity!.id ?? '',
        filter2: AppKeyNames.userOpportunitiesIds,
      );

      _displaySearchHead =
          '\'${_selectedInterest?.name ?? ''}\' open to \'${_selectedOpportunity?.name ?? ''}\'';
    } else if (_selectedInterest != null) {
      await _profileNotifier.fetchUserByFilter(
        _selectedInterest!.id ?? '',
        AppKeyNames.userInterestsIds,
      );
      _displaySearchHead =
          'People with \'${_selectedInterest?.name ?? ''}\' tag';
    } else if (_selectedOpportunity != null) {
      await _profileNotifier.fetchUserByFilter(
        _selectedOpportunity!.id ?? '',
        AppKeyNames.userOpportunitiesIds,
      );
      _displaySearchHead =
          'People with \'${_selectedOpportunity?.name ?? ''}\' tag';
    }
    setState(() {});
  }

  Future<void> _populateSecondaryData() async {
    List<NovaInterests>? dummyInterests = _profileNotifier.globalInterests;
    dummyInterests?.shuffle();

    List<NovaOpportunities>? dummyOpportunities =
        _profileNotifier.globalOpportunities;
    dummyOpportunities?.shuffle();

    _secondaryInterests = dummyInterests?.first;
    _secondaryOpportunities = dummyOpportunities?.first;

    await _profileNotifier.fetchUserByFilter(
      _secondaryInterests?.id ?? '',
      AppKeyNames.userInterestsIds,
      filterNumber: '2',
    );
    await _profileNotifier.fetchUserByFilter(
      _secondaryOpportunities?.id ?? '',
      AppKeyNames.userOpportunitiesIds,
      filterNumber: '3',
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);

    _selectedInterest = widget.args.selectedInterest;
    _selectedOpportunity = widget.args.selectedOpportunity;

    _interestTextEditingController.text = _selectedInterest?.name ?? '';
    _availabilityTextEditingController.text = _selectedOpportunity?.name ?? '';
    setState(() {
      initValues = InitEnum.initializing;
    });
    _populateData().then((value) {
      _populateSecondaryData().then((value) {
        setState(() {
          initValues = InitEnum.initialized;
        });
      });
    });
  }

  final List<Color> dummyColor = [
    AppColors.novaBlue,
    AppColors.novaDarkGreen,
    AppColors.novaDarkYellow,
    AppColors.novaLightGreen,
    AppColors.novaOrange,
    AppColors.novaPeach,
    AppColors.novaPink,
    AppColors.novaPurple,
  ];

  @override
  Widget build(BuildContext context) {
    if (initValues == InitEnum.initializing) {
      return const LoadingMView();
    }
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 16.w,
          ),
          child:
              Consumer<ProfileNotifier>(builder: (context, profileNotifier, _) {
            final List<UserModel>? filterProfiles =
                profileNotifier.filterProfiles;
            final List<UserModel>? filterProfiles2 =
                profileNotifier.filterProfiles2;
            final List<UserModel>? filterProfiles3 =
                profileNotifier.filterProfiles3;

            return Form(
              key: _exploreByTagsFormKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBoxWithHeight(24),
                    if (context.canPop()) ...{
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
                    },
                    Text(
                      'Looking for',
                      style: AppTextStyles.text12w500,
                    ),
                    sizedBoxWithHeight(16),
                    AppMaterialAutofillInputField(
                      label: 'Interests',
                      hint: 'Designer',
                      controller: _interestTextEditingController,
                      maxLines: 1,
                      isRequired: false,
                      suggestions: profileNotifier.globalInterests?.map((e) {
                        final length = (e.name?.length ?? 0) % 8;
                        final color = dummyColor[length];
                        return SuggestionInputModel(
                          iconUrl: e.iconUrl,
                          id: e.id,
                          name: e.name,
                          iconColor: color,
                        );
                      }).toList(),
                      onChanged: (s) {
                        if (s?.isEmpty ?? true) {
                          _selectedInterest = null;

                          _populateData();
                        }
                      },
                      onSuggestionSelected: (s) async {
                        _selectedInterest = profileNotifier.globalInterests
                            ?.cast<NovaInterests?>()
                            .firstWhere(
                              (element) => element?.id == s.id,
                              orElse: () => null,
                            );

                        _interestTextEditingController.text =
                            _selectedInterest?.name ?? '';
                        await _populateData();
                      },
                      textInputAction: TextInputAction.go,
                      suffixIcon: _interestTextEditingController.text.isNotEmpty
                          ? AppIconButton(
                              icon: Icons.close,
                              onTap: () async {
                                _interestTextEditingController.text = '';
                                _selectedInterest = null;
                                await _populateData();
                              },
                              color: AppColors.novaWhite.withOpacity(0.5),
                            )
                          : null,
                    ),
                    sizedBoxWithHeight(24),
                    AppMaterialAutofillInputField(
                      label: 'Availability',
                      hint: 'Open to (volunteering, mentoring, etc)',
                      controller: _availabilityTextEditingController,
                      maxLines: 1,
                      isRequired: false,
                      suggestions:
                          profileNotifier.globalOpportunities?.map((e) {
                        final length = (e.name?.length ?? 0) % 8;
                        final color = dummyColor[length];
                        return SuggestionInputModel(
                          iconUrl: e.iconUrl,
                          id: e.id,
                          name: e.name,
                          iconColor: color,
                        );
                      }).toList(),
                      onChanged: (s) {
                        if (s?.isEmpty ?? true) {
                          _selectedOpportunity = null;

                          _populateData();
                        }
                      },
                      onSuggestionSelected: (s) async {
                        _selectedOpportunity = profileNotifier
                            .globalOpportunities
                            ?.cast<NovaOpportunities?>()
                            .firstWhere(
                              (element) => element?.id == s.id,
                              orElse: () => null,
                            );
                        _availabilityTextEditingController.text =
                            _selectedOpportunity?.name ?? '';
                        await _populateData();
                      },
                      textInputAction: TextInputAction.go,
                      suffixIcon: _availabilityTextEditingController
                              .text.isNotEmpty
                          ? AppIconButton(
                              icon: Icons.close,
                              onTap: () async {
                                _availabilityTextEditingController.text = '';
                                _selectedOpportunity = null;
                                await _populateData();
                              },
                              color: AppColors.novaWhite.withOpacity(0.5),
                            )
                          : null,
                    ),
                    sizedBoxWithHeight(36),
                    _buildSearchedRow(
                      searchHead: _displaySearchHead,
                      filterProfiles: filterProfiles,
                      filterIndex: 1,
                    ),
                    sizedBoxWithHeight(36),
                    Text(
                      'People also searched for',
                      style: AppTextStyles.text18w600,
                    ),
                    sizedBoxWithHeight(36),
                    _buildSearchedRow(
                      searchHead:
                          'People with \'${_secondaryInterests?.name ?? ''}\' tag',
                      filterProfiles: filterProfiles2,
                      filterIndex: 2,
                    ),
                    sizedBoxWithHeight(36),
                    _buildSearchedRow(
                      searchHead:
                          'People with \'${_secondaryOpportunities?.name ?? ''}\' tag',
                      filterProfiles: filterProfiles3,
                      filterIndex: 3,
                    ),
                    sizedBoxWithHeight(36),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildSearchedRow({
    String? searchHead,
    List<UserModel>? filterProfiles,
    int? filterIndex,
  }) {
    NovaInterests? interestToFilter;
    NovaOpportunities? opportunityToFilter;
    if (filterIndex == 2) {
      interestToFilter = _secondaryInterests;
    } else if (filterIndex == 3) {
      opportunityToFilter = _secondaryOpportunities;
    } else {
      interestToFilter = _selectedInterest;
      opportunityToFilter = _selectedOpportunity;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                searchHead ?? 'People you searched for',
                style: AppTextStyles.text16w600,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            sizedBoxWithWidth(8),
            if ((filterProfiles?.isNotEmpty ?? false)) ...{
              GestureDetector(
                onTap: () {
                  context.push(
                    ExploreMRouter.exploreTagsViewAllRoute,
                    extra: ExploreTagsViewAllMViewArgs(
                      selectedInterest: interestToFilter,
                      selectedOpportunity: opportunityToFilter,
                      displaySearchHead: searchHead,
                      filterIndex: filterIndex,
                    ),
                  );
                },
                child: Text(
                  'View All',
                  style: AppTextStyles.text12w400,
                ),
              ),
            },
          ],
        ),
        sizedBoxWithHeight(16),
        if (filterProfiles?.isNotEmpty ?? false) ...{
          SizedBox(
            height: 220.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => ExploreUserDetailsMTile(
                userModel: filterProfiles?[index],
              ),
              separatorBuilder: (_, __) => sizedBoxWithWidth(8),
              itemCount: filterProfiles?.length ?? 0,
            ),
          ),
        } else ...{
          SizedBox(
            height: 210.h,
            child: Center(
              child: Text(
                'No Profiles Found! Try looking for someone else..',
                style: AppTextStyles.text14w400,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        },
      ],
    );
  }
}

class ExploreUserDetailsMTile extends StatelessWidget {
  final UserModel? userModel;
  const ExploreUserDetailsMTile({super.key, this.userModel});

  @override
  Widget build(BuildContext context) {
    final ProfileNotifier profileNotifier =
        Provider.of<ProfileNotifier>(context);
    if (userModel == null) {
      return const SizedBox();
    }
    return GestureDetector(
      onTap: () {
        if (profileNotifier.userProfile?.username == userModel?.username) {
          context.push(
            MobileRouter.profileRoute,
            extra: ProfileMViewArgs(
              isCurrentUser: true,
              profile: userModel,
            ),
          );
        } else {
          context.push(
            MobileRouter.profileRoute,
            extra: ProfileMViewArgs(
              isCurrentUser: false,
              profile: userModel,
            ),
          );
        }
      },
      child: Container(
        height: 220.h,
        width: 140.w,
        decoration: BoxDecoration(
          color: ThemeHandler.mutedPlusColor(nonInverse: false),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 110.h,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 78.h,
                        width: 140.w,
                        child: CachedNetworkImage(
                          height: double.maxFinite,
                          imageUrl: userModel!.profileWallpaperUrl ??
                              AppAssets.nDefaultWallpaper,
                          fit: BoxFit.fill,
                          progressIndicatorBuilder: (context, _, __) =>
                              Container(
                            height: double.maxFinite,
                            decoration: BoxDecoration(
                              color: AppColors.novaIndigo,
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            height: double.maxFinite,
                            decoration: BoxDecoration(
                              color: AppColors.novaIndigo,
                            ),
                          ),
                        ),
                      ),
                      sizedBoxWithHeight(32),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: 140.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppUserProfileCircle(
                          radius: 32.r,
                          imageUrl: userModel!.profilePictureUrl ?? '',
                          errorText: 'NA',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            sizedBoxWithHeight(8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    userModel!.name ?? '',
                    style: AppTextStyles.text14w600,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  if (userModel!.tagline?.isNotEmpty ?? false) ...{
                    sizedBoxWithHeight(4),
                    Text(
                      userModel!.tagline ?? '',
                      style: AppTextStyles.text12w400,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  },
                  if (userModel!.location?.city?.isNotEmpty ?? false) ...{
                    sizedBoxWithHeight(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16.r,
                          color: AppColors.novaLightMuted.withOpacity(0.8),
                        ),
                        Text(
                          ' ${userModel!.location!.city} ',
                          style: AppTextStyles.text12w300.muted,
                        ),
                      ],
                    ),
                  },
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
