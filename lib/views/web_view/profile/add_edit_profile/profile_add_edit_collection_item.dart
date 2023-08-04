import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
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

class ProfileAddEditCollectionItem extends StatefulWidget {
  final bool isAdd;
  final int? editingIndex;
  final int? collectionIndex;
  const ProfileAddEditCollectionItem({
    Key? key,
    this.isAdd = true,
    this.editingIndex,
    this.collectionIndex,
  }) : super(key: key);

  @override
  State<ProfileAddEditCollectionItem> createState() =>
      _ProfileAddEditCollectionItemState();
}

class _ProfileAddEditCollectionItemState
    extends State<ProfileAddEditCollectionItem> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _websiteLinkController = TextEditingController();
  final TextEditingController _inAssociationWithController =
      TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;
  String? encodedThumbnail;
  String? thumbnailUrl;

  ProfileNotifier? _profileNotifier;

  final _collectionItemFormKey = GlobalKey<FormState>();

  void initialDataPop() {
    final collections = _profileNotifier?.userProfile?.collections?.toList();
    _nameController.text = widget.isAdd
        ? ''
        : collections?[widget.collectionIndex!]
                .item?[widget.editingIndex!]
                .name ??
            '';
    _websiteLinkController.text = widget.isAdd
        ? ''
        : collections?[widget.collectionIndex!]
                .item?[widget.editingIndex!]
                .fileUrl ??
            '';
    _inAssociationWithController.text = widget.isAdd
        ? ''
        : collections?[widget.collectionIndex!]
                .item?[widget.editingIndex!]
                .tagline ??
            '';
    _aboutController.text = widget.isAdd
        ? ''
        : collections?[widget.collectionIndex!]
                .item?[widget.editingIndex!]
                .description ??
            '';

    _startDateController.text = widget.isAdd
        ? ''
        : collections?[widget.collectionIndex!]
                .item?[widget.editingIndex!]
                .startDate
                ?.abrMMMyyyy ??
            '';
    _endDateController.text = widget.isAdd
        ? ''
        : collections?[widget.collectionIndex!]
                .item?[widget.editingIndex!]
                .endDate
                ?.abrMMMyyyy ??
            '';
    startDate = widget.isAdd
        ? null
        : collections?[widget.collectionIndex!]
            .item?[widget.editingIndex!]
            .startDate;
    endDate = widget.isAdd
        ? null
        : collections?[widget.collectionIndex!]
            .item?[widget.editingIndex!]
            .endDate;
    thumbnailUrl = widget.isAdd
        ? null
        : collections?[widget.collectionIndex!]
            .item?[widget.editingIndex!]
            .thumbnailUrl;
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
              key: _collectionItemFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AddEditTopBarWidget(
                    title: 'Collection Item',
                    isAdd: widget.isAdd,
                    onDelete: () async {
                      if (widget.isAdd) {
                        return;
                      }
                      UserModel userModel = _profileNotifier!.userProfile!;
                      List<UserCollection>? collections =
                          userModel.collections?.toList() ?? [];
                      await showAlertDialog(
                        context: context,
                        txtContent: AppStrings.deleteContent,
                        textBtn1: AppStrings.cancelBtnTxt,
                        txtBtn2: AppStrings.deleteBtnTxt,
                        onBtn1: () => Navigator.of(context).pop(),
                        onBtn2: () async {
                          if (widget.editingIndex != null &&
                              widget.collectionIndex != null) {
                            appLoadingPopup(context);
                            UserCollection? collection =
                                collections[widget.collectionIndex!];
                            List<UserCollectionItem>? items =
                                collection.item?.toList() ?? [];
                            items.removeAt(widget.editingIndex!);
                            collection = collection.copyWith(item: items);
                            collections[widget.collectionIndex!] = collection;
                          }
                          userModel = userModel.copyWith(
                            collections: collections,
                          );
                          await _profileNotifier
                              ?.saveProfile(userModel)
                              .then((value) {
                            Navigator.pop(context);
                          }).then((value) {
                            Navigator.pop(context);
                          });
                        },
                      ).then((value) {
                        Navigator.pop(context);
                      });
                    },
                  ),
                  sizedBoxWithHeight(16),
                  const AddEditMessageBar(
                    message: 'You can show your collection here!',
                  ),
                  sizedBoxWithHeight(16),
                  AppMaterialInputField(
                    label: 'Title',
                    hint: 'Designing NovaHQ App',
                    controller: _nameController,
                    maxLines: 1,
                    isRequired: true,
                  ),
                  sizedBoxWithHeight(16),
                  Row(
                    children: [
                      Expanded(
                        child: AppMaterialInputField(
                          label: 'Related Link',
                          hint: 'http://milindagates.org',
                          controller: _websiteLinkController,
                          maxLines: 1,
                          isRequired: true,
                          isLinkTypeInput: true,
                        ),
                      ),
                      sizedBoxWithWidth(80),
                      Expanded(
                        child: AppMaterialInputField(
                          label: 'Subtitle',
                          hint: 'Add a one line subtitle here...',
                          controller: _inAssociationWithController,
                          maxLines: 1,
                          isRequired: false,
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
                        child: AppMaterialInputField(
                          label: AppStrings.startDate,
                          hint: AppStrings.select,
                          controller: _startDateController,
                          isRequired: false,
                          suffixIcon: Icon(
                            Icons.calendar_month,
                            color: ThemeHandler.novaMutedColor(),
                          ),
                          firstLastDate: [DateTime(1922), DateTime.now()],
                          dateTimeCallBack: (d) {
                            startDate = d;
                          },
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
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                  sizedBoxWithHeight(16),
                  AppMaterialInputField(
                    label: AppStrings.aboutTheWork,
                    hint: 'You can share anything related to your work here..',
                    controller: _aboutController,
                    maxLength: 2400,
                    maxLines: null,
                    isRequired: false,
                    inputStyle: AppTextStyles.text14w400,
                  ),
                  sizedBoxWithHeight(16),
                  _AddEditCollectionThumnail(
                    thumbnailUrl: thumbnailUrl,
                    onPickImage: (encodedImg) {
                      encodedThumbnail = encodedImg;
                    },
                  ),
                  sizedBoxWithHeight(16),
                  CustomButton(
                    onPressed: () async {
                      if (_collectionItemFormKey.currentState?.validate().not ??
                          true) {
                        return;
                      }
                      appLoadingPopup(context);

                      if (encodedThumbnail?.isNotEmpty ?? false) {
                        thumbnailUrl = await _profileNotifier
                            ?.uploadCollectionItemThumbnail(
                                base64File: encodedThumbnail!);
                      }
                      UserCollectionItem collectionItem = UserCollectionItem(
                        name: _nameController.text,
                        tagline: _inAssociationWithController.text,
                        description: _aboutController.text,
                        startDate: startDate,
                        endDate: endDate,
                        fileUrl: _websiteLinkController.text,
                        thumbnailUrl: thumbnailUrl,
                      );

                      UserModel userModel = _profileNotifier!.userProfile!;
                      List<UserCollection>? collections =
                          userModel.collections?.toList() ?? [];
                      UserCollection? collection =
                          collections[widget.collectionIndex ?? -1];

                      List<UserCollectionItem>? collectionItems =
                          collection.item ?? [];
                      if (widget.isAdd) {
                        collectionItem = collectionItem.copyWith(
                          id: const Uuid().v1(),
                        );
                        collectionItems.add(collectionItem);
                      } else {
                        collectionItems[widget.editingIndex!] = collectionItem;
                      }
                      collection = collection.copyWith(
                        item: collectionItems,
                      );
                      collections[widget.collectionIndex ?? -1] = collection;
                      userModel = userModel.copyWith(collections: collections);
                      _profileNotifier?.saveProfile(userModel).then((value) {
                        Navigator.pop(context);
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

class _AddEditCollectionThumnail extends StatefulWidget {
  final Function(String) onPickImage;
  final String? thumbnailUrl;
  const _AddEditCollectionThumnail({
    required this.onPickImage,
    this.thumbnailUrl,
  });

  @override
  State<_AddEditCollectionThumnail> createState() =>
      __AddEditCollectionThumnailState();
}

class __AddEditCollectionThumnailState
    extends State<_AddEditCollectionThumnail> {
  Uint8List? _pickedProfilePic;

  Future<XFile?> _pickImage() async {
    XFile? file;
    try {
      file = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
    } on PlatformException catch (e) {
      Logger.logError(e, 'Unsupported operation');
    } catch (e) {
      Logger.logError(e, '');
    }
    return file;
  }

  Widget _buildImageTiles({
    required int flex,
    required String title,
    String? imageUrl,
    required Function() onPick,
    Uint8List? imageBytes,
  }) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: EdgeInsets.only(
          right: 8.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                onPick();
              },
              child: Container(
                height: 120.h,
                padding: EdgeInsets.all(2.r),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: imageBytes != null
                      ? Image.memory(
                          imageBytes,
                          width: double.maxFinite,
                          height: double.maxFinite,
                          fit: BoxFit.cover,
                          errorBuilder: (context, err, v) => Container(
                            color: AppColors.novaIndigo,
                            width: double.maxFinite,
                            height: double.maxFinite,
                            alignment: Alignment.center,
                            child: Text(
                              'Please upload a thumbnail image here',
                              style: AppTextStyles.text16w400.white,
                            ),
                          ),
                        )
                      : CachedNetworkImage(
                          imageUrl: imageUrl ?? '',
                          width: double.maxFinite,
                          height: double.maxFinite,
                          fit: BoxFit.cover,
                          errorWidget: (context, err, v) => Container(
                            color: AppColors.novaIndigo,
                            width: double.maxFinite,
                            height: double.maxFinite,
                            alignment: Alignment.center,
                            child: Text(
                              'Please upload a thumbnail image here',
                              style: AppTextStyles.text16w400.white,
                            ),
                          ),
                        ),
                ),
              ),
            ),
            sizedBoxWithHeight(16),
            Row(
              children: [
                Text(
                  title,
                  style: AppTextStyles.text20w400.novaMuted,
                ),
                sizedBoxWithWidth(16),
                AppIconButton(
                  icon: Icons.edit,
                  onTap: () {
                    onPick();
                  },
                  color: AppColors.novaDarkMuted,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildImageTiles(
          flex: 100,
          title: 'Collection Item Picture',
          imageUrl: widget.thumbnailUrl,
          onPick: () async {
            XFile? file = await _pickImage();
            _pickedProfilePic = await file?.readAsBytes();
            List<int>? baseNonEncoded = _pickedProfilePic;
            final baseEncoded =
                'data:${file?.mimeType};base64,${base64Encode(baseNonEncoded ?? [])}';
            widget.onPickImage(baseEncoded);
            setState(() {});
          },
          imageBytes: _pickedProfilePic,
        ),
      ],
    );
  }
}
