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

class ProfileAddEditEducation extends StatefulWidget {
  final bool isAdd;
  final int? editingIndex;
  final bool isUserOnboarding;
  const ProfileAddEditEducation({
    Key? key,
    this.isAdd = true,
    this.editingIndex,
    this.isUserOnboarding = false,
  }) : super(key: key);

  @override
  State<ProfileAddEditEducation> createState() =>
      _ProfileAddEditEducationState();
}

class _ProfileAddEditEducationState extends State<ProfileAddEditEducation> {
  final TextEditingController _schoolNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  final _educationFormKey = GlobalKey<FormState>();

  bool iCurrStudyHere = true;

  DateTime? startDate;
  DateTime? endDate;

  ProfileNotifier? _profileNotifier;

  void initialDataPop() {
    final educations = _profileNotifier?.userProfile?.educations?.toList();
    _schoolNameController.text =
        widget.isAdd ? '' : educations?[widget.editingIndex!].school ?? '';
    _locationController.text =
        widget.isAdd ? '' : educations?[widget.editingIndex!].location ?? '';
    _gradeController.text =
        widget.isAdd ? '' : educations?[widget.editingIndex!].degree ?? '';
    _descriptionController.text =
        widget.isAdd ? '' : educations?[widget.editingIndex!].description ?? '';
    _startDateController.text = widget.isAdd
        ? ''
        : educations?[widget.editingIndex!].startDate?.abrMMMyyyy ?? '';
    _endDateController.text = widget.isAdd
        ? ''
        : educations?[widget.editingIndex!].endDate?.abrMMMyyyy ?? '';
    startDate =
        widget.isAdd ? null : educations?[widget.editingIndex!].startDate;
    endDate = widget.isAdd ? null : educations?[widget.editingIndex!].endDate;
    iCurrStudyHere =
        (endDate?.compareTo(DateTime.now()) ?? 1) > 0 ? true : false;
  }

  @override
  void initState() {
    super.initState();
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    initialDataPop();
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
              key: _educationFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AddEditTopBarWidget(
                    title: 'Education',
                    isAdd: widget.isAdd,
                    isUserOnboarding: widget.isUserOnboarding,
                    onDelete: () {
                      if (widget.isAdd.not) {
                        UserModel userModel = _profileNotifier!.userProfile!;
                        List<Education>? educations =
                            userModel.educations?.toList();
                        showAlertDialog(
                          context: context,
                          txtContent: AppStrings.deleteContent,
                          textBtn1: AppStrings.cancelBtnTxt,
                          txtBtn2: AppStrings.deleteBtnTxt,
                          onBtn1: () => Navigator.of(context).pop(),
                          onBtn2: () {
                            if (widget.editingIndex != null) {
                              educations?.removeAt(widget.editingIndex!);
                            }
                            userModel = userModel.copyWith(
                              educations: educations,
                            );
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
                    message: 'You can show your educational experiences here!',
                  ),
                  sizedBoxWithHeight(16),
                  AppMaterialInputField(
                    label: AppStrings.schoolCollegeName,
                    hint: 'Neerja Modi',
                    controller: _schoolNameController,
                    maxLines: 1,
                    isRequired: true,
                  ),
                  sizedBoxWithHeight(16),
                  Row(
                    children: [
                      Expanded(
                        child: AppMaterialInputField(
                          label: AppStrings.degreeClass,
                          hint: '12th',
                          controller: _gradeController,
                          maxLines: 1,
                          isRequired: true,
                        ),
                      ),
                      sizedBoxWithWidth(80),
                      Expanded(
                        child: AppMaterialInputField(
                          label: AppStrings.location,
                          hint: 'Mansarovar, Jaipur',
                          controller: _locationController,
                          maxLines: 1,
                          isRequired: false,
                        ),
                      ),
                    ],
                  ),
                  sizedBoxWithHeight(16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            AppMaterialInputField(
                              label: AppStrings.startDate,
                              hint: AppStrings.select,
                              controller: _startDateController,
                              isRequired: true,
                              suffixIcon: Icon(
                                Icons.calendar_month,
                                color: ThemeHandler.novaMutedColor(),
                              ),
                              firstLastDate: [DateTime(1922), DateTime.now()],
                              dateTimeCallBack: (d) {
                                startDate = d;
                              },
                            ),
                            sizedBoxWithHeight(8),
                            Row(
                              children: [
                                Checkbox(
                                  activeColor: AppColors.novaIndigo,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  side: BorderSide(
                                    color: AppColors.novaDarkMuted,
                                    width: 1,
                                  ),
                                  value: iCurrStudyHere,
                                  onChanged: (value) {
                                    endDate = null;
                                    _endDateController.clear();
                                    iCurrStudyHere = endDate == null
                                        ? true
                                        : !iCurrStudyHere;
                                    setState(() {});
                                  },
                                ),
                                sizedBoxWithWidth(8),
                                Text(
                                  'I currently study here',
                                  style: AppTextStyles.text12w400,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      sizedBoxWithWidth(80),
                      Expanded(
                        child: AppMaterialInputField(
                          label: AppStrings.endDate,
                          hint: AppStrings.select,
                          controller: _endDateController,
                          isRequired: false,
                          suffixIcon: Icon(
                            Icons.calendar_month,
                            color: ThemeHandler.novaMutedColor(),
                          ),
                          firstLastDate: [DateTime(1922), DateTime(2040)],
                          dateTimeCallBack: (d) {
                            endDate = d;
                            iCurrStudyHere =
                                (endDate?.compareTo(DateTime.now()) ?? 1) > 0
                                    ? true
                                    : false;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                  sizedBoxWithHeight(16),
                  AppMaterialInputField(
                    label: AppStrings.description,
                    hint: 'You can share your experience here..',
                    controller: _descriptionController,
                    maxLength: 2400,
                    maxLines: null,
                    isRequired: false,
                    inputStyle: AppTextStyles.text14w400,
                  ),
                  sizedBoxWithHeight(16),
                  CustomButton(
                    onPressed: () {
                      if (_educationFormKey.currentState?.validate().not ??
                          true) {
                        return;
                      }
                      UserModel userModel = _profileNotifier!.userProfile!;
                      if (widget.isAdd) {}
                      Education education = Education(
                        school: _schoolNameController.text,
                        degree: _gradeController.text,
                        description: _descriptionController.text,
                        startDate: startDate,
                        endDate: endDate,
                        currentlyStudyHere: iCurrStudyHere,
                        location: _locationController.text,
                      );
                      List<Education>? educations =
                          userModel.educations?.toList();
                      if (widget.isAdd) {
                        educations ??= [];
                        educations.add(education);
                      } else {
                        educations?[widget.editingIndex!] = education;
                      }
                      userModel = userModel.copyWith(educations: educations);
                      if (widget.isUserOnboarding &&
                          _profileNotifier!.invitedByUserProfile != null) {
                        print('Education setting waitlist false');
                        _profileNotifier!.callFromFinalOnboarding = true;
                        bool userInTheWaitlist = false;
                        userModel = userModel.copyWith(
                            inTheWaitlist: userInTheWaitlist);
                      } else if (widget.isUserOnboarding &&
                          userModel.invitedBy != null) {
                        bool userInTheWaitlist = false;
                        userModel = userModel.copyWith(
                            inTheWaitlist: userInTheWaitlist);
                      }
                      _profileNotifier?.saveProfile(userModel).then((value) {
                        if (widget.isUserOnboarding.not) {
                          Navigator.pop(context);
                        }
                      });
                    },
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
      ),
    );
  }
}
