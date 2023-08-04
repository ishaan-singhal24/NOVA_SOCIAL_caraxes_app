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

class ProfileAddEditVolunteer extends StatefulWidget {
  final bool isAdd;
  final int? editingIndex;
  const ProfileAddEditVolunteer({
    Key? key,
    this.isAdd = true,
    this.editingIndex,
  }) : super(key: key);

  @override
  State<ProfileAddEditVolunteer> createState() =>
      _ProfileAddEditVolunteerState();
}

class _ProfileAddEditVolunteerState extends State<ProfileAddEditVolunteer> {
  final TextEditingController _organizationNameController =
      TextEditingController();
  final TextEditingController _organizationWebsiteController =
      TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;

  bool iCurrWorkHere = true;

  ProfileNotifier? _profileNotifier;

  final _volunteerFormKey = GlobalKey<FormState>();

  void initialDataPop() {
    final volunteered = _profileNotifier?.userProfile?.volunteered?.toList();
    _organizationNameController.text = widget.isAdd
        ? ''
        : volunteered?[widget.editingIndex!].organization ?? '';
    _organizationWebsiteController.text =
        widget.isAdd ? '' : volunteered?[widget.editingIndex!].website ?? '';
    _positionController.text =
        widget.isAdd ? '' : volunteered?[widget.editingIndex!].title ?? '';
    _aboutController.text = widget.isAdd
        ? ''
        : volunteered?[widget.editingIndex!].description ?? '';
    _startDateController.text = widget.isAdd
        ? ''
        : volunteered?[widget.editingIndex!].startDate?.abrMMMyyyy ?? '';
    _endDateController.text = widget.isAdd
        ? ''
        : (volunteered?[widget.editingIndex!].currentlyVolunteering ?? false)
            ? 'Volunteering'
            : volunteered?[widget.editingIndex!].endDate?.abrMMMyyyy ?? '';
    startDate =
        widget.isAdd ? null : volunteered?[widget.editingIndex!].startDate;
    endDate = widget.isAdd ? null : volunteered?[widget.editingIndex!].endDate;
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
              key: _volunteerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AddEditTopBarWidget(
                    title: AppStrings.volunteering,
                    isAdd: widget.isAdd,
                    onDelete: () {
                      if (widget.isAdd.not) {
                        UserModel userModel = _profileNotifier!.userProfile!;
                        List<Volunteer>? volunteered =
                            userModel.volunteered?.toList();
                        showAlertDialog(
                          context: context,
                          txtContent: AppStrings.deleteContent,
                          textBtn1: AppStrings.cancelBtnTxt,
                          txtBtn2: AppStrings.deleteBtnTxt,
                          onBtn1: () => Navigator.of(context).pop(),
                          onBtn2: () {
                            if (widget.editingIndex != null) {
                              volunteered?.removeAt(widget.editingIndex!);
                            }
                            userModel = userModel.copyWith(
                              volunteered: volunteered,
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
                    message: 'You can show your volunteering experiences here!',
                  ),
                  sizedBoxWithHeight(16),
                  AppMaterialInputField(
                    label: AppStrings.organizationName,
                    hint: 'Milinda Gates Foundation',
                    controller: _organizationNameController,
                    maxLines: 1,
                    isRequired: true,
                  ),
                  sizedBoxWithHeight(16),
                  Row(
                    children: [
                      Expanded(
                        child: AppMaterialInputField(
                          label: AppStrings.organizationWebsite,
                          hint: 'http://milindagates.org',
                          controller: _organizationWebsiteController,
                          maxLines: 1,
                          isRequired: false,
                          isLinkTypeInput: true,
                        ),
                      ),
                      sizedBoxWithWidth(80),
                      Expanded(
                        child: AppMaterialInputField(
                          label: AppStrings.position,
                          hint: 'Accountant',
                          controller: _positionController,
                          maxLines: 1,
                          isRequired: true,
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
                                  'I currently volunteer here',
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
                    label: AppStrings.aboutTheWork,
                    hint: 'You can share your experience here..',
                    controller: _aboutController,
                    maxLength: 2400,
                    maxLines: null,
                    isRequired: false,
                    inputStyle: AppTextStyles.text14w400,
                  ),
                  sizedBoxWithHeight(16),
                  CustomButton(
                    onPressed: () {
                      if (_volunteerFormKey.currentState?.validate().not ??
                          true) {
                        return;
                      }
                      UserModel userModel = _profileNotifier!.userProfile!;
                      if (widget.isAdd) {}
                      Volunteer volunteer = Volunteer(
                        organization: _organizationNameController.text,
                        website: _organizationWebsiteController.text,
                        description: _aboutController.text,
                        startDate: startDate,
                        endDate: endDate,
                        currentlyVolunteering: iCurrWorkHere,
                        title: _positionController.text,
                      );
                      List<Volunteer>? volunteered =
                          userModel.volunteered?.toList();
                      if (widget.isAdd) {
                        volunteered ??= [];
                        volunteered.add(volunteer);
                      } else {
                        volunteered?[widget.editingIndex!] = volunteer;
                      }
                      userModel = userModel.copyWith(volunteered: volunteered);
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
