import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/notifiers/chat_bot/chat_bot_notifier.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/chat_bot/widgets/chat_bot_app_bar_mwidget.dart';
import 'package:nova_social/views/mobile_view/chat_bot/widgets/chat_bot_message_mtile.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

class ChatBotMView extends StatefulWidget {
  const ChatBotMView({super.key});

  @override
  State<ChatBotMView> createState() => _ChatBotMViewState();
}

class _ChatBotMViewState extends State<ChatBotMView> {
  late ChatBotNotifier _chatBotNotifier;
  late ScrollController _listScrollController;
  final TextEditingController _messageController = TextEditingController();
  bool isLatestMessage = false;

  void _scrollListToBottom() {
    // _listScrollController.jumpTo(
    //   _listScrollController.position.maxScrollExtent,
    // );
    _listScrollController.animateTo(
      _listScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  // void _addScrollListener() {
  //   _listScrollController.addListener(() {
  //     _listScrollController.animateTo(
  //       _listScrollController.position.maxScrollExtent,
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.easeOut,
  //     );
  //   });
  // }
  // void _addScrollListener() {
  //   _listScrollController.addListener(() {
  //     if (_listScrollController.position.userScrollDirection ==
  //         ScrollDirection.forward) {
  //       // User is scrolling up, do nothing
  //     } else {
  //       // User is scrolling down, check if the scroll position is near the bottom
  //       if (_listScrollController.offset >=
  //           _listScrollController.position.maxScrollExtent - 50) {
  //         _scrollListToBottom();
  //       }
  //     }
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listScrollController = ScrollController();
    _chatBotNotifier = Provider.of<ChatBotNotifier>(context, listen: false);
    _chatBotNotifier.fetchConversationFromFirebase().then((value) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _scrollListToBottom();
        // _addScrollListener();
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _chatBotNotifier.storeConversationToFirebase();
    _listScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _chatBotNotifier = Provider.of<ChatBotNotifier>(context);
    final chatConversations = _chatBotNotifier.chatConversations;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: ThemeHandler.backgroundColor(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                sizedBoxWithHeight(24),
                const ChatBotAppBarMWidget(),
                sizedBoxWithHeight(24),
                Expanded(
                  child: _chatBotNotifier.fetchConversationStatus ==
                          InitEnum.initializing
                      ? Center(
                          child: Text(
                            'Fetching Previous Conversations..',
                            style: AppTextStyles.text16w400,
                          ),
                        )
                      : ListView.builder(
                          controller: _listScrollController,
                          itemCount: chatConversations?.length ?? 0,
                          itemBuilder: (context, index) {
                            Widget widget1 = Container();
                            Widget widget2 = Container();
                            if (chatConversations?[index]
                                    .userQuery
                                    ?.isNotEmpty ??
                                false) {
                              widget1 = ChatBotMessageMTile(
                                isUserMessgae: true,
                                message: chatConversations?[index].userQuery,
                              );
                            }
                            if (chatConversations?[index]
                                    .botResponse
                                    ?.isNotEmpty ??
                                false) {
                              bool shouldAnimate = (isLatestMessage &&
                                  (index ==
                                      ((chatConversations?.length ?? 0) - 1)));
                              widget2 = ChatBotMessageMTile(
                                isUserMessgae: false,
                                isLatestMessage: shouldAnimate,
                                message: chatConversations?[index].botResponse,
                              );
                              if (shouldAnimate) {
                                isLatestMessage = false;
                              }
                            } else if (_chatBotNotifier.aiResponseStatus ==
                                InitEnum.initializing) {
                              widget2 = const ChatBotMessageMTile(
                                isUserMessgae: false,
                                isFetching: true,
                                message: '',
                              );
                            }
                            return Column(
                              children: [
                                widget1,
                                sizedBoxWithHeight(16),
                                widget2,
                                sizedBoxWithHeight(16),
                              ],
                            );
                          },
                        ),
                ),
                sizedBoxWithHeight(24),
                AppMaterialInputField(
                  controller: _messageController,
                  isRequired: false,
                  hint: 'Ask anything here..',
                  minLines: 1,
                  textInputAction: TextInputAction.go,
                  onSubmit: (value) async {
                    String msg = _messageController.text;
                    setState(() {
                      isLatestMessage = true;
                      _messageController.text = '';
                    });
                    await _chatBotNotifier.sendMessgaeAndGetResponse(
                      msg: msg,
                    );
                  },
                  suffixIcon: GestureDetector(
                    onTap: () async {
                      String msg = _messageController.text;
                      setState(() {
                        isLatestMessage = true;
                        _messageController.text = '';
                      });
                      _scrollListToBottom();
                      await _chatBotNotifier.sendMessgaeAndGetResponse(
                        msg: msg,
                      );
                      _scrollListToBottom();
                    },
                    child: Icon(
                      Icons.send,
                      color: AppColors.novaWhite.withOpacity(0.8),
                    ),
                  ),
                ),
                sizedBoxWithHeight(16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
