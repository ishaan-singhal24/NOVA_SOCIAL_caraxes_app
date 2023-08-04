import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/profile/profile_notifier.dart';
import 'dart:ui';

import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/app_network_image.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/widgets/add_edit_text_field_widget.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/widgets/add_edit_top_bar_widget.dart';
import 'package:provider/provider.dart';

class ProfileAddEditDream extends StatefulWidget {
  final ProfileAddEditDreamType type;
  const ProfileAddEditDream({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<ProfileAddEditDream> createState() => _ProfileAddEditDreamState();
}

class _ProfileAddEditDreamState extends State<ProfileAddEditDream> {
  final TextEditingController _searchController = TextEditingController();
  List<DreamInterface>? globalList;
  List<DreamInterface>? searchList;
  List<DreamInterface>? selectedList = [];
  late ProfileNotifier profileNoti;

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
  void initState() {
    super.initState();
    formTypeInitialiaztions();
  }

  Future<void> formTypeInitialiaztions() async {
    profileNoti = Provider.of<ProfileNotifier>(context, listen: false);
    switch (widget.type) {
      case ProfileAddEditDreamType.colleges:
        await profileNoti.fetchGlobalCollege();
        globalList = profileNoti.globalColleges?.toList() ?? [];
        selectedList = profileNoti.userProfile?.dreamColleges
                ?.toList()
                .cast<DreamInterface>() ??
            [];
        break;
      case ProfileAddEditDreamType.countries:
        await profileNoti.fetchGlobalCountry();
        globalList = profileNoti.globalCountries?.toList() ?? [];
        selectedList = profileNoti.userProfile?.dreamCountries
                ?.toList()
                .cast<DreamInterface>() ??
            [];
        break;
      case ProfileAddEditDreamType.careers:
        await profileNoti.fetchGlobalCareer();
        globalList = profileNoti.globalCareers?.toList() ?? [];
        selectedList = profileNoti.userProfile?.dreamCareers
                ?.toList()
                .cast<DreamInterface>() ??
            [];
        break;
      default:
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _updateSearchedList();
    });
  }

  void _updateSearchedList() {
    searchList = globalList?.where((interest) {
      return interest.name!
          .toLowerCase()
          .contains(_searchController.text.toLowerCase());
    }).toList();
    selectedList?.forEach((e) {
      searchList?.removeWhere((element) => element.id == e.id);
    });
    selectedList?.sort((a, b) {
      if (a.name == null) return -1;
      if (b.name == null) return 1;
      return b.name!.compareTo(a.name!);
    });
    setState(() {});
  }

  Widget selectItemTile(int index) {
    dummyColor.shuffle();
    return InkWell(
      onTap: () {
        if (selectedList!.length < 3) {
          selectedList?.add(searchList![index]);
          searchList?.removeAt(index);
          setState(() {});
        }
      },
      child: Row(
        children: [
          if (widget.type == ProfileAddEditDreamType.careers) ...{
            CachedNetworkImage(
              imageUrl: searchList?[index].iconUrl ?? '',
              color: dummyColor.first,
              errorWidget: (context, url, error) => const SizedBox(),
              width: 16.r,
              height: 16.r,
            ),
          } else ...{
            AppNetworkImage(
              url: searchList?[index].iconUrl ?? '',
              width: 16.r,
              height: 16.r,
            ),
          },
          sizedBoxWithWidth(16),
          Text(
            searchList?[index].name ?? '',
            style: AppTextStyles.text14w700.darkModeSupport,
          ),
        ],
      ),
    );
  }

  Future<void> saveBtnSubmit() async {
    UserModel? userModel = profileNoti.userProfile;
    switch (widget.type) {
      case ProfileAddEditDreamType.colleges:
        userModel = userModel?.copyWith(
          dreamColleges: selectedList?.cast<UserDreamCollege>(),
          dreamCareersIds: {
            for (UserDreamCollege v
                in (selectedList?.cast<UserDreamCollege>()) ?? [])
              v.id.toString(): true
          },
        );
        break;
      case ProfileAddEditDreamType.countries:
        userModel = userModel?.copyWith(
          dreamCountries: selectedList?.cast<UserDreamCountry>(),
          dreamCountriesIds: {
            for (UserDreamCountry v
                in (selectedList?.cast<UserDreamCountry>()) ?? [])
              v.id.toString(): true
          },
        );
        break;
      case ProfileAddEditDreamType.careers:
        userModel = userModel?.copyWith(
          dreamCareers: selectedList?.cast<UserDreamCareer>(),
          dreamCareersIds: {
            for (UserDreamCareer v
                in (selectedList?.cast<UserDreamCareer>()) ?? [])
              v.id.toString(): true
          },
        );
        break;
      default:
    }
    await profileNoti.saveProfile(userModel!).then((value) {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool kIsLargeScreen = !ResponsiveWidget.isSmallScreen();
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: FittedBox(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: kIsLargeScreen
                  ? ScreenUtil.instance.width * 0.5
                  : ScreenUtil.instance.width * 0.8,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ThemeHandler.backgroundColor(),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(16.w),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBoxWithHeight(16),
                  AddEditTopBarWidget(
                    title: 'Dream ${widget.type.name.toString()}',
                  ),
                  sizedBoxWithHeight(16),
                  AppMaterialInputField(
                    label: 'Search ${widget.type.name.toString()}',
                    controller: _searchController,
                    isRequired: false,
                    onChanged: (v) {
                      _updateSearchedList();
                    },
                  ),
                  sizedBoxWithHeight(16),
                  if (selectedList?.isNotEmpty ?? false) ...{
                    Wrap(
                      alignment: WrapAlignment.start,
                      direction: Axis.horizontal,
                      runSpacing: 8.r,
                      spacing: 8.r,
                      children: [
                        ...selectedList!.map(
                          (e) {
                            dummyColor.shuffle();
                            return FittedBox(
                              child: AppChip(
                                onTap: () {
                                  selectedList?.remove(e);
                                  _updateSearchedList();
                                },
                                prefixColor: dummyColor.first,
                                text: e.name ?? 'NA',
                                type: AppChipType.outlined,
                                color: AppColors.novaIndigo,
                                prefix: widget.type ==
                                        ProfileAddEditDreamType.careers
                                    ? CachedNetworkImage(
                                        imageUrl: e.iconUrl ?? '',
                                        color: dummyColor.first,
                                        errorWidget: (context, url, error) =>
                                            const SizedBox(),
                                        width: 16.r,
                                        height: 16.r,
                                      )
                                    : AppNetworkImage(
                                        url: e.iconUrl ?? '',
                                        width: 16.r,
                                        height: 16.r,
                                      ),
                                leading: Icon(
                                  Icons.close,
                                  color: ThemeHandler.widgetColor(),
                                  size: 12.r,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  },
                  sizedBoxWithHeight(16),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.novaIndigo,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      'You can select a maximum of 3 ${widget.type.name.toString()}',
                      style: AppTextStyles.text12w400.white,
                    ),
                  ),
                  sizedBoxWithHeight(16),
                  SizedBox(
                    height: 380.h,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ListView.separated(
                            separatorBuilder: (ctx, _) => Divider(
                              color: ThemeHandler.novaMutedColor(),
                              thickness: 0.5,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 16.h,
                            ),
                            itemCount: searchList?.length ?? 0,
                            itemBuilder: (ctx, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: index == (searchList?.length ?? 0) - 1
                                      ? 80.h
                                      : 0.0,
                                ),
                                child: selectItemTile(index),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            height: 60.h,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  ThemeHandler.backgroundColor().withOpacity(0),
                                  ThemeHandler.backgroundColor(),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    onPressed: saveBtnSubmit,
                    text: AppStrings.saveChanges,
                  ),
                  sizedBoxWithHeight(16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
