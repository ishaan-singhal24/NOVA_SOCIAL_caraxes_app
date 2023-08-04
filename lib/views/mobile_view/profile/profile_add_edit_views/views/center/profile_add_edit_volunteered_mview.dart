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

class ProfileAddEditVolunteeredMView extends StatefulWidget {
  final ProfileAddEditVolunteeredMViewArgs args;
  const ProfileAddEditVolunteeredMView({
    super.key,
    required this.args,
  });

  @override
  State<ProfileAddEditVolunteeredMView> createState() =>
      _ProfileAddEditVolunteeredMViewState();
}

class _ProfileAddEditVolunteeredMViewState
    extends State<ProfileAddEditVolunteeredMView> {
  final FocusNode _descriptionFocusNode = FocusNode();

  final TextEditingController _organizationController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;
  bool iCurrentlyVolenteerHere = true;

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
    _organizationController.text =
        widget.args.editVolunteer?.organization ?? '';
    _titleController.text = widget.args.editVolunteer?.title ?? '';
    _websiteController.text = widget.args.editVolunteer?.website ?? '';
    _startDate = widget.args.editVolunteer?.startDate;
    _startDateController.text =
        widget.args.editVolunteer?.startDate?.abrMMMyyyy ?? '';
    _endDate = widget.args.editVolunteer?.endDate;
    _endDateController.text =
        widget.args.editVolunteer?.endDate?.abrMMMyyyy ?? '';
    _descriptionController.text = widget.args.editVolunteer?.description ?? '';
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
                    title: AppStrings.volunteering,
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
                          label: AppStrings.organizationName,
                          hint: 'Greenleaf Foundation',
                          controller: _organizationController,
                          isRequired: true,
                          maxLines: 1,
                          textInputAction: TextInputAction.go,
                        ),
                        sizedBoxWithHeight(24),
                        AppMaterialInputField(
                          label: AppStrings.position,
                          hint: 'Accountant',
                          controller: _titleController,
                          isRequired: true,
                          maxLines: 1,
                          textInputAction: TextInputAction.go,
                        ),
                        sizedBoxWithHeight(24),
                        AppMaterialInputField(
                          label: AppStrings.organizationWebsite,
                          hint: 'https://greenleaf.org',
                          controller: _websiteController,
                          isRequired: false,
                          isLinkTypeInput: true,
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
                                  iCurrentlyVolenteerHere =
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
                              value: iCurrentlyVolenteerHere,
                              onChanged: (value) {
                                _endDate = null;
                                _endDateController.clear();
                                iCurrentlyVolenteerHere = _endDate == null
                                    ? true
                                    : !iCurrentlyVolenteerHere;
                                setState(() {});
                              },
                            ),
                            sizedBoxWithWidth(8),
                            Text(
                              'I currently volenteer here',
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
                            Volunteer volunteer = Volunteer(
                              organization: _organizationController.text,
                              title: _titleController.text,
                              description: _descriptionController.text,
                              startDate: _startDate,
                              endDate: _endDate,
                              currentlyVolunteering: iCurrentlyVolenteerHere,
                              website: _websiteController.text,
                            );
                            List<Volunteer>? volunteered =
                                userModel.volunteered?.toList();
                            if (widget.args.isAdd) {
                              volunteered ??= [];
                              volunteered.add(volunteer);
                            } else {
                              volunteered?[widget.args.editIndex!] = volunteer;
                            }
                            userModel =
                                userModel.copyWith(volunteered: volunteered);
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
