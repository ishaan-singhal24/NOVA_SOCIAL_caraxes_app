import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:nova_social/data/constants/app_assets.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
// import 'package:image_picker_web/image_picker_web.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker({
    Key? key,
    required this.imagePickFn,
    this.imageUrl,
  }) : super(key: key);

  final void Function(Uint8List pickedImagePath) imagePickFn;
  String? imageUrl;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  Uint8List? _pickedImage;

  void _pickImage() async {
    try {
      // _pickedImage = await ImagePickerWeb.getImageAsBytes();
      setState(() {});
      widget.imagePickFn(_pickedImage!);
    } on PlatformException catch (e) {
      log('Unsupported operation$e');
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: <Widget>[
          _pickedImage != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(32.r),
                  child: Image.memory(
                    _pickedImage!,
                    height: 64.r,
                    width: 64.r,
                    fit: BoxFit.cover,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(32.r),
                  child: CachedNetworkImage(
                    imageUrl: widget.imageUrl ?? '',
                    width: 64.r,
                    height: 64.r,
                    fit: BoxFit.cover,
                    errorWidget: (context, err, v) => Container(
                      color: AppColors.novaIndigo,
                      width: 64.r,
                      height: 64.r,
                      alignment: Alignment.center,
                      child: Text(
                        'No Image',
                        style: AppTextStyles.text28w400.white,
                      ),
                    ),
                  ),
                ),
          TextButton.icon(
            onPressed: _pickImage,
            icon: const Icon(Icons.image),
            label: const Text('Upload Image'),
          ),
        ],
      ),
    );
  }
}
