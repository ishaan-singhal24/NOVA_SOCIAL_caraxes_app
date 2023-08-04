import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/feed_routes/feed_mroutes.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/feed/app_feed_common/feed_tile_mwidget.dart';
import 'package:provider/provider.dart';

class FeedMView extends StatefulWidget {
  const FeedMView({super.key});

  @override
  State<FeedMView> createState() => _FeedMViewState();
}

class _FeedMViewState extends State<FeedMView> {
  late final _listScrollController;
  late FeedNotifier _feedNotifier;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listScrollController = ScrollController();
    _feedNotifier = Provider.of<FeedNotifier>(context, listen: false);
    _feedNotifier.streamAllFeed();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _feedNotifier.removeFeedListener();
  }

  @override
  Widget build(BuildContext context) {
    _feedNotifier = Provider.of<FeedNotifier>(context);

    final feedList = _feedNotifier.feedList;
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
            children: [
              sizedBoxWithHeight(24),
              // Row(
              //   children: [
              //     AppIconButton(
              //       icon: Icons.arrow_back,
              //       onTap: () {
              //         context.pop();
              //       },
              //     ),
              //     Expanded(
              //       child: Text(
              //         'Feed',
              //         textAlign: TextAlign.center,
              //         style: AppTextStyles.text22w500,
              //       ),
              //     ),
              //   ],
              // ),
              // sizedBoxWithHeight(24),
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
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 96.h),
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
      ),
    );
  }
}
