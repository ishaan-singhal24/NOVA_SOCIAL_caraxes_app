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

class ProfileAddEditTestScoreMView extends StatefulWidget {
  final ProfileAddEditTestScoreMViewArgs args;
  const ProfileAddEditTestScoreMView({
    super.key,
    required this.args,
  });

  @override
  State<ProfileAddEditTestScoreMView> createState() =>
      _ProfileAddEditTestScoreMViewState();
}

class _ProfileAddEditTestScoreMViewState
    extends State<ProfileAddEditTestScoreMView> {
  final FocusNode _descriptionFocusNode = FocusNode();

  final TextEditingController _testNameController = TextEditingController();
  final TextEditingController _conductedByController = TextEditingController();
  final TextEditingController _testScoreController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _relatedLinkController = TextEditingController();
  final TextEditingController _testDateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  DateTime? _testDate;

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
    _testNameController.text = widget.args.editTestScore?.testName ?? '';
    _conductedByController.text = widget.args.editTestScore?.conductedBy ?? '';
    _testScoreController.text = widget.args.editTestScore?.scoredMarks ?? '';
    _websiteController.text = widget.args.editTestScore?.website ?? '';
    _relatedLinkController.text = widget.args.editTestScore?.relatedLink ?? '';
    _testDate = widget.args.editTestScore?.testDate;
    _testDateController.text =
        widget.args.editTestScore?.testDate?.abrMMMyyyy ?? '';
    _descriptionController.text = widget.args.editTestScore?.description ?? '';
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
                    title: AppStrings.profileTestScores,
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
                          label: AppStrings.testName,
                          hint: 'Internation Maths Olympiad',
                          controller: _testNameController,
                          isRequired: true,
                          maxLines: 1,
                          textInputAction: TextInputAction.go,
                        ),
                        sizedBoxWithHeight(24),
                        AppMaterialInputField(
                          label: AppStrings.conductedBy,
                          hint: 'Model United Nations',
                          controller: _conductedByController,
                          isRequired: true,
                          maxLines: 1,
                          textInputAction: TextInputAction.go,
                        ),
                        sizedBoxWithHeight(24),
                        AppMaterialInputField(
                          label: AppStrings.profileTestScore,
                          hint: '59/60 (Rank 1 internationally)',
                          controller: _testScoreController,
                          isRequired: true,
                          maxLines: 1,
                          textInputAction: TextInputAction.go,
                        ),
                        sizedBoxWithHeight(24),
                        AppMaterialInputField(
                          label: AppStrings.relatedLink,
                          hint: 'https://maths.olympiad.org',
                          controller: _relatedLinkController,
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
                                controller: _testDateController,
                                isRequired: true,
                                suffixIcon: Icon(
                                  Icons.calendar_month,
                                  color: ThemeHandler.novaMutedColor(),
                                ),
                                firstLastDate: [DateTime(1922), DateTime.now()],
                                dateTimeCallBack: (d) {
                                  _testDate = d;
                                },
                              ),
                            ),
                          ],
                        ),
                        sizedBoxWithHeight(24),
                        AppMaterialInputField(
                          focusNode: _descriptionFocusNode,
                          label: AppStrings.description,
                          hint: 'You can share your test experience here..',
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
                            UserTestScores testScore = UserTestScores(
                              testName: _testNameController.text,
                              conductedBy: _conductedByController.text,
                              scoredMarks: _testScoreController.text,
                              relatedLink: _relatedLinkController.text,
                              testDate: _testDate,
                              description: _descriptionController.text,
                              website: _websiteController.text,
                            );
                            List<UserTestScores>? testScores =
                                userModel.testScores?.toList();
                            if (widget.args.isAdd) {
                              testScores ??= [];
                              testScores.add(testScore);
                            } else {
                              testScores?[widget.args.editIndex!] = testScore;
                            }
                            userModel =
                                userModel.copyWith(testScores: testScores);
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
