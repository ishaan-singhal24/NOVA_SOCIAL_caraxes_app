import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/widgets/profile_add_edit_app_bar_mwidget.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

class ProfileAddEditAboutMView extends StatefulWidget {
  final bool isAdd;
  const ProfileAddEditAboutMView({
    super.key,
    required this.isAdd,
  });

  @override
  State<ProfileAddEditAboutMView> createState() =>
      _ProfileAddEditAboutMViewState();
}

class _ProfileAddEditAboutMViewState extends State<ProfileAddEditAboutMView> {
  final TextEditingController _aboutController = TextEditingController();

  ProfileNotifier? _profileNotifier;

  final _aboutFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    _aboutController.text = _profileNotifier?.userProfile?.about ?? '';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sizedBoxWithHeight(36),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ProfileAddEditAppBarMWidget(
                  isAdd: widget.isAdd,
                  title: AppStrings.about,
                ),
              ),
              sizedBoxWithHeight(36),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Form(
                  key: _aboutFormKey,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: ScreenUtil.instance.screenHeight *
                          0.6, // set the fixed max height here
                      maxWidth: double.maxFinite,
                    ),
                    child: AppMaterialInputField(
                      minLines: 7,
                      controller: _aboutController,
                      label: AppStrings.about,
                      hint:
                          'You can write about yourself, your likes, dislikes, skills, achievements etc.',
                      maxLength: 2000,
                      maxLines: null,
                      isRequired: false,
                    ),
                  ),
                ),
              ),
              sizedBoxWithHeight(24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomButton(
                  height: 48.h,
                  width: ScreenUtil.instance.screenWidth - 48.w,
                  onPressed: () {
                    appLoadingMPopup(context);
                    if (_aboutFormKey.currentState?.validate().not ?? true) {
                      return;
                    }
                    UserModel userModel = _profileNotifier!.userProfile!;
                    userModel =
                        userModel.copyWith(about: _aboutController.text);
                    _profileNotifier?.saveProfile(userModel).then((value) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    });
                  },
                  text: widget.isAdd ? AppStrings.add : AppStrings.saveChanges,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
