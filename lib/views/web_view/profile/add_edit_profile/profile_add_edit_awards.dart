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

class ProfileAddEditAwards extends StatefulWidget {
  final bool isAdd;
  final int? editingIndex;
  const ProfileAddEditAwards({
    Key? key,
    this.isAdd = true,
    this.editingIndex,
  }) : super(key: key);

  @override
  State<ProfileAddEditAwards> createState() => _ProfileAddEditAwardsState();
}

class _ProfileAddEditAwardsState extends State<ProfileAddEditAwards> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _issuedByController = TextEditingController();
  final TextEditingController _issuerWebsiteController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _issueDateController = TextEditingController();

  DateTime? issueDate;

  ProfileNotifier? _profileNotifier;

  final _awardsFormKey = GlobalKey<FormState>();

  void initialDataPop() {
    final tests = _profileNotifier?.userProfile?.awards?.toList();
    _nameController.text =
        widget.isAdd ? '' : tests?[widget.editingIndex!].name ?? '';
    _issuedByController.text =
        widget.isAdd ? '' : tests?[widget.editingIndex!].issuedBy ?? '';
    _issuerWebsiteController.text =
        widget.isAdd ? '' : tests?[widget.editingIndex!].website ?? '';
    _descriptionController.text =
        widget.isAdd ? '' : tests?[widget.editingIndex!].description ?? '';
    _issueDateController.text = widget.isAdd
        ? ''
        : tests?[widget.editingIndex!].issueDate?.abrMMMyyyy ?? '';
    issueDate = widget.isAdd ? null : tests?[widget.editingIndex!].issueDate;
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
              key: _awardsFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AddEditTopBarWidget(
                    title: AppStrings.profileAwards,
                    isAdd: widget.isAdd,
                    onDelete: () {
                      if (widget.isAdd.not) {
                        UserModel userModel = _profileNotifier!.userProfile!;
                        List<Award>? awards = userModel.awards?.toList();
                        showAlertDialog(
                          context: context,
                          txtContent: AppStrings.deleteContent,
                          textBtn1: AppStrings.cancelBtnTxt,
                          txtBtn2: AppStrings.deleteBtnTxt,
                          onBtn1: () => Navigator.of(context).pop(),
                          onBtn2: () {
                            if (widget.editingIndex != null) {
                              awards?.removeAt(widget.editingIndex!);
                            }
                            userModel = userModel.copyWith(
                              awards: awards,
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
                    message: 'You can show your awards here!',
                  ),
                  sizedBoxWithHeight(16),
                  AppMaterialInputField(
                    label: AppStrings.awardName,
                    hint: 'Best Delegate - MUN Jaipur',
                    controller: _nameController,
                    maxLines: 1,
                    isRequired: true,
                  ),
                  sizedBoxWithHeight(16),
                  Row(
                    children: [
                      Expanded(
                        child: AppMaterialInputField(
                          label: AppStrings.issuedBy,
                          hint: 'Manipal University Jaipur',
                          controller: _issuedByController,
                          maxLines: 1,
                          isRequired: true,
                        ),
                      ),
                      sizedBoxWithWidth(80),
                      Expanded(
                        child: AppMaterialInputField(
                          label: AppStrings.issuedDate,
                          hint: AppStrings.select,
                          controller: _issueDateController,
                          isRequired: true,
                          suffixIcon: Icon(
                            Icons.calendar_month,
                            color: ThemeHandler.novaMutedColor(),
                          ),
                          firstLastDate: [DateTime(1922), DateTime.now()],
                          dateTimeCallBack: (d) {
                            issueDate = d;
                          },
                        ),
                      ),
                    ],
                  ),
                  sizedBoxWithHeight(16),
                  AppMaterialInputField(
                    label: AppStrings.issuerWebsite,
                    hint: 'http://mun.edu',
                    controller: _issuerWebsiteController,
                    maxLines: 1,
                    isRequired: false,
                    isLinkTypeInput: true,
                  ),
                  sizedBoxWithHeight(16),
                  AppMaterialInputField(
                    label: AppStrings.descriptionAboutAward,
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
                      if (_awardsFormKey.currentState?.validate().not ?? true) {
                        return;
                      }
                      UserModel userModel = _profileNotifier!.userProfile!;
                      if (widget.isAdd) {}
                      Award award = Award(
                        name: _nameController.text,
                        website: _issuerWebsiteController.text,
                        description: _descriptionController.text,
                        issuedBy: _issuedByController.text,
                        issueDate: issueDate,
                      );
                      List<Award>? awards = userModel.awards?.toList();
                      if (widget.isAdd) {
                        awards ??= [];
                        awards.add(award);
                      } else {
                        awards?[widget.editingIndex!] = award;
                      }
                      userModel = userModel.copyWith(awards: awards);
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
