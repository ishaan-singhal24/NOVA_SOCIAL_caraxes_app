import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';
import 'package:mime/mime.dart';

import '../../widgets/profile_add_edit_app_bar_mwidget.dart';

class ProfileAddEditIntroMView extends StatefulWidget {
  final bool isAdd;
  const ProfileAddEditIntroMView({
    super.key,
    required this.isAdd,
  });

  @override
  State<ProfileAddEditIntroMView> createState() =>
      _ProfileAddEditIntroMViewState();
}

class _ProfileAddEditIntroMViewState extends State<ProfileAddEditIntroMView> {
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    sizedBoxWithHeight(36),
                    ProfileAddEditAppBarMWidget(
                      isAdd: widget.isAdd,
                      title: AppStrings.profile,
                    ),
                    sizedBoxWithHeight(36),
                    _ProfileDetailsPage(
                      isAdd: widget.isAdd,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileDetailsPage extends StatefulWidget {
  final bool isAdd;
  const _ProfileDetailsPage({
    super.key,
    required this.isAdd,
  });

  @override
  State<_ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<_ProfileDetailsPage> {
  final _introFormKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _taglineController = TextEditingController();

  ProfileNotifier? _profileNotifier;

  String? _encodedProfile;
  String? _encodedWallpaper;

  UserLocation? _location;

  @override
  void initState() {
    super.initState();
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // appLoadingMPopup(context);
      populateData().then((v) {
        // Navigator.pop(context);
      });
    });
  }

  Future<void> populateData() async {
    await _profileNotifier?.fetchGlobalCities();
    _fullNameController.text = _profileNotifier?.userProfile?.name ?? '';
    _location = _profileNotifier?.userProfile?.location;
    _locationController.text = _location?.concatinated ?? '';
    _taglineController.text = _profileNotifier?.userProfile?.tagline ?? '';
    setState(() {});
  }

  Future<void> locationSubmit() async {
    if (_location == null) {
      final locationText = _locationController.text;
      final foundIndex = _profileNotifier?.globalCities
              ?.indexWhere((e) => e.concatinated == locationText) ??
          -1;
      if (foundIndex > -1) {
        _location = _profileNotifier?.globalCities?[foundIndex];
      } else {
        final locationData = locationText.split(',').cast<String?>();
        _location = UserLocation();
        if (locationData.isNotEmpty) {
          if (locationData.length >= 3) {
            _location = _location?.copyWith(country: locationData[2]);
          }
          if (locationData.length >= 2) {
            _location = _location?.copyWith(state: locationData[1]);
          }
          _location = _location?.copyWith(city: locationData[0]);
        }
        const uuid = Uuid();
        _location = _location?.copyWith(
          concatinated: locationText,
          id: uuid.v4(),
        );
      }
      await _profileNotifier?.addGlobalCity(_location!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _introFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///IMAGE EDIT
          // _ProfileEditImageMWidget(
          //   onPickProfile: (String encodedImage) {
          //     _encodedProfile = encodedImage;
          //   },
          //   onPickWallpaper: (String encodedImage) {
          //     _encodedWallpaper = encodedImage;
          //   },
          // ),
          /// NAME EDIT
          sizedBoxWithHeight(24),
          AppMaterialInputField(
            label: 'Name',
            hint: 'John Dou',
            controller: _fullNameController,
            maxLines: 1,
            isRequired: true,
          ),
          sizedBoxWithHeight(24),
          Consumer<ProfileNotifier>(
            builder: (context, noti, child) {
              return AppMaterialAutofillInputField(
                label: 'Location',
                hint: 'Indore, India',
                controller: _locationController,
                maxLines: 1,
                isRequired: true,
                suggestions: noti.globalCities?.map((e) {
                  return SuggestionInputModel(
                    id: e.id,
                    name: e.concatinated,
                  );
                }).toList(),
                onChanged: (s) {
                  _location = null;
                },
                onSuggestionSelected: (s) {
                  _location =
                      noti.globalCities?.cast<UserLocation?>().firstWhere(
                            (element) => element?.id == s.id,
                            orElse: () => null,
                          );
                },
                textInputAction: TextInputAction.go,
              );
            },
          ),
          sizedBoxWithHeight(24),
          AppMaterialInputField(
            label: 'One Line',
            hint: 'Describe yourself in one line',
            controller: _taglineController,
            maxLines: 1,
            isRequired: false,
          ),
          sizedBoxWithHeight(24),
          CustomButton(
            height: 48.h,
            width: ScreenUtil.instance.screenWidth - 48.w,
            onPressed: () async {
              if (_introFormKey.currentState?.validate() ?? false) {
                appLoadingMPopup(context);

                if (_encodedProfile?.isNotEmpty ?? false) {
                  await _profileNotifier?.uploadProfilePicture(
                      base64File: _encodedProfile!);
                }
                if (_encodedWallpaper?.isNotEmpty ?? false) {
                  await _profileNotifier?.uploadWallpaper(
                      base64File: _encodedWallpaper!);
                }
                await locationSubmit();
                UserModel? userModel = _profileNotifier?.userProfile;
                userModel = userModel?.copyWith(
                  name: _fullNameController.text,
                  tagline: _taglineController.text,
                  location: _location,
                );
                await _profileNotifier?.saveProfile(userModel!).then((value) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                });
              }
            },
            text: widget.isAdd ? AppStrings.add : AppStrings.saveChanges,
          ),
          sizedBoxWithHeight(24),
        ],
      ),
    );
  }
}

