import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/widgets/profile_add_edit_app_bar_mwidget.dart';
import 'package:provider/provider.dart';

class ProfileAddEditCollectionMPopup extends StatefulWidget {
  final bool isAdd;
  final int? editingIndex;
  final String? isSuggestedId;
  final String? isSuggestedName;
  const ProfileAddEditCollectionMPopup({
    Key? key,
    this.isAdd = true,
    this.editingIndex,
    this.isSuggestedId,
    this.isSuggestedName,
  }) : super(key: key);

  @override
  State<ProfileAddEditCollectionMPopup> createState() =>
      _ProfileAddEditCollectionMPopupState();
}

class _ProfileAddEditCollectionMPopupState
    extends State<ProfileAddEditCollectionMPopup> {
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
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: AppColors.novaIndigo.withOpacity(0.5),
        child: FittedBox(
          child: Container(
            width: ScreenUtil.instance.screenWidth * 0.9,
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
                  sizedBoxWithHeight(32),
                  ProfileAddEditAppBarMWidget(
                    title: AppStrings.collections,
                    isAdd: widget.isAdd,
                  ),
                  sizedBoxWithHeight(24),
                  AppMaterialInputField(
                    label: 'Collection Name',
                    hint: 'My Projects',
                    controller: _nameController,
                    maxLines: 1,
                    isRequired: true,
                  ),
                  sizedBoxWithHeight(24),
                  AppMaterialInputField(
                    label: 'Tagline',
                    hint: 'Here\'s what I\'ve done so far..',
                    controller: _taglineController,
                    maxLines: 1,
                    isRequired: false,
                  ),
                  sizedBoxWithHeight(24),
                  CustomButton(
                    onPressed: () {
                      appLoadingMPopup(context);
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
                        Navigator.pop(context);
                      });
                    },
                    text:
                        widget.isAdd ? AppStrings.add : AppStrings.saveChanges,
                  ),
                  sizedBoxWithHeight(48),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
