import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/profile/explore/widgets/explore_user_info_mtile.dart';
import 'package:provider/provider.dart';

class ExploreDreamsMView extends StatefulWidget {
  final ExploreDreamsMViewArgs args;
  const ExploreDreamsMView({
    super.key,
    required this.args,
  });

  @override
  State<ExploreDreamsMView> createState() => _ExploreDreamsMViewState();
}

class _ExploreDreamsMViewState extends State<ExploreDreamsMView> {
  ProfileAddEditDreamType? dreamType;
  int? selectedDreamIndex;

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

  late ScrollController _controller;
  late ProfileNotifier _profileNoti;

  Future<void> onChipTap(ProfileAddEditDreamType type, int index) async {
    dreamType = type;
    selectedDreamIndex = index;
    _profileNoti.clearFilterUsers();
    appLoadingMPopup(context);
    await populateData().then((value) {
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    super.initState();
    dreamType = widget.args.dreamType;
    selectedDreamIndex = widget.args.selectedDreamIndex;
    _profileNoti = Provider.of<ProfileNotifier>(context, listen: false);
    _profileNoti.clearFilterUsers();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        populateData();
      },
    );
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  Future<void> populateData() async {
    await _profileNoti.fetchUserByFilter(
      selectedDreamValue().id ?? '',
      appKeyNames(),
    );
  }

  DreamInterface selectedDreamValue() {
    switch (dreamType) {
      case ProfileAddEditDreamType.colleges:
        return widget
            .args.profileArgs.profile!.dreamColleges![selectedDreamIndex!];
      case ProfileAddEditDreamType.careers:
        return widget
            .args.profileArgs.profile!.dreamCareers![selectedDreamIndex!];
      default:
        return widget
            .args.profileArgs.profile!.dreamCountries![selectedDreamIndex!];
    }
  }

  String appKeyNames() {
    switch (dreamType) {
      case ProfileAddEditDreamType.colleges:
        return AppKeyNames.dreamCollegesIds;
      case ProfileAddEditDreamType.careers:
        return AppKeyNames.dreamCareersIds;
      default:
        return AppKeyNames.dreamCountriesIds;
    }
  }

  Future<void> _scrollListener() async {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      // "reach the bottom";
      appLoadingMPopup(context);
      await populateData().then((value) {
        Navigator.pop(context);
      });
    }
  }

