import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_strings.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/data/models/nova/opportunities/nova_opportunities.dart';
import 'package:nova_social/data/models/user/user.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/onboarding/widgets/onboarding_top_bar.dart';
import 'package:provider/provider.dart';

class UserOpportunitiesCard extends StatefulWidget {
  const UserOpportunitiesCard({Key? key}) : super(key: key);

  @override
  State<UserOpportunitiesCard> createState() => _UserOpportunitiesCardState();
}

class _UserOpportunitiesCardState extends State<UserOpportunitiesCard> {
  late final ProfileNotifier _profileNotifier;
  List<NovaOpportunities>? _novaOpportunities = [];
  List<NovaOpportunities>? _selectedOpportunities = [];

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
    required NovaOpportunities novaOpportunities,
  }) {
    int index = (novaOpportunities.name!.length) % 8;
    Color color = dummyColor[index];
    bool isSelected = _selectedOpportunities!.contains(novaOpportunities);
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
            novaOpportunities.iconUrl!,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  novaOpportunities.name!,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.text14w600.darkModeSupport,
                ),
                Text(
                  novaOpportunities.description!,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.text14w400.darkModeSupport,
                ),
              ],
            ),
          ),
        ),
        Checkbox(
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
              _updateSelectedList(novaOpportunities);
            })
      ],
    );
  }

  void _updateSelectedList(NovaOpportunities userOpportunity) {
    if (_selectedOpportunities != null) {
      if (_selectedOpportunities!.contains(userOpportunity)) {
        _selectedOpportunities!.remove(userOpportunity);
      } else {
        _selectedOpportunities!.add(userOpportunity);
      }
    } else {
      _selectedOpportunities?.add(userOpportunity);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadOpportunities();
  }

  Future loadOpportunities() async {
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    await _profileNotifier.fetchGlobalOpportunities();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _novaOpportunities = _profileNotifier.globalOpportunities;
      _selectedOpportunities =
          _profileNotifier.userProfile?.userOpportunities?.toList() ?? [];
      setState(() {});
    });
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
              children: <Widget>[
                OnboardingTopBar(
                  head: AppStrings.userOpportunitiesHead,
                  subHead: AppStrings.oppotunitySubtitle,
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
                                novaOpportunities: _novaOpportunities![index],
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
                  color: _selectedOpportunities!.isEmpty
                      ? ThemeHandler.mutedColor(nonInverse: false)
                      : AppColors.novaIndigo,
                  text: 'Continue',
                  onPressed: () {
                    if (_selectedOpportunities!.isNotEmpty) {
                      UserModel? userModel = _profileNotifier.userProfile;
                      userModel = userModel?.copyWith(
                        userOpportunities: _selectedOpportunities,
                      );
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
