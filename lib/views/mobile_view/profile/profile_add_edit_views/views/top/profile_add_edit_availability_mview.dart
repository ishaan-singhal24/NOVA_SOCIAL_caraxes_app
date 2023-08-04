import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/widgets/profile_add_edit_app_bar_mwidget.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/web_view/common/snackbar_widget.dart';
import 'package:provider/provider.dart';

class ProfileAddEditAvailabilityMView extends StatefulWidget {
  const ProfileAddEditAvailabilityMView({
    super.key,
  });

  @override
  State<ProfileAddEditAvailabilityMView> createState() =>
      _ProfileAddEditAvailabilityMViewState();
}

class _ProfileAddEditAvailabilityMViewState
    extends State<ProfileAddEditAvailabilityMView> {
  ProfileNotifier? _profileNotifier;
  List<NovaOpportunities>? _novaOpportunities = [];
  List<NovaOpportunities>? _selectedOpportunities = [];

  void _updateSelectedList(NovaOpportunities userOpportunity) {
    final dummy = _selectedOpportunities!.firstWhere(
        (element) => element.name == userOpportunity.name,
        orElse: () => const NovaOpportunities());
    bool flag = false;
    if (dummy.name?.isNotEmpty ?? false) {
      flag = true;
    }
    if (_selectedOpportunities!.isNotEmpty) {
      if (flag) {
        _selectedOpportunities!
            .removeWhere((element) => element.name == userOpportunity.name);
      } else {
        _selectedOpportunities!.add(userOpportunity);
      }
    } else {
      _selectedOpportunities?.add(userOpportunity);
    }
    setState(() {});
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
  Widget _buildOpportunityListTile({
    required NovaOpportunities novaOpportunity,
  }) {
    int index = (novaOpportunity.name!.length) % 8;
    Color color = dummyColor[index];
    final dummy = _selectedOpportunities!.firstWhere(
        (element) => element.name == novaOpportunity.name,
        orElse: () => const NovaOpportunities());
    bool isSelected = false;
    if (dummy.name?.isNotEmpty ?? false) {
      isSelected = true;
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: color,
              width: 1,
            ),
            color: color,
          ),
          child: Image.network(
            novaOpportunity.iconUrl!,
            height: 24,
            width: 24,
            fit: BoxFit.fill,
            color: AppColors.novaWhite,
          ),
        ),
        sizedBoxWithWidth(4),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 16.0),
            child: GestureDetector(
              onTap: () {
                isSelected = !isSelected;
                _updateSelectedList(novaOpportunity);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    novaOpportunity.name!,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.text14w600.darkModeSupport,
                  ),
                  Text(
                    novaOpportunity.description!,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.text14w400.darkModeSupport,
                  ),
                ],
              ),
            ),
          ),
        ),
        AppCheckBox(
          height: 24.h,
          width: 24.w,
          iconSize: 18.r,
          radius: 12.r,
          borderWidth: 2.r,
          isSelected: isSelected,
          borderColor: AppColors.novaDarkIndigo,
          selectedStateColor: AppColors.novaDarkIndigo,
          onTap: () {
            isSelected = !isSelected;
            _updateSelectedList(novaOpportunity);
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    loadOpportunities();
  }

  Future loadOpportunities() async {
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    await _profileNotifier?.fetchGlobalOpportunities();
    _novaOpportunities = _profileNotifier?.globalOpportunities?.toList();
    _selectedOpportunities =
        _profileNotifier?.userProfile?.userOpportunities?.toList() ?? [];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizedBoxWithHeight(32),
                ProfileAddEditAppBarMWidget(
                  isAdd: false,
                  title: AppStrings.availability,
                ),
                sizedBoxWithHeight(36),
                SizedBox(
                  height: ScreenUtil.instance.screenHeight * 0.6,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ListView.separated(
                          separatorBuilder: (ctx, _) => sizedBoxWithHeight(16),
                          padding: EdgeInsets.symmetric(
                            vertical: 16.h,
                            horizontal: 4.w,
                          ),
                          itemCount: _novaOpportunities!.length,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: index ==
                                        (_novaOpportunities?.length ?? 0) - 1
                                    ? 80.h
                                    : 0.0,
                              ),
                              child: _buildOpportunityListTile(
                                novaOpportunity: _novaOpportunities![index],
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          width: double.maxFinite,
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
                sizedBoxWithHeight(40),
                CustomButton(
                  text: AppStrings.saveChanges,
                  height: 48.h,
                  onPressed: () {
                    if (_selectedOpportunities!.isNotEmpty) {
                      appLoadingMPopup(context);
                      UserModel? userModel = _profileNotifier?.userProfile;
                      userModel = userModel?.copyWith(
                        userOpportunities: _selectedOpportunities,
                      );
                      _profileNotifier?.saveProfile(userModel!).then((value) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                    } else {
                      SnackbarWidget(
                        context: context,
                        text: 'Please select atleast one.',
                      ).showSnackbar();
                    }
                    // widget.onTap(3);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
