import 'dart:ui';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/app_alert_dialog.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/widgets/widgets.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:provider/provider.dart';

class ProfileAddEditCollection extends StatefulWidget {
  final bool isAdd;
  final int? editingIndex;
  final String? isSuggestedId;
  final String? isSuggestedName;
  const ProfileAddEditCollection({
    Key? key,
    this.isAdd = true,
    this.editingIndex,
    this.isSuggestedId,
    this.isSuggestedName,
  }) : super(key: key);

  @override
  State<ProfileAddEditCollection> createState() =>
      _ProfileAddEditCollectionState();
}

class _ProfileAddEditCollectionState extends State<ProfileAddEditCollection> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _taglineController = TextEditingController();

  final _collectionFormKey = GlobalKey<FormState>();

  ProfileNotifier? _profileNotifier;

  void initialDataPop() {
    final collections = _profileNotifier?.userProfile?.collections?.toList();
    _nameController.text = widget.isAdd
        ? (widget.isSuggestedName ?? '')
        : collections?[widget.editingIndex!].name ?? '';
    _taglineController.text =
        widget.isAdd ? '' : collections?[widget.editingIndex!].tagline ?? '';
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
              key: _collectionFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AddEditTopBarWidget(
                    title: AppStrings.collections,
                    isAdd: widget.isAdd,
                    // onDelete: () {
                    //   if (widget.isAdd.not) {
                    //     UserModel userModel = _profileNotifier!.userProfile!;
                    //     List<UserCollection>? collections =
                    //         userModel.collections?.toList();
                    //     showAlertDialog(
                    //       context: context,
                    //       txtContent: AppStrings.deleteContent,
                    //       textBtn1: AppStrings.cancelBtnTxt,
                    //       txtBtn2: AppStrings.deleteBtnTxt,
                    //       onBtn1: () => Navigator.of(context).pop(),
                    //       onBtn2: () {

                    //       },
                    //     );
                    //   }
                    // },
                  ),
                  sizedBoxWithHeight(16),
                  AddEditMessageBar(
                    message: AppStrings.addCollectionMessage,
                  ),
                  sizedBoxWithHeight(16),
                  AppMaterialInputField(
                    label: AppStrings.addCollectionName,
                    hint: AppStrings.addCollectionName,
                    controller: _nameController,
                    maxLines: 1,
                    isRequired: true,
                  ),
                  sizedBoxWithHeight(16),
                  AppMaterialInputField(
                    label: AppStrings.addCollectionTagline,
                    hint: AppStrings.addCollectionTagline,
                    controller: _taglineController,
                    maxLines: 1,
                    isRequired: false,
                  ),
                  sizedBoxWithHeight(16),
                  CustomButton(
                    onPressed: () {
                      if (_collectionFormKey.currentState?.validate().not ??
                          true) {
                        return;
                      }
                      UserModel userModel = _profileNotifier!.userProfile!;

                      UserCollection collection = UserCollection(
                        name: _nameController.text,
                        tagline: _taglineController.text,
                      );
                      List<UserCollection>? collections =
                          userModel.collections?.toList();
                      if (widget.isAdd) {
                        collections ??= [];
                        collection = collection.copyWith(
                          id: widget.isSuggestedId ?? const Uuid().v1(),
                        );
                        collections.add(collection);
                      } else {
                        collection = collection.copyWith(
                          item: collections?[widget.editingIndex!].item,
                          id: collections?[widget.editingIndex!].id,
                        );
                        collections?[widget.editingIndex!] = collection;
                      }
                      userModel = userModel.copyWith(collections: collections);
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
