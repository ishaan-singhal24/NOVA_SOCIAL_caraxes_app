import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/playground/playground_feed/comment/comment_reply/playground_feed_comment_reply_model.dart';
import 'package:nova_social/data/models/playground/playground_feed/comment/playground_feed_comment_model.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/loading/loading_mview.dart';
import 'package:nova_social/views/mobile_view/playground/playground_feed_detailed/widgets/playground_feed_comment_tile_mwidget.dart';
import 'package:nova_social/views/mobile_view/playground/app_playground_feed_common/playground_feed_tile_mwidget.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class PlaygroundFeedDetailedMView extends StatefulWidget {
  final PlaygroundFeedDetailedMViewArgs? args;
  const PlaygroundFeedDetailedMView({super.key, this.args});

  @override
  State<PlaygroundFeedDetailedMView> createState() =>
      _PlaygroundFeedDetailedMViewState();
}

class _PlaygroundFeedDetailedMViewState
    extends State<PlaygroundFeedDetailedMView> {
  String? _prefixReplyText;
  bool _init = true;
  bool _showTextField = true;
  bool _isReply = false;

  final ScrollController _listScrollController = ScrollController();
  final TextEditingController _commentTextController = TextEditingController();
  late FocusNode _commentFocusNode;

  late PlaygroundFeedModel? _currentPlaygroundFeedModel;
  late PlaygroundNotifier _playgroundFeedNotifier;
  late ProfileNotifier _profileNotifier;
  late PlaygroundFeedCommentModel _currentPlaygroundCommentModel;
  List<PlaygroundFeedCommentModel>? _playgroundfeedCommentList;

  final uuid = const Uuid();

  Future<void> _addPlaygroundComment() async {
    if (_commentTextController.text.isEmpty) {
      return;
    }
    try {
      UserModel? userModel = _profileNotifier.userProfile;
      UserMinimum userMinimum = UserMinimum.getUserMinimum(userModel);
      PlaygroundFeedCommentModel playgroundfeedCommentModel =
          PlaygroundFeedCommentModel(
        id: uuid.v4(),
        commentText: _commentTextController.text,
        createdAt: DateTime.now(),
        playgroundFeedId: _currentPlaygroundFeedModel?.id,
        userDetails: userMinimum,
      );
      await _playgroundFeedNotifier
          .addCommentToFeed(playgroundfeedCommentModel);

      //Code for Notification Send
      if (_playgroundFeedNotifier.currentPlaygroundFeedModel?.userDetails?.id !=
          _profileNotifier.userProfile?.id) {
        RepoNotification repoNotification = RepoNotification(
          createdAt: DateTime.now(),
          description:
              '${_profileNotifier.userProfile?.name ?? 'Someone'} commented on your post. Check it out!',
          from: userMinimum,
          to: _playgroundFeedNotifier.currentPlaygroundFeedModel?.userDetails,
          title:
              'A new comment was added to your AI Art on Nova. Join the conversation!',
          type: NotificationType.comment,
          reference: RepoNotificationReference(
            id: _playgroundFeedNotifier.currentPlaygroundFeedModel?.id,
            type: NotificationReferenceType.aiArt,
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

  Future<void> _addPlaygroundReply() async {
    if (_commentTextController.text.isEmpty) {
      return;
    }
    try {
      UserModel? userModel = _profileNotifier.userProfile;
      UserMinimum userMinimum = UserMinimum.getUserMinimum(userModel);
      PlaygroundFeedCommentReplyModel playgroundFeedCommentReplyModel =
          PlaygroundFeedCommentReplyModel(
        id: uuid.v4(),
        commentReplyText: _commentTextController.text,
        createdAt: DateTime.now(),
        playgroundFeedId: _currentPlaygroundCommentModel.id,
        userDetails: userMinimum,
        playgroundcommentId: _currentPlaygroundCommentModel.id,
        repliedToUserDetails: _currentPlaygroundCommentModel.userDetails,
      );

      await _playgroundFeedNotifier.addCommentReplyToFeed(
        playgroundFeedCommentReplyModel: playgroundFeedCommentReplyModel,
        currentPlaygroundFeedCommentModel: _currentPlaygroundCommentModel,
      );

      // Code for Notification Send
      if (_currentPlaygroundCommentModel.userDetails?.id !=
          _profileNotifier.userProfile?.id) {
        RepoNotification repoNotification = RepoNotification(
          createdAt: DateTime.now(),
          description:
              '${_profileNotifier.userProfile?.name ?? 'Someone'} replied to your comment. Keep the discussion going!',
          from: userMinimum,
          to: _currentPlaygroundCommentModel.userDetails,
          title: 'Great news! Someone just replied to your comment on Nova.',
          type: NotificationType.replyToComment,
          reference: RepoNotificationReference(
            id: _playgroundFeedNotifier.currentPlaygroundFeedModel?.id,
            type: NotificationReferenceType.aiArt,
            subIds: [_currentPlaygroundCommentModel.id ?? ''],
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

    print('Playground Feed Detailed View Init');
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    _playgroundFeedNotifier =
        Provider.of<PlaygroundNotifier>(context, listen: false);

    if (widget.args?.playgroundfeedId?.isNotEmpty ?? false) {
      _playgroundFeedNotifier.fetchFeedById(widget.args!.playgroundfeedId!);
    }

    _currentPlaygroundFeedModel =
        _playgroundFeedNotifier.currentPlaygroundFeedModel;
    if (_currentPlaygroundFeedModel != null) {
      _playgroundFeedNotifier.streamPlaygroundFeedComments(
          playgroundfeedModel: _currentPlaygroundFeedModel!);
    }

    _initValues();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _commentFocusNode.unfocus();
    _playgroundFeedNotifier.removeCommentListener();
    AppEnvironment.deepLinkArgs.value = '';
    AppEnvironment.deepLinkPath.value = '';
  }

  void _buildInit() {
    _playgroundFeedNotifier = Provider.of<PlaygroundNotifier>(context);
    _currentPlaygroundFeedModel =
        _playgroundFeedNotifier.currentPlaygroundFeedModel;
    _playgroundfeedCommentList =
        _playgroundFeedNotifier.currentPlaygroundFeedCommentsList ??
            _currentPlaygroundFeedModel?.comments;

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
    if (_currentPlaygroundFeedModel == null) {
      return const SizedBox();
    }
    if (_playgroundFeedNotifier.createFeedStatus == InitEnum.initializing) {
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
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 16.h,
              ),
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
                          'Magic AI Art',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.text22w500,
                        ),
                      ),
                      sizedBoxWithWidth(24),
                    ],
                  ),
                  sizedBoxWithHeight(24),
                  PlaygroundFeedTileMWidget(
                    playgroundFeedModel: _currentPlaygroundFeedModel!,
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
                  if (_playgroundfeedCommentList?.isNotEmpty ?? false) ...{
                    ..._playgroundfeedCommentList!.map((e) {
                      return Column(
                        children: [
                          PlaygroundFeedCommentTileMWidget(
                            playgroundFeedCommentModel: e,
                            onReplyTap: () async {
                              _showTextField = true;
                              _isReply = true;
                              _commentFocusNode.requestFocus();
                              _currentPlaygroundCommentModel = e;
                              _prefixReplyText =
                                  '${_currentPlaygroundCommentModel.userDetails?.name ?? ''} ';

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
                      _addPlaygroundReply().then((value) {
                        _commentTextController.text = '';
                        _prefixReplyText = null;
                        setState(() {
                          _showTextField = false;
                        });
                        _commentFocusNode.unfocus();
                      });
                    } else {
                      _addPlaygroundComment().then((value) {
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