class _ProfileEditImageMWidget extends StatefulWidget {
  final Function(String) onPickProfile;
  final Function(String) onPickWallpaper;
  const _ProfileEditImageMWidget({
    super.key,
    required this.onPickProfile,
    required this.onPickWallpaper,
  });

  @override
  State<_ProfileEditImageMWidget> createState() =>
      __ProfileEditImageMWidgetState();
}

class __ProfileEditImageMWidgetState extends State<_ProfileEditImageMWidget> {
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

  Widget _buildProfileImageTile({
    required String title,
    String? imageUrl,
    required Function() onPick,
    Uint8List? imageBytes,
  }) {
    return Stack(
      children: [
        imageBytes != null
            ? Center(
                child: Container(
                  height: 120.h,
                  width: 120.w,
                  padding: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: Image.memory(
                        imageBytes,
                        width: double.maxFinite,
                        height: double.maxFinite,
                        fit: BoxFit.contain,
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
                      ).image,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              )
            : Center(
                child: AppUserProfileCircle(
                  borderEnabled: false,
                  radius: 64.r,
                  imageUrl: imageUrl ?? AppAssets.nSampleUserProfilePic,
                  errorText: 'NA',
                ),
              ),
        Positioned(
          bottom: 8.h,
          left: (ScreenUtil.instance.screenWidth - 48.w - 24.r) / 2,
          child: AppIconButton(
            icon: Icons.edit_outlined,
            onTap: () {
              onPick();
            },
            color: AppColors.novaWhite,
          ),
        ),
      ],
    );
  }

  Widget _buildCoverImageTile({
    required String title,
    String? imageUrl,
    required Function() onPick,
    Uint8List? imageBytes,
  }) {
    return Stack(
      children: [
        Container(
          height: 180.h,
          padding: EdgeInsets.all(2.r),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
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
                    imageUrl: imageUrl ?? AppAssets.nSampleUserProfilePic,
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
        Positioned(
          bottom: 8.h,
          child: SizedBox(
            width: ScreenUtil.instance.screenWidth - 48.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyles.text20w400,
                ),
                sizedBoxWithWidth(16),
                AppIconButton(
                  icon: Icons.edit_outlined,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileNotifier =
        Provider.of<ProfileNotifier>(context, listen: false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildCoverImageTile(
          title: 'Cover Picture',
          imageUrl: profileNotifier.userProfile?.profileWallpaperUrl,
          onPick: () async {
            var mimeType;
            XFile? file = await _pickImage();
            if (file != null && kIsWeb.not) {
              mimeType = lookupMimeType(file.path);
            } else {
              mimeType = file?.mimeType;
            }
            _pickedProfileWallpaper = await file?.readAsBytes();
            List<int>? baseNonEncoded = _pickedProfileWallpaper;
            final baseEncoded =
                'data:$mimeType;base64,${base64Encode(baseNonEncoded ?? [])}';
            widget.onPickWallpaper(baseEncoded);
            setState(() {});
          },
          imageBytes: _pickedProfileWallpaper,
        ),
        sizedBoxWithHeight(24),
        _buildProfileImageTile(
          title: 'Profile Image',
          imageUrl: profileNotifier.userProfile?.profilePictureUrl,
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
            widget.onPickProfile(baseEncoded);
            setState(() {});
          },
          imageBytes: _pickedProfilePic,
        ),
      ],
    );
  }
}
