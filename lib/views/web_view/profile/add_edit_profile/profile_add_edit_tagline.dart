import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/widgets/widgets.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:provider/provider.dart';

class ProfileAddEditTagline extends StatefulWidget {
  final bool isAdd;
  const ProfileAddEditTagline({Key? key, this.isAdd = true}) : super(key: key);

  @override
  State<ProfileAddEditTagline> createState() => _ProfileAddEditTaglineState();
}

class _ProfileAddEditTaglineState extends State<ProfileAddEditTagline> {
  final TextEditingController _taglineController = TextEditingController();

  ProfileNotifier? _profileNotifier;

  final _taglineFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    _taglineController.text = _profileNotifier?.userProfile?.tagline ?? '';
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
              maxWidth: kIsLargeScreen ? 320.w : 280.w,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ThemeHandler.backgroundColor(),
              boxShadow: [
                BoxShadow(),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Form(
              key: _taglineFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AddEditTopBarWidget(
                    title: AppStrings.tagline,
                    isAdd: widget.isAdd,
                  ),
                  sizedBoxWithHeight(16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AddEditTextFieldWidget(
                      columnHead: AppStrings.tagline,
                      textFieldHintText: 'Describe yourself in one line',
                      textEditingController: _taglineController,
                      maxLines: 1,
                      isRequiredField: false,
                      hasBorder: false,
                    ),
                  ),
                  sizedBoxWithHeight(24),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: CustomButton(
                      onPressed: () {
                        if (_taglineFormKey.currentState?.validate().not ??
                            true) {
                          return;
                        }
                        UserModel userModel = _profileNotifier!.userProfile!;
                        userModel = userModel.copyWith(
                          tagline: _taglineController.text,
                        );
                        _profileNotifier?.saveProfile(userModel).then((value) {
                          Navigator.pop(context);
                        });
                      },
                      text: widget.isAdd
                          ? AppStrings.add
                          : AppStrings.saveChanges,
                    ),
                  ),
                  sizedBoxWithHeight(24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
