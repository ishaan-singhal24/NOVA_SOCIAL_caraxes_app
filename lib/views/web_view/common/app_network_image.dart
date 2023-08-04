import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nova_social/views/web_view/common/app_error_icon.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final Color? color;
  final BoxShape? shape;

  const AppNetworkImage({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.color,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      errorWidget: (context, url, error) => AppErrorIcon(
        size: width,
      ),
    );
  }
}
