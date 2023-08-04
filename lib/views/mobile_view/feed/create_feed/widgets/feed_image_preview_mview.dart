import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:image_cropper/image_cropper.dart';

class FeedImagePreviewMView extends StatefulWidget {
  final Function(List<String>, List<Uint8List?>?) onPickImage;
  const FeedImagePreviewMView({
    super.key,
    required this.onPickImage,
  });

  @override
  FeedImagePreviewMViewState createState() => FeedImagePreviewMViewState();
}

class FeedImagePreviewMViewState extends State<FeedImagePreviewMView> {
  List<XFile?>? files;
  List<Uint8List?>? _pickedPictures;

  List<String?>? mimeTypes;
  List<List<int>?>? baseNonEncoded;

  Future<List<XFile?>?> pickImage() async {
    try {
      files = await ImagePicker().pickMultiImage();
    } on PlatformException catch (e) {
      Logger.logError(e, 'Unsupported operation');
    } catch (e) {
      Logger.logError(e, '');
    }
    return files;
  }

  int _currentImageIndex = 0;

  late final CarouselController _carouselController;

  late List<Future<CroppedFile?>> croppedImg;
  List<String>? baseEncoded;

  void initState() {
    // TODO: implement initState
    super.initState();
    _carouselController = CarouselController();
    populateImages();
  }

  void populateImages() async {
    files = await pickImage();

    if ((files?.isNotEmpty ?? false) && kIsWeb.not) {
      for (int i = 0; i < files!.length; i++) {
        mimeTypes ??= [];
        if (files![i]?.path.isNotEmpty ?? false) {
          mimeTypes?.add(lookupMimeType(files![i]!.path));
        }
        _pickedPictures ??= [];

        _pickedPictures?.add(await files![i]?.readAsBytes());

        baseNonEncoded ??= [];
        baseNonEncoded?.add(_pickedPictures?[i]);
        baseEncoded ??= [];
        baseEncoded?.add(
            'data:${mimeTypes?[i]};base64,${base64Encode((baseNonEncoded?[i] ?? []))}');
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 16.w,
          ),
          child: Column(
            children: [
              sizedBoxWithHeight(24),
              Row(
                children: [
                  AppIconButton(
                    icon: Icons.arrow_back,
                    onTap: () {
                      context.pop();
                    },
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Image Preview',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.text22w500,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onPickImage(baseEncoded!, _pickedPictures);
                      context.pop();
                    },
                    child: Text(
                      'SAVE',
                      style: AppTextStyles.text16w600.indigo,
                    ),
                  ),
                ],
              ),
              sizedBoxWithHeight(56),
              if (_pickedPictures?.isNotEmpty ?? false) ...{
                Container(
                  decoration: BoxDecoration(
                    color: ThemeHandler.mutedPlusColor(nonInverse: false),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 24.h,
                        ),
                        child: CarouselSlider.builder(
                          carouselController: _carouselController,
                          itemCount: _pickedPictures!.length,
                          itemBuilder: (context, index, _) {
                            return _buildImagePreviewTiles(
                              imageBytes: _pickedPictures![index],
                            );
                          },
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            viewportFraction: 1.0,
                            onPageChanged: (index, reason) {
                              _currentImageIndex = index;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                      sizedBoxWithHeight(8),
                      if ((_pickedPictures?.length ?? 0) > 1) ...{
                        SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: SizedBox(
                              width: (_pickedPictures?.length ?? 0) * 16,
                              height: 24.h,
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    sizedBoxWithWidth(4),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return CircleAvatar(
                                    radius:
                                        _currentImageIndex == index ? 6.r : 4.r,
                                    backgroundColor: _currentImageIndex == index
                                        ? AppColors.novaDarkIndigo
                                        : AppColors.novaWhite.withOpacity(0.8),
                                  );
                                },
                                itemCount: (_pickedPictures?.length ?? 0),
                              ),
                            ),
                          ),
                        ),
                      },
                      sizedBoxWithHeight(16),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                        ),
                        child: CustomButton(
                          text: 'Edit Image',
                          onPressed: () async {
                            final imageFile = await _cropImage(
                                files![_currentImageIndex]?.path);
                            if (imageFile != null) {
                              _pickedPictures?[_currentImageIndex] =
                                  await imageFile.readAsBytes();

                              baseNonEncoded ??= [];
                              baseNonEncoded?[_currentImageIndex] =
                                  (_pickedPictures?[_currentImageIndex]);
                              baseEncoded ??= [];
                              baseEncoded?[_currentImageIndex] =
                                  ('data:${mimeTypes?[_currentImageIndex]};base64,${base64Encode((baseNonEncoded?[_currentImageIndex] ?? []))}');
                              setState(() {});
                            }
                          },
                        ),
                      ),
                      sizedBoxWithHeight(24),
                      // CustomButton(
                      //   text: "Done",
                      //   onPressed: () {
                      //     widget.onPickImage(baseEncoded!, _pickedPictures);
                      //     context.pop();
                      //   },
                      // )
                    ],
                  ),
                ),
              },
            ],
          ),
        ),
      ),
    );
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

  Widget _buildImagePreviewTiles({
    Uint8List? imageBytes,
  }) {
    return SizedBox(
      height: 256.h,
      child: Image.memory(
        imageBytes!,
        width: double.maxFinite,
        height: 256.h,
        fit: BoxFit.cover,
        errorBuilder: (context, err, v) => Container(
          color: AppColors.novaDarkIndigo,
          width: double.maxFinite,
          height: double.maxFinite,
          alignment: Alignment.center,
          child: Text(
            'You can upload an image here',
            style: AppTextStyles.text16w400.white,
          ),
        ),
      ),
    );
  }
}
