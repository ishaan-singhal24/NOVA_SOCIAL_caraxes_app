import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/chat/widgets/widgets.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late List<Message>? messages;

  @override
  void initState() {
    super.initState();
    messages = chatJson
        .map(
          (e) => Message.fromJson(e),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatAppBar(),
      body: Stack(
        children: [
          Positioned.fill(
            left: 24.w,
            right: 24.w,
            child: CustomScrollView(
              reverse: true,
              slivers: [
                SliverToBoxAdapter(
                  child: sizedBoxWithHeight(64),
                ),
                if (messages?.isNotEmpty ?? false) ...{
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        DateTime? sentAtCurrentIndex = messages?[index].sentAt;
                        DateTime? sentAtNextIndex = messages?[
                                    (messages?.length ?? 0) - 1 < index + 1
                                        ? 0
                                        : index + 1]
                                .sentAt ??
                            DateTime.now();
                        bool showDayChange = false;
                        if (sentAtCurrentIndex
                                ?.isSameDate(sentAtNextIndex)
                                .not ??
                            false) {
                          showDayChange = true;
                        }
                        return Column(
                          children: [
                            if (showDayChange) ...{
                              sizedBoxWithHeight(6),
                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(),
                                  ),
                                  sizedBoxWithWidth(8),
                                  Text(
                                    messages?[index]
                                            .sentAt
                                            ?.todayYesterdayDate ??
                                        '',
                                    style: AppTextStyles.text12w400,
                                  ),
                                  sizedBoxWithWidth(8),
                                  Expanded(
                                    child: Divider(),
                                  ),
                                ],
                              ),
                              sizedBoxWithHeight(6),
                            },
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: CachedNetworkImage(
                                      imageUrl: messages?[index]
                                              .user
                                              ?.profilePictureUrl ??
                                          '',
                                      fit: BoxFit.cover,
                                      width: 32.r,
                                      height: 32.r,
                                    ),
                                  ),
                                  sizedBoxWithWidth(16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              messages?[index].user?.name ??
                                                  'NA',
                                              style: AppTextStyles.text14w500,
                                            ),
                                            Text(
                                              messages?[index]
                                                      .sentAt
                                                      ?.getTime ??
                                                  'NA',
                                              style: AppTextStyles.text12w400,
                                            ),
                                          ],
                                        ),
                                        sizedBoxWithHeight(4),
                                        Text(
                                          messages?[index].text ?? '',
                                          style: AppTextStyles.text14w400,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      childCount: messages?.length,
                    ),
                  ),
                },
                SliverToBoxAdapter(
                  child: sizedBoxWithHeight(32),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ChatBottomMessageBox(),
          ),
        ],
      ),
    );
  }
}
