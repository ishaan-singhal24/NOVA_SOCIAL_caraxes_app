import 'dart:convert';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/widgets/profile_add_edit_app_bar_mwidget.dart';
import 'package:uuid/uuid.dart';
import 'package:nova_social/data/constants/app_strings.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/data/models/user/user.dart';
import 'package:nova_social/data/models/user/user_collection/user_collection.dart';
import 'package:nova_social/data/models/user/user_collection/user_collection_item.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

class AddEditUserCollectionItemMView extends StatefulWidget {
  final AddEditCollectionItemMViewArgs args;
  const AddEditUserCollectionItemMView({
    super.key,
    required this.args,
  });

  @override
  State<AddEditUserCollectionItemMView> createState() =>
      _AddEditUserCollectionItemMViewState();
}

class _AddEditUserCollectionItemMViewState
    extends State<AddEditUserCollectionItemMView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _websiteLinkController = TextEditingController();
  final TextEditingController _inAssociationWithController =
      TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;
  String? encodedThumbnail;
  String? thumbnailUrl;

  ProfileNotifier? _profileNotifier;

  final _collectionItemFormKey = GlobalKey<FormState>();

  void initialDataPop() {
    _nameController.text = widget.args.editCollectionItem?.name ?? '';
    _websiteLinkController.text = widget.args.editCollectionItem?.fileUrl ?? '';
    _inAssociationWithController.text =
        widget.args.editCollectionItem?.tagline ?? '';
    _aboutController.text = widget.args.editCollectionItem?.description ?? '';

    _startDateController.text =
        widget.args.editCollectionItem?.startDate?.abrMMMyyyy ?? '';
    _endDateController.text =
        widget.args.editCollectionItem?.endDate?.abrMMMyyyy ?? '';
    _startDate = widget.args.editCollectionItem?.startDate;
    _endDate = widget.args.editCollectionItem?.endDate;
    thumbnailUrl = widget.args.editCollectionItem?.thumbnailUrl;
  }

  @override
  void initState() {
    super.initState();
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    initialDataPop();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sizedBoxWithHeight(32),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ProfileAddEditAppBarMWidget(
                  title: widget.args.collectionName,
                  isAdd: widget.args.isAdd,
                ),
              ),
              sizedBoxWithHeight(36),
              Form(
                key: _collectionItemFormKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      _AddEditCollectionMThumbnail(
                        thumbnailUrl: thumbnailUrl,
                        onPickImage: (encodedImg) {
                          encodedThumbnail = encodedImg;
                        },
                      ),
                      AppMaterialInputField(
                        label: 'Title',
                        hint: 'Developer',
                        controller: _nameController,
                        isRequired: true,
                        maxLines: 1,
                        textInputAction: TextInputAction.go,
                      ),
                      sizedBoxWithHeight(24),
                      AppMaterialInputField(
                        label: 'One Liner',
                        hint:
                            'Brief one line that explains your ${widget.args.collectionName}',
                        controller: _inAssociationWithController,
                        isRequired: false,
                        maxLines: 1,
                        textInputAction: TextInputAction.go,
                      ),
                      sizedBoxWithHeight(24),
                      AppMaterialInputField(
                        label: 'Link',
                        hint: 'https://xyz.com',
                        controller: _websiteLinkController,
                        isRequired: true,
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
                              },
                            ),
                          ),
                        ],
                      ),
                      sizedBoxWithHeight(24),
                      AppMaterialInputField(
                        label: AppStrings.description,
                        hint: 'You can share your experience here..',
                        controller: _aboutController,
                        maxLength: 2400,
                        maxLines: 6,
                        isRequired: false,
                        inputStyle: AppTextStyles.text14w400,
                      ),
                      sizedBoxWithHeight(24),
                      CustomButton(
                        height: 48.h,
                        width: ScreenUtil.instance.screenWidth - 48.w,
                        onPressed: () async {
                          if (_collectionItemFormKey.currentState
                                  ?.validate()
                                  .not ??
                              true) {
                            return;
                          }
                          appLoadingMPopup(context);

                          if (encodedThumbnail?.isNotEmpty ?? false) {
                            thumbnailUrl = await _profileNotifier
                                ?.uploadCollectionItemThumbnail(
                                    base64File: encodedThumbnail!);
                          }
                          UserCollectionItem collectionItem =
                              UserCollectionItem(
                            name: _nameController.text,
                            tagline: _inAssociationWithController.text,
                            description: _aboutController.text,
                            startDate: _startDate,
                            endDate: _endDate,
                            fileUrl: _websiteLinkController.text,
                            thumbnailUrl: thumbnailUrl,
                          );

                          UserModel userModel = _profileNotifier!.userProfile!;
                          List<UserCollection>? collections =
                              userModel.collections?.toList() ?? [];
                          UserCollection? collection =
                              collections[widget.args.collectionIndex ?? -1];

                          List<UserCollectionItem>? collectionItems =
                              collection.item ?? [];
                          if (widget.args.isAdd) {
                            collectionItem = collectionItem.copyWith(
                              id: const Uuid().v1(),
                            );
                            collectionItems.add(collectionItem);
                          } else {
                            collectionItems[widget.args.editIndex!] =
                                collectionItem;
                          }
                          collection = collection.copyWith(
                            item: collectionItems,
                          );
                          collections[widget.args.collectionIndex ?? -1] =
                              collection;
                          userModel =
                              userModel.copyWith(collections: collections);
                          _profileNotifier
                              ?.saveProfile(userModel)
                              .then((value) {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          });
                        },
                        text: widget.args.isAdd
                            ? AppStrings.add
                            : AppStrings.saveChanges,
                      ),
                      sizedBoxWithHeight(24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddEditCollectionMThumbnail extends StatefulWidget {
  final Function(String) onPickImage;
  final String? thumbnailUrl;
  const _AddEditCollectionMThumbnail({
    required this.onPickImage,
    this.thumbnailUrl,
  });

  @override
  State<_AddEditCollectionMThumbnail> createState() =>
      __AddEditCollectionMThumbnailState();
}

class __AddEditCollectionMThumbnailState
    extends State<_AddEditCollectionMThumbnail> {
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
              child: Stack(
                children: [
                  Container(
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
                  Positioned(
                    bottom: 8.h,
                    child: SizedBox(
                      width: ScreenUtil.instance.screenWidth - 48.w,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: AppTextStyles.text20w400,
                          ),
                          sizedBoxWithWidth(16),
                          AppIconButton(
                            icon: Icons.edit,
                            onTap: () {
                              onPick();
                            },
                            color: AppColors.novaWhite,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            sizedBoxWithHeight(24),
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
          title: 'Cover Image',
          imageUrl: widget.thumbnailUrl,
          onPick: () async {
            var mimeType;
            XFile? file = await _pickImage();
            if (file != null && kIsWeb.not) {
              mimeType = lookupMimeType(file.path);
            } else {
              mimeType = file?.mimeType;
            }
            _pickedProfilePic = await file?.readAsBytes();
            List<int>? baseNonEncoded = _pickedProfilePic;
            final baseEncoded =
                'data:$mimeType;base64,${base64Encode(baseNonEncoded ?? [])}';
            widget.onPickImage(baseEncoded);
            setState(() {});
          },
          imageBytes: _pickedProfilePic,
        ),
      ],
    );
  }
}
