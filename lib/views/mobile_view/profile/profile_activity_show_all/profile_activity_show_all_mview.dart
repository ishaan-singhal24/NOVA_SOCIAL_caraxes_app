import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/feed_routes/feed_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/feed/app_feed_common/feed_tile_mwidget.dart';
import 'package:provider/provider.dart';

class ProfileActivityShowAllMView extends StatefulWidget {
  final ProfileMViewArgs args;
  const ProfileActivityShowAllMView({
    super.key,
    required this.args,
  });

  @override
  State<ProfileActivityShowAllMView> createState() =>
      _ProfileActivityShowAllMViewState();
}

class _ProfileActivityShowAllMViewState
    extends State<ProfileActivityShowAllMView> {
  late final ScrollController _listScrollController;
  late FeedNotifier _feedNotifier;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listScrollController = ScrollController();
    _feedNotifier = Provider.of<FeedNotifier>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    _feedNotifier = Provider.of<FeedNotifier>(context);
    final feedList = _feedNotifier.feedByIdList;
    return Scaffold(
      extendBody: false,
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxWithHeight(24),
              Row(
                children: [
                  AppIconButton(
                    icon: Icons.arrow_back,
                    onTap: () {
                      context.pop();
                    },
                    color: AppColors.novaWhite,
                  ),
                  Expanded(
                    child: Text(
                      'Activity',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.text24w700,
                    ),
                  ),
                ],
              ),
              sizedBoxWithHeight(32),
              Text(
                '${feedList?.length ?? 0} Posts',
                style: AppTextStyles.text16w600,
              ),
              sizedBoxWithHeight(16),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => sizedBoxWithHeight(16),
                  controller: _listScrollController,
                  itemCount: feedList?.length ?? 0,
                  itemBuilder: (context, index) {
                    if ((feedList?.isNotEmpty ?? false) &&
                        (feedList?[index] != null)) {
                      return FeedTileMWidget(
                        feedModel: feedList![index]!,
                      );
                    }
                    return Container();
                  },
                ),
              ),
              sizedBoxWithHeight(16),
            ],
          ),
        ),
      ),
      floatingActionButton: (widget.args.isCurrentUser ?? false)
          ? Container(
              margin: EdgeInsets.only(bottom: 8.h),
              child: FloatingActionButton(
                backgroundColor: AppColors.novaDarkIndigo,
                onPressed: () {
                  context.push(FeedMRouter.createFeedViewRoute);
                },
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: AppColors.novaWhite,
                    size: 24.r,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
