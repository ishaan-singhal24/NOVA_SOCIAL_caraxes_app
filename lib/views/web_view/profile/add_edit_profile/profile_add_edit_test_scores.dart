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

class ProfileAddEditTestScores extends StatefulWidget {
  final bool isAdd;
  final int? editingIndex;
  const ProfileAddEditTestScores({
    Key? key,
    this.isAdd = true,
    this.editingIndex,
  }) : super(key: key);

  @override
  State<ProfileAddEditTestScores> createState() =>
      _ProfileAddEditTestScoresState();
}

class _ProfileAddEditTestScoresState extends State<ProfileAddEditTestScores> {
  final TextEditingController _testNameController = TextEditingController();
  final TextEditingController _testWebsiteController = TextEditingController();
  final TextEditingController _scoredMarksController = TextEditingController();
  final TextEditingController _maxMarksController = TextEditingController();
  final TextEditingController _testDateController = TextEditingController();

  DateTime? testDate;

  ProfileNotifier? _profileNotifier;

  final _testScoresFormKey = GlobalKey<FormState>();

  void initialDataPop() {
    final tests = _profileNotifier?.userProfile?.testScores?.toList();
    _testNameController.text =
        widget.isAdd ? '' : tests?[widget.editingIndex!].testName ?? '';
    _testWebsiteController.text =
        widget.isAdd ? '' : tests?[widget.editingIndex!].website ?? '';
    _scoredMarksController.text =
        widget.isAdd ? '' : tests?[widget.editingIndex!].scoredMarks ?? '';
    _maxMarksController.text =
        widget.isAdd ? '' : tests?[widget.editingIndex!].maxMarks ?? '';
    _testDateController.text = widget.isAdd
        ? ''
        : tests?[widget.editingIndex!].testDate?.abrMMMyyyy ?? '';
    testDate = widget.isAdd ? null : tests?[widget.editingIndex!].testDate;
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
              maxWidth: kIsLargeScreen ? 320.w : 280.w,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ThemeHandler.backgroundColor(),
              boxShadow: const [
                BoxShadow(),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Form(
              key: _testScoresFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AddEditTopBarWidget(
                    title: 'Test Scores',
                    isAdd: widget.isAdd,
                    onDelete: () {
                      if (widget.isAdd.not) {
                        UserModel userModel = _profileNotifier!.userProfile!;
                        List<UserTestScores>? testScores =
                            userModel.testScores?.toList();
                        showAlertDialog(
                          context: context,
                          txtContent: AppStrings.deleteContent,
                          textBtn1: AppStrings.cancelBtnTxt,
                          txtBtn2: AppStrings.deleteBtnTxt,
                          onBtn1: () => Navigator.of(context).pop(),
                          onBtn2: () {
                            if (widget.editingIndex != null) {
                              testScores?.removeAt(widget.editingIndex!);
                              userModel = userModel.copyWith(
                                testScores: testScores,
                              );
                            }
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AddEditTextFieldWidget(
                      columnHead: 'Test Name',
                      textFieldHintText: 'TOEFL',
                      textEditingController: _testNameController,
                      maxLength: 200,
                      maxLines: 1,
                      isRequiredField: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AddEditTextFieldWidget(
                      columnHead: 'Test Website',
                      textFieldHintText: 'http://toefl.org',
                      textEditingController: _testWebsiteController,
                      maxLength: 200,
                      maxLines: 1,
                      isRequiredField: false,
                      isLinkTypeInput: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AddEditTextFieldWidget(
                      columnHead: 'Marks Scored',
                      textFieldHintText: '102',
                      textEditingController: _scoredMarksController,
                      maxLength: 10,
                      maxLines: 1,
                      isRequiredField: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AddEditTextFieldWidget(
                      columnHead: 'Max Marks',
                      textFieldHintText: '120',
                      textEditingController: _maxMarksController,
                      maxLength: 10,
                      maxLines: 1,
                      isRequiredField: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AddEditDateFieldWidget(
                      columnHead: 'Test Date',
                      textFieldHintText: AppStrings.select,
                      textEditingController: _testDateController,
                      isRequiredField: true,
                      firstDate: DateTime(1922),
                      lastDate: DateTime.now(),
                      callback: (d) {
                        testDate = d;
                      },
                    ),
                  ),
                  sizedBoxWithHeight(24),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: CustomButton(
                      onPressed: () {
                        if (_testScoresFormKey.currentState?.validate().not ??
                            true) {
                          return;
                        }
                        UserModel userModel = _profileNotifier!.userProfile!;
                        if (widget.isAdd) {}
                        UserTestScores testScore = UserTestScores(
                          testName: _testNameController.text,
                          website: _testWebsiteController.text,
                          maxMarks: _maxMarksController.text,
                          scoredMarks: _scoredMarksController.text,
                          testDate: testDate,
                        );

                        List<UserTestScores>? testScores =
                            userModel.testScores?.toList();
                        if (widget.isAdd) {
                          testScores ??= [];
                          testScores.add(testScore);
                        } else {
                          testScores?[widget.editingIndex!] = testScore;
                        }
                        userModel = userModel.copyWith(testScores: testScores);

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
