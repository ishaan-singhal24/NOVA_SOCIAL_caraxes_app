import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/widgets/profile_add_edit_app_bar_mwidget.dart';
import 'package:provider/provider.dart';

class ProfileAddEditEducationMView extends StatefulWidget {
  final ProfileAddEditEducationMViewArgs args;
  const ProfileAddEditEducationMView({
    super.key,
    required this.args,
  });

  @override
  State<ProfileAddEditEducationMView> createState() =>
      _ProfileAddEditEducationMViewState();
}

class _ProfileAddEditEducationMViewState
    extends State<ProfileAddEditEducationMView> {
  final FocusNode _descriptionFocusNode = FocusNode();

  final TextEditingController _instituteNameController =
      TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;
  bool iCurrStudyHere = true;

  final _educationFormKey = GlobalKey<FormState>();
  ProfileNotifier? _profileNotifier;

  @override
  void initState() {
    super.initState();
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    populateEditData();
  }

  void populateEditData() {
    if (widget.args.isAdd) {
      return;
    }
    _instituteNameController.text = widget.args.editEducation?.school ?? '';
    _classController.text = widget.args.editEducation?.degree ?? '';
    _locationController.text = widget.args.editEducation?.location ?? '';
    _startDate = widget.args.editEducation?.startDate;
    _startDateController.text =
        widget.args.editEducation?.startDate?.abrMMMyyyy ?? '';
    _endDate = widget.args.editEducation?.endDate;
    _endDateController.text =
        widget.args.editEducation?.endDate?.abrMMMyyyy ?? '';
    _descriptionController.text = widget.args.editEducation?.description ?? '';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: GestureDetector(
          onPanDown: (_) {
            _descriptionFocusNode.unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizedBoxWithHeight(36),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: ProfileAddEditAppBarMWidget(
                    isAdd: widget.args.isAdd,
                    title: AppStrings.education,
                  ),
                ),
                sizedBoxWithHeight(36),
                Form(
                  key: _educationFormKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        AppMaterialInputField(
                          label: 'School/College',
                          hint: AppStrings.chooseYourUsername,
                          controller: _instituteNameController,
                          isRequired: true,
                          maxLines: 1,
                          textInputAction: TextInputAction.go,
                        ),
                        sizedBoxWithHeight(24),
                        AppMaterialInputField(
                          label: 'Class/Year',
                          hint: '12th',
                          controller: _classController,
                          isRequired: true,
                          maxLines: 1,
                          textInputAction: TextInputAction.go,
                        ),
                        sizedBoxWithHeight(24),
                        AppMaterialInputField(
                          label: 'Location',
                          hint: 'Delhi, India',
                          controller: _locationController,
                          isRequired: false,
                          maxLines: 1,
                          textInputAction: TextInputAction.go,
                        ),
                        sizedBoxWithHeight(24),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: AppMaterialInputField(
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
                                  _startDate = d;
                                },
                              ),
                            ),
                            sizedBoxWithWidth(24),
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
                                  _endDate = d;
                                  iCurrStudyHere =
                                      (_endDate?.compareTo(DateTime.now()) ??
                                                  1) >
                                              0
                                          ? true
                                          : false;
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
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
                                _endDate = null;
                                _endDateController.clear();
                                iCurrStudyHere =
                                    _endDate == null ? true : !iCurrStudyHere;
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
                        sizedBoxWithHeight(24),
                        AppMaterialInputField(
                          focusNode: _descriptionFocusNode,
                          label: AppStrings.description,
                          hint: 'You can share your experience here..',
                          controller: _descriptionController,
                          maxLength: 2400,
                          maxLines: 6,
                          isRequired: false,
                          inputStyle: AppTextStyles.text14w400,
                        ),
                        sizedBoxWithHeight(24),
                        CustomButton(
                          height: 48.h,
                          width: ScreenUtil.instance.screenWidth - 48.w,
                          onPressed: () {
                            if (_educationFormKey.currentState
                                    ?.validate()
                                    .not ??
                                true) {
                              return;
                            }
                            appLoadingMPopup(context);
                            UserModel userModel =
                                _profileNotifier!.userProfile!;
                            Education education = Education(
                              school: _instituteNameController.text,
                              degree: _classController.text,
                              description: _descriptionController.text,
                              startDate: _startDate,
                              endDate: _endDate,
                              currentlyStudyHere: iCurrStudyHere,
                              location: _locationController.text,
                            );
                            List<Education>? educations =
                                userModel.educations?.toList();
                            if (widget.args.isAdd) {
                              educations ??= [];
                              educations.add(education);
                            } else {
                              educations?[widget.args.editIndex!] = education;
                            }
                            userModel =
                                userModel.copyWith(educations: educations);
                            _profileNotifier
                                ?.saveProfile(userModel)
                                .then((value) {
                              Navigator.pop(context);
                            }).then((value) {
                              context.pop();
                            });
                          },
                          text: widget.args.isAdd
                              ? AppStrings.add
                              : AppStrings.saveChanges,
                        ),
                        sizedBoxWithHeight(72),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