  Widget dreamItem(
    DreamInterface item,
    ProfileAddEditDreamType type,
    int index,
  ) {
    int i = (item.name!.length) % 8;
    Color color = dummyColor[i];
    var nameSplit = item.name?.split(' ');
    String? shortStringName;
    if ((nameSplit?.length ?? 0) > 3) {
      for (int i = 0; i < nameSplit!.length; i++) {
        if (nameSplit[i] == 'of' || nameSplit[i].startsWith('(')) {
          continue;
        }
        shortStringName ??= '';
        shortStringName += nameSplit[i].substring(0, 1);
      }
    } else {
      shortStringName = item.name;
    }

    return SizedBox(
      width: ScreenUtil.instance.width * 0.25,
      child: InkWell(
        onTap: () {
          onChipTap(type, index);
        },
        child: Container(
          constraints: BoxConstraints(
            maxWidth: ScreenUtil.instance.width * 0.2,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: (type == dreamType && index == selectedDreamIndex)
                ? AppColors.novaDarkIndigo.withOpacity(0.3)
                : null,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 8.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (type != ProfileAddEditDreamType.colleges) ...{
                CachedNetworkImage(
                  imageUrl: item.iconUrl ?? '',
                  color: type == ProfileAddEditDreamType.careers ? color : null,
                  errorWidget: (context, url, error) => const SizedBox(),
                  width: 32.r,
                  height: 32.r,
                ),
              } else ...{
                AppNetworkImageM(
                  url: item.iconUrl ?? 'NA',
                  width: 32.r,
                  height: 32.r,
                ),
              },
              sizedBoxWithHeight(6),
              Text(
                shortStringName ?? 'NA',
                style: AppTextStyles.text12w700.darkModeSupport,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dreamItems(
    List<DreamInterface> data,
    ProfileAddEditDreamType type,
  ) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...data.mapIndexed(
            (i, e) => dreamItem(
              data[i],
              type,
              i,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: Consumer<ProfileNotifier>(
          builder: (ctx, profileNoti, _) {
            final List<UserModel>? filterProfiles = profileNoti.filterProfiles;
            return SingleChildScrollView(
              controller: _controller,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBoxWithHeight(24),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppIconButton(
                        color: AppColors.novaWhite,
                        icon: Icons.close,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Dream Future',
                            style: AppTextStyles.text28w500,
                          ),
                        ),
                      ),
                      if (widget.args.profileArgs.isCurrentUser ?? false) ...{
                        AppIconButton(
                          color: AppColors.novaWhite,
                          icon: Icons.edit_outlined,
                          onTap: () {
                            context.push(
                              AddEditMRouter.addEditDreamRoute,
                              extra: dreamType,
                            );
                          },
                        ),
                      },
                    ],
                  ),
                  sizedBoxWithHeight(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.args.profileArgs.profile?.dreamCareers
                              ?.isNotEmpty ??
                          false) ...{
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              dreamType = ProfileAddEditDreamType.careers;
                              profileNoti.clearFilterUsers();
                              selectedDreamIndex = 0;
                              populateData();
                              setState(() {});
                            },
                            child: SizedBox(
                              width: double.maxFinite,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: dreamType ==
                                              ProfileAddEditDreamType.careers
                                          ? AppColors.novaDarkIndigo
                                          : ThemeHandler.backgroundColor(),
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Careers',
                                      style: dreamType ==
                                              ProfileAddEditDreamType.careers
                                          ? AppTextStyles.text16w800
                                          : AppTextStyles.text16w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      },
                      sizedBoxWithWidth(8),
                      if (widget.args.profileArgs.profile?.dreamCountries
                              ?.isNotEmpty ??
                          false) ...{
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              dreamType = ProfileAddEditDreamType.countries;
                              profileNoti.clearFilterUsers();
                              selectedDreamIndex = 0;
                              populateData();
                              setState(() {});
                            },
                            child: SizedBox(
                              width: double.maxFinite,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: dreamType ==
                                              ProfileAddEditDreamType.countries
                                          ? AppColors.novaDarkIndigo
                                          : ThemeHandler.backgroundColor(),
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Countries',
                                      style: dreamType ==
                                              ProfileAddEditDreamType.countries
                                          ? AppTextStyles.text16w800
                                          : AppTextStyles.text16w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      },
                      sizedBoxWithWidth(8),
                      if (widget.args.profileArgs.profile?.dreamColleges
                              ?.isNotEmpty ??
                          false) ...{
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              dreamType = ProfileAddEditDreamType.colleges;
                              profileNoti.clearFilterUsers();
                              selectedDreamIndex = 0;
                              populateData();
                              setState(() {});
                            },
                            child: SizedBox(
                              width: double.maxFinite,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: dreamType ==
                                              ProfileAddEditDreamType.colleges
                                          ? AppColors.novaDarkIndigo
                                          : ThemeHandler.backgroundColor(),
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Colleges',
                                      style: dreamType ==
                                              ProfileAddEditDreamType.colleges
                                          ? AppTextStyles.text16w800
                                          : AppTextStyles.text16w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      },
                    ],
                  ),
                  sizedBoxWithHeight(40),
                  if ((widget.args.profileArgs.profile?.dreamCareers
                              ?.isNotEmpty ??
                          false) &&
                      dreamType == ProfileAddEditDreamType.careers) ...{
                    dreamItems(
                      widget.args.profileArgs.profile?.dreamCareers ?? [],
                      ProfileAddEditDreamType.careers,
                    ),
                  },
                  if ((widget.args.profileArgs.profile?.dreamColleges
                              ?.isNotEmpty ??
                          false) &&
                      dreamType == ProfileAddEditDreamType.colleges) ...{
                    dreamItems(
                      widget.args.profileArgs.profile?.dreamColleges ?? [],
                      ProfileAddEditDreamType.colleges,
                    ),
                  },
                  if ((widget.args.profileArgs.profile?.dreamCountries
                              ?.isNotEmpty ??
                          false) &&
                      dreamType == ProfileAddEditDreamType.countries) ...{
                    dreamItems(
                      widget.args.profileArgs.profile?.dreamCountries ?? [],
                      ProfileAddEditDreamType.countries,
                    ),
                  },
                  sizedBoxWithHeight(40),
                  if (selectedDreamIndex != null) ...{
                    Text(
                      'People with ${selectedDreamValue().name} dream ${dreamType?.name}',
                      style: AppTextStyles.text16w600,
                    ),
                    sizedBoxWithHeight(24),
                  },
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ExploreUserInfoMTile(
                      profile: filterProfiles?[index],
                    ),
                    separatorBuilder: (_, __) => sizedBoxWithHeight(24),
                    itemCount: filterProfiles?.length ?? 0,
                  ),
                  sizedBoxWithHeight(24),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
