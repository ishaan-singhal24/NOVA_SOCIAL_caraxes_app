import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/notifiers/profile/profile_notifier.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/explore/cards/explore_body.dart';
import 'package:provider/provider.dart';

class ExploreWebScreen extends StatefulWidget {
  final ExploreViewArgs? args;
  const ExploreWebScreen({
    Key? key,
    this.args,
  }) : super(key: key);

  @override
  State<ExploreWebScreen> createState() => _ExploreWebScreenState();
}

class _ExploreWebScreenState extends State<ExploreWebScreen> {
  late ScrollController _controller;
  late ProfileNotifier _profileNoti;
  bool showAll = false;

  @override
  void initState() {
    _controller = ScrollController();
    _profileNoti = Provider.of<ProfileNotifier>(context, listen: false);
    _controller.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange &&
        showAll) {
      // "reach the bottom";
      _profileNoti.fetchUserByFilter(
        widget.args?.id ?? '',
        widget.args?.filterBy ?? '',
      );
    }
  }

  Color _colorBuilder() {
    Color color = AppColors.novaDarkGreen;
    switch (widget.args?.pageType) {
      case ExploreViewArgsPageType.available:
        color = AppColors.novaPeach;
        break;
      case ExploreViewArgsPageType.interest:
        color = AppColors.novaDarkGreen;
        break;
      default:
    }
    return color;
  }

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
                    width: ScreenUtil.instance.width * 0.55,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
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
                        ExploreBody(
                          args: widget.args,
                          showAll: (v) {
                            showAll = v;
                          },
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
