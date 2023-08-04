import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/widgets/profile_add_edit_app_bar_mwidget.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

class ProfileAddEditDreamMView extends StatefulWidget {
  final ProfileAddEditDreamType? dreamType;
  const ProfileAddEditDreamMView({
    super.key,
    this.dreamType,
  });

  @override
  State<ProfileAddEditDreamMView> createState() =>
      _ProfileAddEditDreamMViewState();
}

class _ProfileAddEditDreamMViewState extends State<ProfileAddEditDreamMView> {
  final TextEditingController _searchController = TextEditingController();
  late FocusNode _searchFocusNode;
  late ProfileNotifier _profileNotifier;
  late ProfileAddEditDreamType dreamType;

  List<DreamInterface>? globalCareers;
  List<DreamInterface>? globalCountries;
  List<DreamInterface>? globalColleges;

  List<DreamInterface>? searchCareers;
  List<DreamInterface>? searchCountries;
  List<DreamInterface>? searchColleges;

  List<DreamInterface>? selectedCareers = [];
  List<DreamInterface>? selectedCountries = [];
  List<DreamInterface>? selectedColleges = [];
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
    _searchFocusNode = FocusNode();
    dreamType = widget.dreamType ?? ProfileAddEditDreamType.careers;
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initialization();
    });
  }

  Future<void> initialization() async {
    globalColleges = _profileNotifier.globalColleges?.toList() ?? [];
    if (globalColleges?.isEmpty ?? true) {
      await _profileNotifier.fetchGlobalCollege();
      globalColleges = _profileNotifier.globalColleges?.toList() ?? [];
    }
    selectedColleges = _profileNotifier.userProfile?.dreamColleges
            ?.toList()
            .cast<DreamInterface>() ??
        [];
    dreamType = ProfileAddEditDreamType.colleges;
    _updateSearchedList();

    globalCountries = _profileNotifier.globalCountries?.toList() ?? [];
    if (globalCountries?.isEmpty ?? true) {
      await _profileNotifier.fetchGlobalCountry();
      globalCountries = _profileNotifier.globalCountries?.toList() ?? [];
    }
    selectedCountries = _profileNotifier.userProfile?.dreamCountries
            ?.toList()
            .cast<DreamInterface>() ??
        [];
    dreamType = ProfileAddEditDreamType.countries;
    _updateSearchedList();

    globalCareers = _profileNotifier.globalCareers?.toList() ?? [];
    if (globalCareers?.isEmpty ?? true) {
      await _profileNotifier.fetchGlobalCareer();
      globalCareers = _profileNotifier.globalCareers?.toList() ?? [];
    }
    selectedCareers = _profileNotifier.userProfile?.dreamCareers
            ?.toList()
            .cast<DreamInterface>() ??
        [];
    dreamType = ProfileAddEditDreamType.careers;
    _updateSearchedList();
    dreamType = widget.dreamType ?? ProfileAddEditDreamType.careers;
    setState(() {});
  }

  void _updateSearchedList() {
    var selectedList = getSelectedList();
    var searchList = getSearchList();
    var globalList = getGlobalList();
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
    setSelectedList(selectedList);
    setSearchList(searchList);
  }

  Widget selectItemTile(int index) {
    var selectedList = getSelectedList();
    var searchList = getSearchList();
    int i = (searchList?[index].name ?? '').length % 8;
    final color = dummyColor[i];
    return InkWell(
      onTap: () {
        if (selectedList!.length < 3) {
          selectedList.add(searchList![index]);
          searchList.removeAt(index);
          setSelectedList(selectedList);
          setSearchList(searchList);
          setState(() {});
        }
      },
      child: Row(
        children: [
          if (dreamType == ProfileAddEditDreamType.careers) ...{
            CachedNetworkImage(
              imageUrl: searchList?[index].iconUrl ?? '',
              color: color,
              errorWidget: (context, url, error) => const SizedBox(),
              width: 24.r,
              height: 24.r,
            ),
          } else ...{
            AppNetworkImageM(
              url: searchList?[index].iconUrl ?? '',
              width: 24.r,
              height: 24.r,
            ),
          },
          sizedBoxWithWidth(16),
          Flexible(
            child: Text(
              searchList?[index].name ?? '',
              style: AppTextStyles.text14w700.darkModeSupport,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> saveBtnSubmit() async {
    UserModel? userModel = _profileNotifier.userProfile;
    userModel = userModel?.copyWith(
      dreamColleges: selectedColleges?.cast<UserDreamCollege>(),
      dreamCollegesIds: {
        for (UserDreamCollege v
            in (selectedColleges?.cast<UserDreamCollege>()) ?? [])
          v.id.toString(): true
      },
    );
    userModel = userModel?.copyWith(
      dreamCountries: selectedCountries?.cast<UserDreamCountry>(),
      dreamCountriesIds: {
        for (UserDreamCountry v
            in (selectedCountries?.cast<UserDreamCountry>()) ?? [])
          v.id.toString(): true
      },
    );
    userModel = userModel?.copyWith(
      dreamCareers: selectedCareers?.cast<UserDreamCareer>(),
      dreamCareersIds: {
        for (UserDreamCareer v
            in (selectedCareers?.cast<UserDreamCareer>()) ?? [])
          v.id.toString(): true
      },
    );
    await _profileNotifier.saveProfile(userModel!).then((value) {
      Navigator.pop(context);
      context.pop();
    });
  }

  List<DreamInterface>? getSelectedList() {
    List<DreamInterface>? selectedList;
    switch (dreamType) {
      case ProfileAddEditDreamType.careers:
        selectedList = selectedCareers;
        break;
      case ProfileAddEditDreamType.countries:
        selectedList = selectedCountries;
        break;
      default:
        selectedList = selectedColleges;
    }
    return selectedList;
  }

  List<DreamInterface>? getSearchList() {
    List<DreamInterface>? searchList;
    switch (dreamType) {
      case ProfileAddEditDreamType.careers:
        searchList = searchCareers;
        break;
      case ProfileAddEditDreamType.countries:
        searchList = searchCountries;
        break;
      default:
        searchList = searchColleges;
    }
    return searchList;
  }

  void setSelectedList(List<DreamInterface>? selectedList) {
    switch (dreamType) {
      case ProfileAddEditDreamType.careers:
        selectedCareers = selectedList;
        break;
      case ProfileAddEditDreamType.countries:
        selectedCountries = selectedList;
        break;
      default:
        selectedColleges = selectedList;
    }
  }

  void setSearchList(List<DreamInterface>? searchList) {
    switch (dreamType) {
      case ProfileAddEditDreamType.careers:
        searchCareers = searchList;
        break;
      case ProfileAddEditDreamType.countries:
        searchCountries = searchList;
        break;
      default:
        searchColleges = searchList;
    }
  }

  List<DreamInterface>? getGlobalList() {
    List<DreamInterface>? globalList;
    switch (dreamType) {
      case ProfileAddEditDreamType.careers:
        globalList = globalCareers;
        break;
      case ProfileAddEditDreamType.countries:
        globalList = globalCountries;
        break;
      default:
        globalList = globalColleges;
    }
    return globalList;
  }

  @override
  Widget build(BuildContext context) {
    final selectedList = getSelectedList();
    final searchList = getSearchList();

    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: Consumer<ProfileNotifier>(
          builder: (context, noti, child) {
            return GestureDetector(
              onPanDown: (_) {
                _searchFocusNode.unfocus();
              },
              child: SingleChildScrollView(
                child: Container(
                  height: ScreenUtil.instance.screenHeight - 72.h,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      sizedBoxWithHeight(32),
                      ProfileAddEditAppBarMWidget(
                        isAdd: false,
                        title: 'Dream ${dreamType.name}',
                      ),
                      sizedBoxWithHeight(36),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                dreamType = ProfileAddEditDreamType.careers;
                                FocusScope.of(context).unfocus();
                                _searchController.clear();
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
                          sizedBoxWithWidth(8),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                dreamType = ProfileAddEditDreamType.countries;
                                FocusScope.of(context).unfocus();
                                _searchController.clear();
                                setState(() {});
                              },
                              child: SizedBox(
                                width: double.maxFinite,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: dreamType ==
                                                ProfileAddEditDreamType
                                                    .countries
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
                                                ProfileAddEditDreamType
                                                    .countries
                                            ? AppTextStyles.text16w800
                                            : AppTextStyles.text16w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          sizedBoxWithWidth(8),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                dreamType = ProfileAddEditDreamType.colleges;
                                FocusScope.of(context).unfocus();
                                _searchController.clear();
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
                        ],
                      ),
                      sizedBoxWithHeight(16),
                      AppMaterialInputField(
                        focusNode: _searchFocusNode,
                        label: 'Search dream ${dreamType.name.toString()}',
                        controller: _searchController,
                        isRequired: false,
                        maxLines: 1,
                        onChanged: (v) {
                          _updateSearchedList();
                          setState(() {});
                        },
                      ),
                      sizedBoxWithHeight(16),
                      if (selectedList?.isNotEmpty ?? false) ...{
                        SizedBox(
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...selectedList!.map(
                                (e) {
                                  int i = (e.name ?? '').length % 8;
                                  final color = dummyColor[i];
                                  return Chip(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 6.h,
                                      horizontal: 12.w,
                                    ),
                                    backgroundColor: ThemeHandler.mutedColor(
                                      nonInverse: false,
                                    ),
                                    avatar: dreamType ==
                                            ProfileAddEditDreamType.careers
                                        ? CachedNetworkImage(
                                            imageUrl: e.iconUrl ?? '',
                                            color: color,
                                            errorWidget:
                                                (context, url, error) =>
                                                    const SizedBox(),
                                            width: 24.r,
                                            height: 24.r,
                                          )
                                        : AppNetworkImageM(
                                            url: e.iconUrl ?? '',
                                            width: 24.r,
                                            height: 24.r,
                                          ),
                                    label: Text(
                                      e.name ?? '',
                                      style: AppTextStyles
                                          .text14w600.darkModeSupport,
                                    ),
                                    deleteIconColor: ThemeHandler.widgetColor(),
                                    deleteIcon: Icon(
                                      Icons.close,
                                      size: 12.r,
                                    ),
                                    onDeleted: () {
                                      selectedList.remove(e);
                                      setSelectedList(selectedList);
                                      setState(() {});
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
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
                          'You can select a maximum of 3 ${dreamType.name.toString()}',
                          style: AppTextStyles.text12w400.white,
                        ),
                      ),
                      sizedBoxWithHeight(16),
                      Expanded(
                        child: SizedBox(
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: GestureDetector(
                                  onPanDown: (_) {
                                    _searchFocusNode.unfocus();
                                  },
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
                                          bottom: index ==
                                                  (searchList?.length ?? 0) - 1
                                              ? 80.h
                                              : 0.0,
                                        ),
                                        child: selectItemTile(index),
                                      );
                                    },
                                  ),
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
                                        ThemeHandler.backgroundColor()
                                            .withOpacity(0),
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
                      ),
                      CustomButton(
                        text: AppStrings.saveChanges,
                        height: 48.h,
                        onPressed: () {
                          saveBtnSubmit();
                        },
                      ),
                      sizedBoxWithHeight(24),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
