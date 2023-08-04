import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/widgets/profile_add_edit_app_bar_mwidget.dart';
import 'package:provider/provider.dart';

class ProfileAddEditExperienceMView extends StatefulWidget {
  final ProfileAddEditExperienceMViewArgs args;
  const ProfileAddEditExperienceMView({
    super.key,
    required this.args,
  });

  @override
  State<ProfileAddEditExperienceMView> createState() =>
      _ProfileAddEditExperienceMViewState();
}

class _ProfileAddEditExperienceMViewState
    extends State<ProfileAddEditExperienceMView> {
  final FocusNode _descriptionFocusNode = FocusNode();

  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _companyWebsiteController =
      TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  ExperienceSubtag? subtag = ExperienceSubtag.Work;
  DateTime? _startDate;
  DateTime? _endDate;
  bool iCurrWorkHere = true;

  final _experienceFormKey = GlobalKey<FormState>();
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
    subtag = widget.args.editExperience?.subTag;
    _companyNameController.text = widget.args.editExperience?.company ?? '';
    _jobTitleController.text = widget.args.editExperience?.jobTitle ?? '';
    _locationController.text = widget.args.editExperience?.location ?? '';
    _companyWebsiteController.text = widget.args.editExperience?.website ?? '';
    _startDate = widget.args.editExperience?.startDate;
    _startDateController.text =
        widget.args.editExperience?.startDate?.abrMMMyyyy ?? '';
    _endDate = widget.args.editExperience?.endDate;
    _endDateController.text =
        widget.args.editExperience?.endDate?.abrMMMyyyy ?? '';
    _descriptionController.text = widget.args.editExperience?.description ?? '';
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
                    title: AppStrings.experienceHead,
                  ),
                ),
                sizedBoxWithHeight(36),
                Form(
                  key: _experienceFormKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    subtag = ExperienceSubtag.Work;
                                  });
                                },
                                child: SizedBox(
                                  width: double.maxFinite,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: subtag == ExperienceSubtag.Work
                                              ? AppColors.novaDarkIndigo
                                              : ThemeHandler.backgroundColor(),
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Work',
                                          style: subtag == ExperienceSubtag.Work
                                              ? AppTextStyles.text16w800
                                              : AppTextStyles.text16w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            sizedBoxWithWidth(8),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    subtag = ExperienceSubtag.Leadership;
                                  });
                                },
                                child: SizedBox(
                                  width: double.maxFinite,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: subtag ==
                                                  ExperienceSubtag.Leadership
                                              ? AppColors.novaDarkIndigo
                                              : ThemeHandler.backgroundColor(),
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Leadership',
                                          style: subtag ==
                                                  ExperienceSubtag.Leadership
                                              ? AppTextStyles.text16w800
                                              : AppTextStyles.text16w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            sizedBoxWithWidth(8),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    subtag = ExperienceSubtag.Athletic;
                                  });
                                },
                                child: SizedBox(
                                  width: double.maxFinite,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: subtag ==
                                                  ExperienceSubtag.Athletic
                                              ? AppColors.novaDarkIndigo
                                              : ThemeHandler.backgroundColor(),
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Athletic',
                                          style: subtag ==
                                                  ExperienceSubtag.Athletic
                                              ? AppTextStyles.text16w800
                                              : AppTextStyles.text16w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        sizedBoxWithHeight(24),
                        AppMaterialInputField(
                          label: subtag == ExperienceSubtag.Work
                              ? 'Company'
                              : 'Organization',
                          hint: subtag == ExperienceSubtag.Work
                              ? 'Facebook'
                              : 'Internation Sports Federation',
                          controller: _companyNameController,
                          isRequired: true,
                          maxLines: 1,
                          textInputAction: TextInputAction.go,
                        ),
                        sizedBoxWithHeight(24),
                        AppMaterialInputField(
                          label: 'Role/Position',
                          hint: subtag == ExperienceSubtag.Work
                              ? 'Marketing head'
                              : 'Topper',
                          controller: _jobTitleController,
                          isRequired: true,
                          maxLines: 1,
                          textInputAction: TextInputAction.go,
                        ),
                        sizedBoxWithHeight(24),
                        AppMaterialInputField(
                          label:
                              '${subtag == ExperienceSubtag.Work ? 'Company' : 'Organization'} Website',
                          hint: 'http://facebook.com',
                          controller: _companyWebsiteController,
                          maxLines: 1,
                          isRequired: false,
                          isLinkTypeInput: true,
                        ),
                        sizedBoxWithHeight(24),
                        AppMaterialInputField(
                          label: AppStrings.location,
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
                                  iCurrWorkHere =
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
                              value: iCurrWorkHere,
                              onChanged: (value) {
                                _endDate = null;
                                _endDateController.clear();
                                iCurrWorkHere =
                                    _endDate == null ? true : !iCurrWorkHere;
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
                            if (_experienceFormKey.currentState
                                    ?.validate()
                                    .not ??
                                true) {
                              return;
                            }
                            appLoadingMPopup(context);
                            UserModel userModel =
                                _profileNotifier!.userProfile!;
                            Experience experience = Experience(
                              subTag: subtag,
                              company: _companyNameController.text,
                              jobTitle: _jobTitleController.text,
                              description: _descriptionController.text,
                              startDate: _startDate,
                              endDate: _endDate,
                              currentlyWorkingHere: iCurrWorkHere,
                              location: _locationController.text,
                              website: _companyWebsiteController.text,
                            );
                            List<Experience>? experiences =
                                userModel.experiences?.toList();
                            if (widget.args.isAdd) {
                              experiences ??= [];
                              experiences.add(experience);
                            } else {
                              experiences?[widget.args.editIndex!] = experience;
                            }
                            userModel =
                                userModel.copyWith(experiences: experiences);
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
