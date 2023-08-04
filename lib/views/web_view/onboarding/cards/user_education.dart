import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/onboarding/widgets/onboarding_top_bar.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/widgets/widgets.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:provider/provider.dart';

class UserEducationCard extends StatefulWidget {
  const UserEducationCard({
    Key? key,
  }) : super(key: key);

  @override
  State<UserEducationCard> createState() => _UserEducationCardState();
}

class _UserEducationCardState extends State<UserEducationCard> {
  final TextEditingController _schoolNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  bool iCurrStudyHere = false;

  DateTime? startDate;
  DateTime? endDate;

  ProfileNotifier? _profileNotifier;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
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
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OnboardingTopBar(
                    head: 'Where do you study?',
                    subHead: AppStrings.educationSubtitle,
                  ),
                  sizedBoxWithHeight(16),
                  AddEditTextFieldWidget(
                    columnHead: 'School',
                    textFieldHintText: 'Neerja Modi',
                    textEditingController: _schoolNameController,
                    maxLines: 1,
                    isRequiredField: true,
                    hasBorder: false,
                  ),
                  sizedBoxWithHeight(16),
                  AddEditTextFieldWidget(
                    columnHead: 'Class',
                    textFieldHintText: '12th',
                    textEditingController: _gradeController,
                    maxLines: 1,
                    isRequiredField: true,
                    hasBorder: false,
                  ),
                  sizedBoxWithHeight(16),
                  AddEditTextFieldWidget(
                    columnHead: 'Location',
                    textFieldHintText: 'Mansarovar, Jaipur',
                    textEditingController: _locationController,
                    maxLines: 1,
                    isRequiredField: true,
                    hasBorder: false,
                  ),
                  sizedBoxWithHeight(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AddEditDateFieldWidget(
                          columnHead: 'Start Date',
                          textFieldHintText: 'July 2022',
                          textEditingController: _startDateController,
                          isRequiredField: true,
                          firstDate: DateTime(1922),
                          lastDate: DateTime.now(),
                          callback: (d) {
                            startDate = d;
                          },
                        ),
                      ),
                      sizedBoxWithWidth(16),
                      Expanded(
                        child: AddEditDateFieldWidget(
                          columnHead: 'End Date',
                          textFieldHintText: 'Aug 2022',
                          textEditingController: _endDateController,
                          isRequiredField: true,
                          firstDate: DateTime(1922),
                          lastDate: DateTime(2040),
                          callback: (d) {
                            endDate = d;
                          },
                        ),
                      ),
                    ],
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                  //   child: Row(
                  //     children: [
                  //       Checkbox(
                  //         activeColor: AppColors.novaIndigo,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(4),
                  //         ),
                  //         side: BorderSide(
                  //           color: AppColors.novaDarkMuted,
                  //           width: 1,
                  //         ),
                  //         value: iCurrStudyHere,
                  //         onChanged: (value) {
                  //           iCurrStudyHere = !iCurrStudyHere;
                  //           setState(() {});
                  //         },
                  //       ),
                  //       sizedBoxWithWidth(8),
                  //       Text(
                  //         'I currently study here',
                  //         style: AppTextStyles.text12w400,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  sizedBoxWithHeight(24),
                  CustomButton(
                    onPressed: () {
                      if (formKey.currentState?.validate().not ?? false) {
                        return;
                      }
                      UserModel userModel = _profileNotifier!.userProfile!;
                      Education education = Education(
                        school: _schoolNameController.text,
                        degree: _gradeController.text,
                        startDate: startDate,
                        endDate: endDate,
                        currentlyStudyHere: iCurrStudyHere,
                        location: _locationController.text,
                      );
                      List<Education>? educations = userModel.educations ?? [];
                      educations.add(education);
                      userModel = userModel.copyWith(educations: educations);
                      print('Education Button');
                      if (_profileNotifier!.invitedByUserProfile != null) {
                        print('Education setting waitlist false');
                        _profileNotifier!.callFromFinalOnboarding = true;
                        bool userInTheWaitlist = false;
                        userModel = userModel.copyWith(
                            inTheWaitlist: userInTheWaitlist);
                      }
                      _profileNotifier?.saveProfile(userModel);
                    },
                    text: 'Continue',
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
