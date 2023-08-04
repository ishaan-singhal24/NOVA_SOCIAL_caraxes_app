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

class ProfileAddEditInterestMView extends StatefulWidget {
  const ProfileAddEditInterestMView({
    super.key,
  });

  @override
  State<ProfileAddEditInterestMView> createState() =>
      _ProfileAddEditInterestMViewState();
}

class _ProfileAddEditInterestMViewState
    extends State<ProfileAddEditInterestMView> {
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
          vertical: 8,
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
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  void _updateSearchedList() {
    _searchedInterests =
        _profileNotifier?.globalInterests?.toList().where((interest) {
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
    _searchedInterests = _profileNotifier?.globalInterests?.toList();
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
                  title: AppStrings.interest,
                ),
                sizedBoxWithHeight(36),
                AppMaterialInputField(
                  controller: _searchTagController,
                  hint: 'Founder',
                  label: AppStrings.searchYourInterests,
                  isRequired: false,
                  maxLines: 1,
                  textInputAction: TextInputAction.go,
                  onChanged: (value) {
                    _updateSearchedList();
                  },
                ),
                sizedBoxWithHeight(24),
                SizedBox(
                  height: ScreenUtil.instance.screenHeight * 0.55,
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
                sizedBoxWithHeight(40),
                CustomButton(
                  text: AppStrings.saveChanges,
                  height: 48.h,
                  onPressed: () {
                    if (_selectedInterests!.isNotEmpty) {
                      appLoadingMPopup(context);
                      UserModel? userModel = _profileNotifier?.userProfile;
                      userModel = userModel?.copyWith(
                          userInterests: _selectedInterests);
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
