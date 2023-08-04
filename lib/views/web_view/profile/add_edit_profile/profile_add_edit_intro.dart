import 'dart:convert';
// import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/widgets/widgets.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:provider/provider.dart';

class ProfileAddEditIntro extends StatefulWidget {
  final bool isAdd;
  const ProfileAddEditIntro({Key? key, this.isAdd = true}) : super(key: key);

  @override
  State<ProfileAddEditIntro> createState() => _ProfileAddEditIntroState();
}

class _ProfileAddEditIntroState extends State<ProfileAddEditIntro> {
  final _introFormKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _taglineController = TextEditingController();

  ProfileNotifier? _profileNotifier;

  String? _encodedProfile;
  String? _encodedWallpaper;

  @override
  void initState() {
    super.initState();
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    _fullNameController.text = _profileNotifier?.userProfile?.name ?? '';
    _taglineController.text = _profileNotifier?.userProfile?.tagline ?? '';
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
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ThemeHandler.backgroundColor(),
              boxShadow: const [
                BoxShadow(),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(16.r),
            child: Form(
              key: _introFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AddEditTopBarWidget(
                    title: 'Intro',
                    isAdd: widget.isAdd,
                  ),
                  sizedBoxWithHeight(16),
                  // UserImagePicker(
                  //   imagePickFn: _pickedImage,
                  //   imageUrl: _profileNotifier?.userProfile?.profilePictureUrl,
                  // ),
                  EditImageWidget(
                    onPickProfile: (String encodedImage) {
                      _encodedProfile = encodedImage;
                    },
                    onPickWallpaper: (String encodedImage) {
                      _encodedWallpaper = encodedImage;
                    },
                  ),
                  sizedBoxWithHeight(16),
                  AppMaterialInputField(
                    label: 'Name',
                    hint: 'John Dou',
                    controller: _fullNameController,
                    maxLines: 1,
                    isRequired: true,
                  ),
                  sizedBoxWithHeight(16),
                  AppMaterialInputField(
                    label: AppStrings.tagline,
                    hint: 'Describe yourself in one line',
                    controller: _taglineController,
                    maxLines: 1,
                    isRequired: false,
                  ),
                  sizedBoxWithHeight(24),
                  CustomButton(
                    onPressed: () async {
                      if (_introFormKey.currentState?.validate() ?? false) {
                        appLoadingPopup(context);
                        if (_encodedProfile?.isNotEmpty ?? false) {
                          await _profileNotifier?.uploadProfilePicture(
                              base64File: _encodedProfile!);
                        }
                        if (_encodedWallpaper?.isNotEmpty ?? false) {
                          await _profileNotifier?.uploadWallpaper(
                              base64File: _encodedWallpaper!);
                        }
                        UserModel? userModel = _profileNotifier?.userProfile;
                        userModel = userModel?.copyWith(
                          name: _fullNameController.text,
                          tagline: _taglineController.text,
                        );
                        await _profileNotifier
                            ?.saveProfile(userModel!)
                            .then((value) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        });
                      }
                    },
                    text:
                        widget.isAdd ? AppStrings.add : AppStrings.saveChanges,
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

class EditImageWidget extends StatefulWidget {
  final Function(String) onPickProfile;
  final Function(String) onPickWallpaper;
  const EditImageWidget({
    super.key,
    required this.onPickProfile,
    required this.onPickWallpaper,
  });

  @override
  State<EditImageWidget> createState() => _EditImageWidgetState();
}

class _EditImageWidgetState extends State<EditImageWidget> {
  Uint8List? _pickedProfilePic;
  Uint8List? _pickedProfileWallpaper;

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
            Container(
              height: 180.h,
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
                          color: AppColors.novaPurple,
                          width: double.maxFinite,
                          height: double.maxFinite,
                          alignment: Alignment.center,
                          child: Text(
                            'NA',
                            style: AppTextStyles.text28w400.white,
                          ),
                        ),
                      )
                    : CachedNetworkImage(
                        imageUrl: imageUrl ?? AppAssets.sampleUserProfilePic,
                        width: double.maxFinite,
                        height: double.maxFinite,
                        fit: BoxFit.cover,
                        errorWidget: (context, err, v) => Container(
                          color: AppColors.novaPurple,
                          width: double.maxFinite,
                          height: double.maxFinite,
                          alignment: Alignment.center,
                          child: Text(
                            'NA',
                            style: AppTextStyles.text28w400.white,
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
    final profileNotifier =
        Provider.of<ProfileNotifier>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildImageTiles(
          flex: 30,
          title: 'Profile Picture',
          imageUrl: profileNotifier.userProfile?.profilePictureUrl,
          onPick: () async {
            XFile? file = await _pickImage();
            _pickedProfilePic = await file?.readAsBytes();
            List<int>? baseNonEncoded = _pickedProfilePic;
            final baseEncoded =
                'data:${file?.mimeType};base64,${base64Encode(baseNonEncoded ?? [])}';
            widget.onPickProfile(baseEncoded);
            setState(() {});
          },
          imageBytes: _pickedProfilePic,
        ),
        _buildImageTiles(
          flex: 70,
          title: 'Cover Picture',
          imageUrl: profileNotifier.userProfile?.profileWallpaperUrl,
          onPick: () async {
            XFile? file = await _pickImage();
            _pickedProfileWallpaper = await file?.readAsBytes();
            List<int>? baseNonEncoded = _pickedProfileWallpaper;
            final baseEncoded =
                'data:${file?.mimeType};base64,${base64Encode(baseNonEncoded ?? [])}';
            widget.onPickWallpaper(baseEncoded);
            setState(() {});
          },
          imageBytes: _pickedProfileWallpaper,
        ),
      ],
    );
  }
}
