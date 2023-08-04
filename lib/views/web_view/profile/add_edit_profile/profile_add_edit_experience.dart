import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/app_alert_dialog.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/widgets/widgets.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:provider/provider.dart';

class ProfileAddEditExperience extends StatefulWidget {
  final bool isAdd;
  final int? editingIndex;
  const ProfileAddEditExperience({
    Key? key,
    this.isAdd = true,
    this.editingIndex,
  }) : super(key: key);

  @override
  State<ProfileAddEditExperience> createState() =>
      _ProfileAddEditExperienceState();
}

class _ProfileAddEditExperienceState extends State<ProfileAddEditExperience> {
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _companyWebsiteController =
      TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;

  bool iCurrWorkHere = true;

  ProfileNotifier? _profileNotifier;

  ExperienceSubtag? _subTag = ExperienceSubtag.Work;

  final _experienceFormKey = GlobalKey<FormState>();

  void initialDataPop() {
    final experiences = _profileNotifier?.userProfile?.experiences?.toList();
    _companyNameController.text =
        widget.isAdd ? '' : experiences?[widget.editingIndex!].company ?? '';
    _companyWebsiteController.text =
        widget.isAdd ? '' : experiences?[widget.editingIndex!].website ?? '';
    _positionController.text =
        widget.isAdd ? '' : experiences?[widget.editingIndex!].jobTitle ?? '';
    _locationController.text =
        widget.isAdd ? '' : experiences?[widget.editingIndex!].location ?? '';
    _aboutController.text = widget.isAdd
        ? ''
        : experiences?[widget.editingIndex!].description ?? '';
    _startDateController.text = widget.isAdd
        ? ''
        : experiences?[widget.editingIndex!].startDate?.abrMMMyyyy ?? '';
    _endDateController.text = widget.isAdd
        ? ''
        : experiences?[widget.editingIndex!].endDate?.abrMMMyyyy ?? '';
    startDate =
        widget.isAdd ? null : experiences?[widget.editingIndex!].startDate;
    endDate = widget.isAdd ? null : experiences?[widget.editingIndex!].endDate;
    _subTag = widget.isAdd
        ? ExperienceSubtag.Work
        : experiences?[widget.editingIndex!].subTag;
    if (_subTag == ExperienceSubtag.Work) _selectedSubTagIndex = 0;
    if (_subTag == ExperienceSubtag.Leadership) _selectedSubTagIndex = 1;
    if (_subTag == ExperienceSubtag.Athletic) _selectedSubTagIndex = 2;
  }

  @override
  void initState() {
    super.initState();
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    initialDataPop();
  }

