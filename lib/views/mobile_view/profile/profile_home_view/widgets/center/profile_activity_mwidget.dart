import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/feed/feed_model.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/feed_routes/feed_mroutes.dart';
import 'package:nova_social/routes/mobile/show_all_routes.dart/show_all_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class ProfileActivityMWidget extends StatefulWidget {
  final ProfileMViewArgs args;
  const ProfileActivityMWidget({super.key, required this.args});

  @override
  State<ProfileActivityMWidget> createState() => _ProfileActivityMWidgetState();
}

class _ProfileActivityMWidgetState extends State<ProfileActivityMWidget> {
  late List<FeedModel?>? _feedList;
  late FeedNotifier _feedNotifier;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _feedNotifier = Provider.of<FeedNotifier>(context, listen: false);
    _feedNotifier.streamFeedByUserId(userId: (widget.args.profile?.id ?? ''));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _feedNotifier.removeFeedByIdListener();
  }

  @override
  Widget build(BuildContext context) {
    _feedNotifier = Provider.of<FeedNotifier>(context);
    _feedList = _feedNotifier.feedByIdList;

    if (_feedList?.isEmpty ?? true) {
      return const SizedBox();
    }
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
      child: Column(
        children: [
          sizedBoxWithHeight(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Activity',
                style: AppTextStyles.text20w500,
              ),
              if ((widget.args.isCurrentUser ?? false)) ...{
                AppIconButton(
                  icon: Icons.add,
                  onTap: () {
                    context.push(FeedMRouter.createFeedViewRoute);
                  },
                ),
              },
            ],
          ),
          sizedBoxWithHeight(24),
          _buildActivityTile(index: 0),
          if ((_feedList?.length ?? 0) > 1) ...{
            sizedBoxWithHeight(16),
            _buildActivityTile(index: 1),
            sizedBoxWithHeight(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.push(
                      ShowAllMRouter.showAllActivityRoute,
                      extra: ProfileMViewArgs(
                        isCurrentUser: widget.args.isCurrentUser,
                        profile: widget.args.profile,
                      ),
                    );
                  },
                  child: Text(
                    'Show all activity >',
                    style: AppTextStyles.text14w500.setOpacity(0.8),
                  ),
                )
              ],
            ),
          },
          sizedBoxWithHeight(24),
          const AppDividerMwidget(),
          sizedBoxWithHeight(24),
        ],
      ),
    );
  }

  Widget _buildActivityTile({required int index}) {
    bool hasImage = (_feedList?.isNotEmpty ?? false) &&
        (_feedList?[index]?.generatedFeedUrl?.isNotEmpty ?? false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (hasImage) ...{
              CachedNetworkImage(
                imageUrl: _feedList?[index]?.generatedFeedUrl?[0] ?? '',
                fit: BoxFit.cover,
                height: 40.h,
                width: 48.w,
                errorWidget: (_, __, ___) => Text(
                  'Error occured while loading image',
                  style: AppTextStyles.text14w400.white,
                ),
              ),
              sizedBoxWithWidth(16),
            },
            Expanded(
              child: ReadMoreText(
                _feedList?[index]?.feedText ??
                    '${widget.args.profile?.name?.split(' ')[0] ?? ''} shared feed with image(s)',
                style: AppTextStyles.text14w400,
                trimLines: 2,
                moreStyle: AppTextStyles.text14w400.indigo,
                lessStyle: AppTextStyles.text14w400.indigo,
                trimMode: TrimMode.Line,
              ),
            ),
          ],
        ),
        sizedBoxWithHeight(8),
        Padding(
          padding: hasImage ? EdgeInsets.only(left: 64.w) : EdgeInsets.zero,
          child: Text(
            'Posted ${_feedList?[index]?.createdAt != null ? _feedList![index]!.createdAt!.writeDateTime : ''}',
            style: AppTextStyles.text14w300.copyWith(
              color: AppColors.novaWhite.withOpacity(0.8),
            ),
          ),
        ),
      ],
    );
  }
}
