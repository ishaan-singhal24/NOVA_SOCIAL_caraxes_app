import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/feed/comment/comment_reply/feed_comment_reply_model.dart';
import 'package:nova_social/data/models/feed/comment/feed_comment_model.dart';
import 'package:nova_social/data/models/feed/feed_model.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/feed/app_feed_common/feed_tile_mwidget.dart';
import 'package:nova_social/views/mobile_view/feed/feed_detailed/widgets/feed_comment_tile_mwidget.dart';
import 'package:nova_social/views/mobile_view/loading/loading_mview.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class FeedDetailedMView extends StatefulWidget {
  final FeedDetailedMViewArgs? args;
  const FeedDetailedMView({super.key, this.args});

  @override
  State<FeedDetailedMView> createState() => _FeedDetailedMViewState();
}

class _FeedDetailedMViewState extends State<FeedDetailedMView> {
  String? _prefixReplyText;
  bool _init = true;
  bool _showTextField = true;
  bool _isReply = false;

  final ScrollController _listScrollController = ScrollController();
  final TextEditingController _commentTextController = TextEditingController();
  late FocusNode _commentFocusNode;

  late FeedModel? _currentFeedModel;
  late FeedNotifier _feedNotifier;
  late ProfileNotifier _profileNotifier;
  late FeedCommentModel _currentCommentModel;
  List<FeedCommentModel>? _feedCommentList;

  final uuid = const Uuid();