  List<String> subTags = [
    AppStrings.profileExpWorkTag,
    AppStrings.profileExpLeadershipTag,
    AppStrings.profileExpAthleticTag,
  ];
  int _selectedSubTagIndex = 0;

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
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ThemeHandler.backgroundColor(),
              boxShadow: const [
                BoxShadow(),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(16.w),
            child: Form(
              key: _experienceFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AddEditTopBarWidget(
                    title: 'Experience',
                    isAdd: widget.isAdd,
                    onDelete: () {
                      if (widget.isAdd.not) {
                        UserModel userModel = _profileNotifier!.userProfile!;
                        List<Experience>? experiences =
                            userModel.experiences?.toList();
                        showAlertDialog(
                          context: context,
                          txtContent: AppStrings.deleteContent,
                          textBtn1: AppStrings.cancelBtnTxt,
                          txtBtn2: AppStrings.deleteBtnTxt,
                          onBtn1: () => Navigator.of(context).pop(),
                          onBtn2: () {
                            if (widget.editingIndex != null) {
                              experiences?.removeAt(widget.editingIndex!);
                            }
                            userModel = userModel.copyWith(
                              experiences: experiences,
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
                  AddEditToggleFormWidget(
                    items: subTags,
                    selected: _selectedSubTagIndex,
                    onTap: (index) {
                      _selectedSubTagIndex = index;
                      _subTag = ExperienceSubtag.values[index];
                      setState(() {});
                    },
                  ),
                  sizedBoxWithHeight(16),
                  AppMaterialInputField(
                    label: _subTag == ExperienceSubtag.Work
                        ? 'Company'
                        : 'Organization',
                    hint: _subTag == ExperienceSubtag.Work
                        ? 'Facebook'
                        : 'Internation Sports Federation',
                    controller: _companyNameController,
                    maxLines: 1,
                    isRequired: true,
                  ),
                  sizedBoxWithHeight(16),
                  Row(
                    children: [
                      Expanded(
                        child: AppMaterialInputField(
                          label: 'Position',
                          hint: _subTag == ExperienceSubtag.Work
                              ? 'Marketing head'
                              : 'Topper',
                          controller: _positionController,
                          maxLines: 1,
                          isRequired: true,
                        ),
                      ),
                      sizedBoxWithWidth(80),
                      Expanded(
                        child: AppMaterialInputField(
                          label: 'Location',
                          hint: 'Jaipur, Rajasthan',
                          controller: _locationController,
                          maxLines: 1,
                          isRequired: false,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            AppMaterialInputField(
                              label: 'Start Date',
                              hint: AppStrings.select,
                              controller: _startDateController,
                              isRequired: true,
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
                                  value: iCurrWorkHere,
                                  onChanged: (value) {
                                    endDate = null;
                                    _endDateController.clear();
                                    iCurrWorkHere =
                                        endDate == null ? true : !iCurrWorkHere;
                                    setState(() {});
                                  },
                                ),
                                sizedBoxWithWidth(8),
                                Text(
                                  'I currently work here',
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
                          label: 'End Date',
                          hint: AppStrings.select,
                          controller: _endDateController,
                          isRequired: false,
                          firstLastDate: [DateTime(1922), DateTime(2040)],
                          dateTimeCallBack: (d) {
                            endDate = d;
                            iCurrWorkHere =
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
                    label:
                        '${_subTag == ExperienceSubtag.Work ? 'Company' : 'Organization'} Website',
                    hint: 'http://facebook.com',
                    controller: _companyWebsiteController,
                    maxLines: 1,
                    isRequired: false,
                    isLinkTypeInput: true,
                  ),
                  sizedBoxWithHeight(16),
                  AppMaterialInputField(
                    label: 'About the role',
                    hint:
                        'Tell us about your ${_subTag == ExperienceSubtag.Work ? 'job' : ''} experience',
                    controller: _aboutController,
                    inputStyle: AppTextStyles.text14w400,
                    maxLength: 2400,
                    isRequired: false,
                  ),
                  sizedBoxWithHeight(24),
                  CustomButton(
                      onPressed: () {
                        if (_experienceFormKey.currentState?.validate().not ??
                            true) {
                          return;
                        }
                        UserModel userModel = _profileNotifier!.userProfile!;
                        if (widget.isAdd) {}
                        Experience experience = Experience(
                          company: _companyNameController.text,
                          website: _companyWebsiteController.text,
                          jobTitle: _positionController.text,
                          description: _aboutController.text,
                          startDate: startDate,
                          endDate: endDate,
                          currentlyWorkingHere: iCurrWorkHere,
                          location: _locationController.text,
                          subTag: _subTag,
                        );

                        List<Experience>? experiences =
                            userModel.experiences?.toList();
                        if (widget.isAdd) {
                          experiences ??= [];
                          experiences.add(experience);
                        } else {
                          experiences?[widget.editingIndex!] = experience;
                        }
                        userModel = userModel.copyWith(
                          experiences: experiences,
                        );

                        _profileNotifier?.saveProfile(userModel).then((value) {
                          Navigator.pop(context);
                        });
                      },
                      text: widget.isAdd
                          ? AppStrings.add
                          : AppStrings.saveChanges),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
