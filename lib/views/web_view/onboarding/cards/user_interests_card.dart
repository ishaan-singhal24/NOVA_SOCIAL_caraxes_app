import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_strings.dart';
import 'package:nova_social/data/models/nova/interests/nova_interests.dart';
import 'package:nova_social/data/models/user/user.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/onboarding/widgets/onboarding_text_field.dart';
import 'package:nova_social/views/web_view/onboarding/widgets/onboarding_top_bar.dart';
import 'package:provider/provider.dart';

class UserInterestsCard extends StatefulWidget {
  const UserInterestsCard({Key? key}) : super(key: key);

  @override
  State<UserInterestsCard> createState() => _UserInterestsCardState();
}

class _UserInterestsCardState extends State<UserInterestsCard> {
  late final ProfileNotifier _profileNotifier;
  final controller = TextEditingController();
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
    bool flag = false;
    if (_selectedInterests!.contains(novaInterests)) {
      flag = true;
    }
    return GestureDetector(
      onTap: () => _updateSelectedList(novaInterests),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          // vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color,
            width: 1,
          ),
          color: flag ? color : ThemeHandler.mutedPlusColor(nonInverse: false),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              novaInterests.iconUrl!,
              color: flag ? AppColors.novaWhite : color,
              height: 32,
              width: 32,
              fit: BoxFit.fill,
            ),
            sizedBoxWithHeight(8),
            Text(
              novaInterests.name!,
              textAlign: TextAlign.center,
              maxLines: 2,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: flag ? AppColors.novaWhite : color,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateSearchedList() {
    _searchedInterests = _profileNotifier.globalInterests?.where((interest) {
      return interest.name!
          .toLowerCase()
          .contains(controller.text.toLowerCase());
    }).toList();
    setState(() {});
  }

  void _updateSelectedList(NovaInterests novaInterest) {
    if (_selectedInterests != null) {
      if (_selectedInterests!.contains(novaInterest)) {
        _selectedInterests!.remove(novaInterest);
      } else {
        _selectedInterests!.add(novaInterest);
      }
    } else {
      _selectedInterests?.add(novaInterest);
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    loadInterests();
  }

  Future loadInterests() async {
    await _profileNotifier.fetchGlobalInterests();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _searchedInterests = _profileNotifier.globalInterests;
      _selectedInterests =
          _profileNotifier.userProfile?.userInterests?.toList() ?? [];
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool kIsLargeScreen = !ResponsiveWidget.isSmallScreen();
    final deviceSize = MediaQuery.of(context).size;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Center(
        child: FittedBox(
          child: Container(
            constraints: BoxConstraints(
              maxWidth:
                  kIsLargeScreen ? deviceSize.width * 0.3 : double.maxFinite,
            ),
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 16.h,
            ),
            decoration: BoxDecoration(
              color: ThemeHandler.backgroundColor(),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 32.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OnboardingTopBar(
                  head: AppStrings.userInterestsHead,
                  subHead: AppStrings.interestsSubtitle,
                ),
                sizedBoxWithHeight(16),
                OnboardingTextField(
                  textEditingController: controller,
                  hintText: 'Search your interests',
                  icon: Icon(
                    Iconsax.search_normal,
                    color: AppColors.novaDarkMuted,
                    size: 16.sp,
                  ),
                  onChanged: (value) {
                    _updateSearchedList();
                  },
                ),
                sizedBoxWithHeight(16),
                SizedBox(
                  height: 380.h,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        bottom: 40.h,
                        child: GridView.builder(
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
                sizedBoxWithHeight(16),
                CustomButton(
                  color: _selectedInterests!.isEmpty
                      ? ThemeHandler.mutedColor(nonInverse: false)
                      : AppColors.novaIndigo,
                  text: 'Continue',
                  onPressed: () {
                    if (_selectedInterests!.isNotEmpty) {
                      UserModel? userModel = _profileNotifier.userProfile;
                      userModel = userModel?.copyWith(
                          userInterests: _selectedInterests);
                      print(
                          "_addIdsToProfile deep coll 0 ${userModel?.userInterests?.map((e) => e.name)} ${_profileNotifier.userProfile?.userInterests?.map((e) => e.name)}");
                      _profileNotifier.saveProfile(userModel!);
                    } else {
                      // SnackbarWidget(
                      //         context: context, text: 'Please select atleast one.')
                      //     .showSnackbar();
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
