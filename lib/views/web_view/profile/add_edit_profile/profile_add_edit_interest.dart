import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/widgets/widgets.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/common/snackbar_widget.dart';
import 'package:provider/provider.dart';

class ProfileAddEditInterest extends StatefulWidget {
  final bool isAdd;
  final bool isUserOnboarding;
  const ProfileAddEditInterest({
    Key? key,
    this.isAdd = true,
    this.isUserOnboarding = false,
  }) : super(key: key);

  @override
  State<ProfileAddEditInterest> createState() => _ProfileAddEditInterestState();
}

class _ProfileAddEditInterestState extends State<ProfileAddEditInterest> {
  final TextEditingController _searchTagController = TextEditingController();

  List<NovaInterests>? _searchedInterests = [];
  List<NovaInterests>? _selectedInterests = [];

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
  Widget _buildInterestGridTile({
    required NovaInterests novaInterests,
  }) {
    int index = (novaInterests.name!.length) % 8;
    Color color = dummyColor[index];
    final dummy = _selectedInterests!.firstWhere(
        (element) => element.name == novaInterests.name,
        orElse: () => NovaInterests());
    bool flag = false;
    if (dummy.name != null) {
      flag = true;
    }
    return GestureDetector(
      onTap: () => _updateSelectedList(novaInterests),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: color,
            width: 1,
          ),
          color: flag ? color : AppColors.novaDarkMutedPlus,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              novaInterests.iconUrl!,
              color: flag ? ThemeHandler.backgroundColor() : color,
              height: 32,
              width: 32,
              fit: BoxFit.fill,
            ),
            sizedBoxWithHeight(8),
            Text(
              novaInterests.name!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: flag ? ThemeHandler.backgroundColor() : color,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateSearchedList() {
    _searchedInterests = _profileNotifier?.globalInterests?.where((interest) {
      return interest.name!
          .toLowerCase()
          .contains(_searchTagController.text.toLowerCase());
    }).toList();
    setState(() {});
  }

  void _updateSelectedList(NovaInterests userInterest) {
    final dummy = _selectedInterests!.firstWhere(
        (element) => element.name == userInterest.name,
        orElse: () => NovaInterests());
    bool flag = false;
    if (dummy.name != null) {
      flag = true;
    }
    if (_selectedInterests!.isNotEmpty) {
      if (flag) {
        _selectedInterests!
            .removeWhere((element) => element.name == userInterest.name);
      } else {
        _selectedInterests!.add(userInterest);
      }
    } else {
      _selectedInterests?.add(userInterest);
    }
    setState(() {});
  }

  late ProfileNotifier? _profileNotifier;

  @override
  void initState() {
    super.initState();
    loadInterests();
  }

  Future loadInterests() async {
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    await _profileNotifier?.fetchGlobalInterests();
    _searchedInterests = _profileNotifier?.globalInterests?.toList() ?? [];
    _selectedInterests =
        _profileNotifier?.userProfile?.userInterests?.toList() ?? [];
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _searchTagController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool kIsLargeScreen = !ResponsiveWidget.isSmallScreen();

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Dialog(
        backgroundColor: AppColors.novaIndigo.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
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
            padding: EdgeInsets.all(
              16.r,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AddEditTopBarWidget(
                  title: '${AppStrings.interest}s',
                  isAdd: widget.isAdd,
                  isUserOnboarding: widget.isUserOnboarding,
                ),
                sizedBoxWithHeight(16),
                AppMaterialInputField(
                  label: 'Search your ${AppStrings.interest}s',
                  controller: _searchTagController,
                  isRequired: false,
                  onChanged: (s) {
                    _updateSearchedList();
                  },
                ),
                sizedBoxWithHeight(16),
                Container(
                  height: 360.h,
                  color: ThemeHandler.backgroundColor(),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                            vertical: 16.h,
                            horizontal: 4.w,
                          ),
                          itemCount: _searchedInterests?.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 1,
                          ),
                          itemBuilder: (ctx, index) {
                            if (_searchedInterests?.isEmpty ?? false) {
                              return const SizedBox();
                            }
                            return _buildInterestGridTile(
                              novaInterests: _searchedInterests![index],
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
                sizedBoxWithHeight(24),
                CustomButton(
                  onPressed: () {
                    if (_selectedInterests!.isNotEmpty) {
                      UserModel? userModel = _profileNotifier?.userProfile;
                      userModel = userModel?.copyWith(
                          userInterests: _selectedInterests);
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
                  color: (_selectedInterests?.isEmpty ?? false)
                      ? ThemeHandler.mutedColor(nonInverse: false)
                      : AppColors.novaIndigo,
                  text: widget.isAdd
                      ? (widget.isUserOnboarding
                          ? AppStrings.continueWord
                          : AppStrings.add)
                      : AppStrings.saveChanges,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
