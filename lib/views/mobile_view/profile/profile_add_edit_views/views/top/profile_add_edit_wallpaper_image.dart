import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/user/export.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/widgets/profile_add_edit_app_bar_mwidget.dart';
import 'package:provider/provider.dart';

class ProfileAddEditWallpaperImageMView extends StatefulWidget {
  final ProfileMViewArgs args;

  const ProfileAddEditWallpaperImageMView({super.key, required this.args});

  @override
  State<ProfileAddEditWallpaperImageMView> createState() =>
      _ProfileAddEditWallpaperImageMViewState();
}

class _ProfileAddEditWallpaperImageMViewState
    extends State<ProfileAddEditWallpaperImageMView> {
  bool _hasPickedImage = false;
  late ProfileNotifier _profileNotifier;
  Uint8List? _pickedProfileWallpaper;
  String? _encodedWallpaper;

  Future<CroppedFile?> _pickImage() async {
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
    // return file;
    final wallppr = await _cropImage(file?.path);
    return wallppr;
  }

  Future<void> _onSubmit() async {
    if (_encodedWallpaper?.isNotEmpty ?? false) {
      appLoadingMPopup(context);
      await _profileNotifier.uploadWallpaper(base64File: _encodedWallpaper!);
    }
    UserModel? userModel = _profileNotifier.userProfile;

    if (userModel != null) {
      await _profileNotifier.saveProfile(userModel).then((value) {
        Navigator.pop(context);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sizedBoxWithHeight(36),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ProfileAddEditAppBarMWidget(
                  showAddEditPreText: (widget.args.isCurrentUser ?? false),
                  isAdd: false,
                  title: 'Wallpaper',
                ),
              ),
              sizedBoxWithHeight(80),
              if (widget.args.isCurrentUser ?? false) ...{
                SizedBox(
                  width: double.maxFinite,
                  height: 264.h,
                  child: _pickedProfileWallpaper != null
                      ? Image.memory(
                          _pickedProfileWallpaper!,
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
                          imageUrl: _profileNotifier
                                  .userProfile?.profileWallpaperUrl ??
                              AppAssets.nDefaultWallpaper,
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
              } else ...{
                SizedBox(
                  width: double.maxFinite,
                  height: 264.h,
                  child: CachedNetworkImage(
                    imageUrl: widget.args.profile?.profileWallpaperUrl ??
                        AppAssets.nDefaultWallpaper,
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
              },
              sizedBoxWithHeight(40),
              if (widget.args.isCurrentUser ?? false) ...{
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomButton(
                    text: _hasPickedImage ? 'Save' : 'Upload Image',
                    onPressed: () async {
                      if (_hasPickedImage) {
                        await _onSubmit().then((value) {
                          _hasPickedImage = false;
                          Navigator.pop(context);
                        });
                      } else {
                        var mimeType;
                        // XFile? file = await _pickImage();
                        final file = await _pickImage();

                        if (file != null && kIsWeb.not) {
                          mimeType = lookupMimeType(file.path);
                        }
                        // else {
                        //   mimeType = file?.mimeType;
                        // }
                        _pickedProfileWallpaper = await file?.readAsBytes();
                        List<int>? baseNonEncoded = _pickedProfileWallpaper;
                        final baseEncoded =
                            'data:$mimeType;base64,${base64Encode(baseNonEncoded ?? [])}';
                        _encodedWallpaper = baseEncoded;
                        _hasPickedImage = true;
                        setState(() {});
                      }
                    },
                  ),
                ),
              },
            ],
          ),
        ),
      ),
    );
  }
}

Future<CroppedFile?> _cropImage(filePath) async {
  // Implement crop functionality here

  final croppedImage = await ImageCropper().cropImage(
    sourcePath: filePath,
    maxWidth: 1080,
    maxHeight: 1080,
    // aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      // CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ],
    uiSettings: [
      IOSUiSettings(
        title: 'Edit Image',
      ),
      AndroidUiSettings(
        toolbarTitle: 'Edit Image',
        // toolbarColor: AppColors.novaDarkIndigo,
        activeControlsWidgetColor: AppColors.novaDarkIndigo,
        statusBarColor: AppColors.novaDarkIndigo,
        toolbarWidgetColor: AppColors.novaDarkIndigo,
        cropFrameColor: AppColors.novaDarkIndigo,
        cropGridColor: AppColors.novaDarkIndigo,
      ),
    ],
  );

  if (croppedImage != null) {
    return croppedImage;
  }
  return croppedImage;
}
