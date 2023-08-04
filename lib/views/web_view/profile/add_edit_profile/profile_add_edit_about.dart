import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/app_alert_dialog.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/widgets/widgets.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:provider/provider.dart';

class ProfileAddEditAbout extends StatefulWidget {
  final bool isAdd;
  const ProfileAddEditAbout({Key? key, this.isAdd = true}) : super(key: key);

  @override
  State<ProfileAddEditAbout> createState() => _ProfileAddEditAboutState();
}

class _ProfileAddEditAboutState extends State<ProfileAddEditAbout> {
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
                  ? ScreenUtil.instance.width * 0.5
                  : ScreenUtil.instance.width * 0.8,
            ),
            padding: EdgeInsets.all(24.r),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ThemeHandler.backgroundColor(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Form(
              key: _aboutFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AddEditTopBarWidget(
                    title: AppStrings.about,
                    isAdd: widget.isAdd,
                    onDelete: () {
                      if (widget.isAdd.not) {
                        UserModel userModel = _profileNotifier!.userProfile!;
                        showAlertDialog(
                          context: context,
                          txtContent: AppStrings.deleteContent,
                          textBtn1: AppStrings.cancelBtnTxt,
                          txtBtn2: AppStrings.deleteBtnTxt,
                          onBtn1: () => Navigator.of(context).pop(),
                          onBtn2: () {
                            userModel = userModel.copyWith(about: null);
                            _profileNotifier
                                ?.saveProfile(userModel)
                                .then((value) {
                              Navigator.pop(context);
                            }).then((value) {
                              Navigator.pop(context);
                            });
                          },
                        );
                      }
                    },
                  ),
                  sizedBoxWithHeight(16),
                  const AddEditMessageBar(
                    message:
                        'Add your identity by adding your personalised bio!',
                  ),
                  sizedBoxWithHeight(16),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 350.h,
                    ),
                    child: AppMaterialInputField(
                      label: AppStrings.writeSomethingAboutYourself,
                      hint: 'Hi, I am a electronics enthusiast teenager',
                      controller: _aboutController,
                      maxLength: 6400,
                      maxLines: null,
                      isRequired: true,
                    ),
                  ),
                  sizedBoxWithHeight(16),
                  sizedBoxWithHeight(16),
                  CustomButton(
                    onPressed: () {
                      if (_aboutFormKey.currentState?.validate().not ?? true) {
                        return;
                      }
                      UserModel userModel = _profileNotifier!.userProfile!;
                      userModel =
                          userModel.copyWith(about: _aboutController.text);
                      _profileNotifier?.saveProfile(userModel).then((value) {
                        Navigator.pop(context);
                      });
                    },
                    text:
                        widget.isAdd ? AppStrings.add : AppStrings.saveChanges,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