  Future<void> _addComment() async {
    if (_commentTextController.text.isEmpty) {
      return;
    }
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
      setState(() {
        _showTextField = false;
      });
      _commentFocusNode.unfocus();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _addReply() async {
    if (_commentTextController.text.isEmpty) {
      return;
    }
    try {
      UserModel? userModel = _profileNotifier.userProfile;
      UserMinimum userMinimum = UserMinimum.getUserMinimum(userModel);
      FeedCommentReplyModel feedCommentReplyModel = FeedCommentReplyModel(
        id: uuid.v4(),
        commentReplyText: _commentTextController.text,
        createdAt: DateTime.now(),
        feedId: _currentCommentModel.id,
        userDetails: userMinimum,
        commentId: _currentCommentModel.id,
        repliedToUserDetails: _currentCommentModel.userDetails,
      );

      await _feedNotifier.addCommentReplyToFeed(
        feedCommentReplyModel: feedCommentReplyModel,
        currentCommentModel: _currentCommentModel,
      );

      // Code for Notification Send
      if (_currentCommentModel.userDetails?.id !=
          _profileNotifier.userProfile?.id) {
        RepoNotification repoNotification = RepoNotification(
          createdAt: DateTime.now(),
          description:
              '${_profileNotifier.userProfile?.name ?? 'Someone'} replied to your comment. Keep the discussion going!',
          from: userMinimum,
          to: _currentCommentModel.userDetails,
          title: 'Great news! Someone just replied to your comment on Nova.',
          type: NotificationType.replyToComment,
          reference: RepoNotificationReference(
            id: _feedNotifier.currentFeedModel?.id,
            type: NotificationReferenceType.post,
            subIds: [_currentCommentModel.id ?? ''],
            subTypes: [NotificationReferenceType.comment],
          ),
        );
        await _profileNotifier.createNotification(repoNotification);
      }
      // ...

      setState(() {
        _showTextField = false;
      });
      _commentFocusNode.unfocus();
    } catch (e) {
      print(e.toString());
    }
  }

  void _initValues() {
    if (_init) {
      _commentFocusNode = FocusNode();
      _commentFocusNode.requestFocus();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('Feed Detailed View Init');
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    _feedNotifier = Provider.of<FeedNotifier>(context, listen: false);

    if (widget.args?.feedId?.isNotEmpty ?? false) {
      print(widget.args!.feedId);
      _feedNotifier.fetchFeedById(widget.args!.feedId!);
    }

    _currentFeedModel = _feedNotifier.currentFeedModel;
    if (_currentFeedModel != null) {
      _feedNotifier.streamFeedComments(feedModel: _currentFeedModel!);
    }

    _initValues();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _commentFocusNode.unfocus();
    _feedNotifier.removeCommentListener();
    AppEnvironment.deepLinkArgs.value = '';
    AppEnvironment.deepLinkPath.value = '';
  }

  void _buildInit() {
    _feedNotifier = Provider.of<FeedNotifier>(context);
    _currentFeedModel = _feedNotifier.currentFeedModel;
    _feedCommentList =
        _feedNotifier.currentFeedCommentsList ?? _currentFeedModel?.comments;

    if (_init.not) {
      _commentFocusNode = FocusNode();
      if (_showTextField) {
        _commentFocusNode.requestFocus();
      }
    }

    if (_commentFocusNode.hasFocus) {
      _commentTextController.selection = TextSelection.fromPosition(
        TextPosition(
          offset: _commentTextController.text.length,
        ),
      );
    }
    _init = false;
  }

  @override
  Widget build(BuildContext context) {
    _buildInit();
    if (_currentFeedModel == null) {
      return const SizedBox();
    }
    if (_feedNotifier.createFeedStatus == InitEnum.initializing) {
      return const LoadingMView();
    }
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _showTextField = false;
          });
          _commentFocusNode.unfocus();
        },
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: ListView(
                controller: _listScrollController,
                children: [
                  Row(
                    children: [
                      // if (context.canPop()) ...{
                      AppIconButton(
                        icon: Icons.arrow_back,
                        onTap: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          } else {
                            AppEnvironment.deepLinkArgs.value = '';
                            AppEnvironment.deepLinkPath.value = '';
                          }
                        },
                      ),
                      // },
                      Expanded(
                        child: Text(
                          'Feed',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.text22w500,
                        ),
                      ),
                      sizedBoxWithWidth(24),
                    ],
                  ),
                  sizedBoxWithHeight(24),
                  FeedTileMWidget(
                    feedModel: _currentFeedModel!,
                    onCommentIconTap: () {
                      _showTextField = true;
                      setState(() {});
                      _commentFocusNode.requestFocus();
                    },
                  ),
                  Text(
                    'Comments',
                    style: AppTextStyles.text14w500,
                  ),
                  sizedBoxWithHeight(16),
                  if (_feedCommentList?.isNotEmpty ?? false) ...{
                    ..._feedCommentList!.map((e) {
                      return Column(
                        children: [
                          FeedCommentTileMWidget(
                            feedCommentModel: e,
                            onReplyTap: () async {
                              _showTextField = true;
                              _isReply = true;
                              _commentFocusNode.requestFocus();
                              _currentCommentModel = e;
                              _prefixReplyText =
                                  '${_currentCommentModel.userDetails?.name ?? ''} ';

                              setState(() {});
                            },
                          ),
                          sizedBoxWithHeight(32),
                        ],
                      );
                    }).toList(),
                  },
                  // Container(
                  //   height: ScreenUtil.instance.screenHeight * 0.6,
                  //   padding: EdgeInsets.only(left: 4.w),
                  //   child: ListView.separated(
                  //     separatorBuilder: (context, index) =>
                  //         sizedBoxWithHeight(32),
                  //     itemCount: feedCommentList?.length ?? 0,
                  //     itemBuilder: (context, index) {
                  //       if ((feedCommentList?.isNotEmpty ?? false) &&
                  //           (feedCommentList?[index] != null)) {
                  //         return FeedCommentTileMWidget(
                  //           feedCommentModel: feedCommentList![index],
                  //           onReplyTap: () async {
                  //             _showTextField = true;
                  //             _isReply = true;
                  //             setState(() {});
                  //             _commentFocusNode.requestFocus();
                  //             _currentCommentModel = feedCommentList[index];
                  //           },
                  //         );
                  //       }
                  //       return Container();
                  //     },
                  //   ),
                  // ),
                  // sizedBoxWithHeight(16),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Visibility(
                visible: _showTextField,
                child: AppMaterialInputField(
                  maxLines: 1,
                  focusNode: _commentFocusNode,
                  focusFillColor:
                      ThemeHandler.mutedPlusColor(nonInverse: false),
                  nonFocusFillColor:
                      ThemeHandler.mutedPlusColor(nonInverse: false),
                  showBorder: false,
                  hint: _isReply ? '' : 'Write your comment here...',
                  controller: _commentTextController,
                  isRequired: false,
                  prefixText: _prefixReplyText,
                  textInputAction: TextInputAction.go,
                  onSubmit: (_) {
                    if (_isReply) {
                      _addReply().then((value) {
                        _commentTextController.text = '';
                        _prefixReplyText = null;
                        setState(() {
                          _showTextField = false;
                        });
                        _commentFocusNode.unfocus();
                      });
                    } else {
                      _addComment().then((value) {
                        _commentTextController.text = '';
                        setState(() {
                          _showTextField = false;
                        });
                        _commentFocusNode.unfocus();
                        _listScrollController.animateTo(
                          _listScrollController.position.minScrollExtent,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      });
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
