import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/nova/opportunities/nova_opportunities.dart';
import 'package:nova_social/data/models/user/user.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/snackbar_widget.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/widgets/widgets.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:provider/provider.dart';

class ProfileAddEditAvailability extends StatefulWidget {
  final bool isAdd;
  final bool isUserOnboarding;
  const ProfileAddEditAvailability({
    Key? key,
    this.isAdd = true,
    this.isUserOnboarding = false,
  }) : super(key: key);

  @override
  State<ProfileAddEditAvailability> createState() =>
      _ProfileAddEditAvailabilityState();
}

class _ProfileAddEditAvailabilityState
    extends State<ProfileAddEditAvailability> {
  ProfileNotifier? _profileNotifier;
  List<NovaOpportunities>? _novaOpportunities = [];
  List<NovaOpportunities>? _selectedOpportunities = [];

  void _updateSelectedList(NovaOpportunities userOpportunity) {
    final dummy = _selectedOpportunities!.firstWhere(
        (element) => element.name == userOpportunity.name,
        orElse: () => const NovaOpportunities());
    bool flag = false;
    if (dummy.name != null) {
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

  // Widget _buildOpportunityTile(NovaOpportunities novaOpportunity) {
  //   final dummy = _selectedOpportunities!.firstWhere(
  //       (element) => element.name == novaOpportunity.name,
  //       orElse: () => NovaOpportunities());
  //   bool flag = false;
  //   if (dummy.name != null) {
  //     flag = true;
  //   }
  //   // bool flag = _selectedOpportunities!.contains(novaOpportunity);
  //   return GestureDetector(
  //     onTap: () => _updateSelectedList(novaOpportunity),
  //     child: Container(
  //       padding: EdgeInsets.symmetric(
  //         vertical: 8.h,
  //         horizontal: 4.w,
  //       ),
  //       margin: EdgeInsets.symmetric(horizontal: 2.w),
  //       decoration: BoxDecoration(
  //         border: Border.all(
  //           color: flag ? AppColors.novaIndigo : ThemeHandler.mutedColor(),
  //           width: 1,
  //         ),
  //         borderRadius: BorderRadius.circular(2.r),
  //       ),
  //       child: Text(
  //         novaOpportunity.name!,
  //         style: flag
  //             ? AppTextStyles.text12w400.indigo
  //             : AppTextStyles.text12w400.muted,
  //       ),
  //     ),
  //   );
  // }

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
    if (dummy.name != null) {
      isSelected = true;
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
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
              child: InkWell(
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
          Checkbox(
            hoverColor: ThemeHandler.mutedPlusColor(nonInverse: false),
            // fillColor: ThemeHandler.mutedPlusColor(),
            // checkColor: ThemeHandler.mutedPlusColor(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            side: BorderSide(
              color: ThemeHandler.mutedColor(nonInverse: false),
              width: 1,
            ),
            value: isSelected,
            onChanged: (value) {
              isSelected = !isSelected;
              _updateSelectedList(novaOpportunity);
            },
          )
        ],
      ),
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
    _novaOpportunities = _profileNotifier?.globalOpportunities?.toList() ?? [];
    _selectedOpportunities =
        _profileNotifier?.userProfile?.userOpportunities?.toList() ?? [];
    setState(() {});
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
        backgroundColor: AppColors.novaIndigo.withOpacity(0.5),
        child: FittedBox(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: kIsLargeScreen
                  ? ScreenUtil.instance.width * 0.3
                  : ScreenUtil.instance.width * 0.8,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ThemeHandler.backgroundColor(),
              boxShadow: const [
                BoxShadow(),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(16.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AddEditTopBarWidget(
                  title: 'Availability',
                  isAdd: widget.isAdd,
                  isUserOnboarding: widget.isUserOnboarding,
                ),
                sizedBoxWithHeight(16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select Collaboration Preferences',
                    style: AppTextStyles.text14w600,
                  ),
                ),
                sizedBoxWithHeight(16),
                SizedBox(
                  height: 380.h,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ListView.separated(
                          separatorBuilder: (ctx, _) => sizedBoxWithHeight(16),
                          padding: EdgeInsets.symmetric(
                            vertical: 16.h,
                          ),
                          itemCount: _novaOpportunities!.length,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom: index ==
                                          (_novaOpportunities?.length ?? 0) - 1
                                      ? 80.h
                                      : 0.0),
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
                sizedBoxWithHeight(16),
                CustomButton(
                  color: (_selectedOpportunities?.isEmpty ?? false)
                      ? ThemeHandler.mutedColor(nonInverse: false)
                      : AppColors.novaIndigo,
                  text: widget.isAdd
                      ? (widget.isUserOnboarding
                          ? AppStrings.continueWord
                          : AppStrings.add)
                      : AppStrings.saveChanges,
                  onPressed: () {
                    if (_selectedOpportunities!.isNotEmpty) {
                      UserModel? userModel = _profileNotifier?.userProfile;
                      userModel = userModel?.copyWith(
                        userOpportunities: _selectedOpportunities,
                      );
                      _profileNotifier?.saveProfile(userModel!).then((value) {
                        if (widget.isUserOnboarding.not) {
                          Navigator.pop(context);
                        }
                      });
                    } else {
                      SnackbarWidget(
                        context: context,
                        text: 'Please select atleast one.',
                      ).showSnackbar();
                    }
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
