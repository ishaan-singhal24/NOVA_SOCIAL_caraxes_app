import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/user_collection/cards/user_collection_body.dart';

class UserCollectionWebScreen extends StatefulWidget {
  final UserCollection? collection;
  const UserCollectionWebScreen({
    Key? key,
    this.collection,
  }) : super(key: key);

  @override
  State<UserCollectionWebScreen> createState() =>
      _UserCollectionWebScreenState();
}

class _UserCollectionWebScreenState extends State<UserCollectionWebScreen> {
  late ScrollController _controller;
  bool showAll = false;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  Color _colorBuilder() => widget.collection?.color ?? AppColors.novaDarkGreen;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            Container(
              width: ScreenUtil.instance.width * 1.2,
              height: 200.h,
              decoration: BoxDecoration(
                color: _colorBuilder(),
                border: const Border.fromBorderSide(BorderSide.none),
              ),
            ),
            Transform.translate(
              offset: Offset(0.0, -100.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: ScreenUtil.instance.width * 0.53,
                    padding: EdgeInsets.symmetric(
                      horizontal: 56.w,
                      vertical: 40.h,
                    ),
                    decoration: BoxDecoration(
                      color: ThemeHandler.backgroundColor(),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UserCollectionBody(
                          collection: widget.collection,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
