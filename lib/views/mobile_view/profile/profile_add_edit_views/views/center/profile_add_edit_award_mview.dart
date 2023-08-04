import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/profile/profile_notifier.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/widgets/profile_add_edit_app_bar_mwidget.dart';
import 'package:provider/provider.dart';

class ProfileAddEditAwardMView extends StatefulWidget {
  final ProfileAddEditAwardMViewArgs args;
  const ProfileAddEditAwardMView({
    super.key,
    required this.args,
  });

  @override
  State<ProfileAddEditAwardMView> createState() =>
      _ProfileAddEditAwardMViewState();
}

class _ProfileAddEditAwardMViewState extends State<ProfileAddEditAwardMView> {
  final FocusNode _descriptionFocusNode = FocusNode();

  final TextEditingController _awardNameController = TextEditingController();
  final TextEditingController _issuedByController = TextEditingController();
  final TextEditingController _issuedByWebsiteController =
      TextEditingController();
  final TextEditingController _issueDateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  DateTime? _issueDate;

  final _awardFormKey = GlobalKey<FormState>();
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
    _awardNameController.text = widget.args.editAward?.name ?? '';
    _issuedByController.text = widget.args.editAward?.issuedBy ?? '';
    _issuedByWebsiteController.text = widget.args.editAward?.website ?? '';
    _issueDate = widget.args.editAward?.issueDate;
    _issueDateController.text =
        widget.args.editAward?.issueDate?.abrMMMyyyy ?? '';
    _descriptionController.text = widget.args.editAward?.description ?? '';
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
                    title: AppStrings.profileAwards,
                  ),
                ),
                sizedBoxWithHeight(36),
                Form(
                  key: _awardFormKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        AppMaterialInputField(
                          label: AppStrings.awardName,
                          hint: 'Best Delegate MUN',
                          controller: _awardNameController,
                          isRequired: true,
                          maxLines: 1,
                          textInputAction: TextInputAction.go,
                        ),
                        sizedBoxWithHeight(24),
                        AppMaterialInputField(
                          label: AppStrings.issuedBy,
                          hint: 'Model United Nations',
                          controller: _issuedByController,
                          isRequired: true,
                          maxLines: 1,
                          textInputAction: TextInputAction.go,
                        ),
                        sizedBoxWithHeight(24),
                        AppMaterialInputField(
                          label: AppStrings.issuerWebsite,
                          hint: 'https://mun.org',
                          controller: _issuedByWebsiteController,
                          isRequired: true,
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
                                  _issueDate = d;
                                },
                              ),
                            ),
                          ],
                        ),
                        sizedBoxWithHeight(24),
                        AppMaterialInputField(
                          focusNode: _descriptionFocusNode,
                          label: AppStrings.description,
                          hint: 'You can share your award experience here..',
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
                            if (_awardFormKey.currentState?.validate().not ??
                                true) {
                              return;
                            }
                            appLoadingMPopup(context);
                            UserModel userModel =
                                _profileNotifier!.userProfile!;
                            Award award = Award(
                              name: _awardNameController.text,
                              issuedBy: _issuedByController.text,
                              website: _issuedByWebsiteController.text,
                              issueDate: _issueDate,
                              description: _descriptionController.text,
                            );
                            List<Award>? awards = userModel.awards?.toList();
                            if (widget.args.isAdd) {
                              awards ??= [];
                              awards.add(award);
                            } else {
                              awards?[widget.args.editIndex!] = award;
                            }
                            userModel = userModel.copyWith(awards: awards);
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
