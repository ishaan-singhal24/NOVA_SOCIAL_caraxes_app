import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/feed/comment/feed_comment_model.dart';
import 'package:nova_social/data/models/feed/feed_model.dart';
import 'package:nova_social/data/models/misc/misc.dart';
import 'package:nova_social/data/models/user/export.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/feed/feed_detailed/widgets/feed_comment_tile_mwidget.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class FeedCommentMView extends StatefulWidget {
  const FeedCommentMView({super.key});

  @override
  State<FeedCommentMView> createState() => _FeedCommentMViewState();
}

class _FeedCommentMViewState extends State<FeedCommentMView> {
  late final _listScrollController;
  late ProfileNotifier _profileNotifier;
  late FeedNotifier _feedNotifier;
  late FeedModel? _currentFeedModel;

  final _commentTextController = TextEditingController();
  final uuid = const Uuid();

  Future<void> _addComment() async {
    try {
      UserModel? userModel = _profileNotifier.userProfile;
      UserMinimum userMinimum = UserMinimum.getUserMinimum(userModel);
      FeedCommentModel feedCommentModel = FeedCommentModel(
        id: uuid.v4(),
        commentText: _commentTextController.text,
        createdAt: DateTime.now(),
        feedId: _currentFeedModel?.id,
        userDetails: userMinimum,
      );
      await _feedNotifier.addCommentToFeed(feedCommentModel);

      //Code for Notification Send
      if (_feedNotifier.currentFeedModel?.userDetails?.id !=
          _profileNotifier.userProfile?.id) {
        RepoNotification repoNotification = RepoNotification(
          createdAt: DateTime.now(),
          description:
              '${_profileNotifier.userProfile?.name ?? 'Someone'} commented on your post. Check it out!',
          from: userMinimum,
          to: _feedNotifier.currentFeedModel?.userDetails,
          title:
              'A new comment was added to your post on Nova. Join the conversation!',
          type: NotificationType.comment,
          reference: RepoNotificationReference(
            id: _feedNotifier.currentFeedModel?.id,
            type: NotificationReferenceType.post,
          ),
        );
        await _profileNotifier.createNotification(repoNotification);
      }
      //...
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listScrollController = ScrollController();
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    _feedNotifier = Provider.of<FeedNotifier>(context, listen: false);
    _currentFeedModel = _feedNotifier.currentFeedModel;
    if (_currentFeedModel != null) {
      _feedNotifier.streamFeedComments(feedModel: _currentFeedModel!);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _feedNotifier.removeCommentListener();
  }

  @override
  Widget build(BuildContext context) {
    _feedNotifier = Provider.of<FeedNotifier>(context);
    _currentFeedModel = _feedNotifier.currentFeedModel;
    final feedCommentList = _feedNotifier.currentFeedCommentsList;
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
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
                    child: Text(
                      'Comments',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.text22w500,
                    ),
                  ),
                  sizedBoxWithWidth(24),
                ],
              ),
              sizedBoxWithHeight(24),
              Flexible(
                child: ListView.separated(
                  separatorBuilder: (context, index) => sizedBoxWithHeight(32),
                  controller: _listScrollController,
                  itemCount: feedCommentList?.length ?? 0,
                  itemBuilder: (context, index) {
                    if ((feedCommentList?.isNotEmpty ?? false) &&
                        (feedCommentList?[index] != null)) {
                      return FeedCommentTileMWidget(
                        feedCommentModel: feedCommentList![index],
                      );
                    }
                    return Container();
                  },
                ),
              ),
              sizedBoxWithHeight(16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.loose(
                        Size(double.maxFinite, 80.h),
                      ),
                      child: AppMaterialInputField(
                        label: 'Comment',
                        hint: 'Write your comment here...',
                        controller: _commentTextController,
                        isRequired: true,
                        textInputAction: TextInputAction.go,
                        onSubmit: (_) {
                          _addComment().then((value) {
                            _commentTextController.text = '';
                          });
                        },
                      ),
                    ),
                  ),
                  sizedBoxWithWidth(8),
                  AppIconButton(
                    icon: Icons.send,
                    onTap: () {
                      _addComment().then((value) {
                        _commentTextController.text = '';
                      });
                    },
                  ),
                ],
              ),
              sizedBoxWithHeight(16),
            ],
          ),
        ),
      ),
    );
  }
}
