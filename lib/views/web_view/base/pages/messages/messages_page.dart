import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/routes/routes.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                sizedBoxWithHeight(16),
                Row(
                  children: [
                    Icon(
                      Iconsax.message_text_15,
                      color: AppColors.novaIndigo,
                      size: 28.sp,
                    ),
                    sizedBoxWithWidth(16),
                    Text(
                      AppStrings.messages,
                      style: AppTextStyles.text22w700,
                    ),
                  ],
                ),
                sizedBoxWithHeight(32),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => InkWell(
                onTap: () {
                  // AppEnvironment.navigator.pushNamed(BaseRoute.chatScreen);
                },
                child: Column(
                  children: [
                    sizedBoxWithHeight(16),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 18.0,
                        ),
                        sizedBoxWithWidth(16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sparsh Agarwal',
                                    style: AppTextStyles.text14w500,
                                  ),
                                  Text(
                                    '3:59 PM',
                                    style: AppTextStyles.text12w400,
                                  ),
                                ],
                              ),
                              sizedBoxWithHeight(6),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'You: ',
                                      style: AppTextStyles.text12w500,
                                      children: [
                                        TextSpan(
                                          text: 'Hi Bro, How are you?',
                                          style: AppTextStyles.text12w400,
                                        ),
                                      ],
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 6.sp,
                                    backgroundColor: AppColors.novaSkyBlue,
                                    child: Text(
                                      '1',
                                      style: AppTextStyles.text8w400.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    sizedBoxWithHeight(16),
                    const Divider(),
                  ],
                ),
              ),
              childCount: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: sizedBoxWithHeight(72),
          ),

          // ListView.separated(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   itemCount: 10,
          //   separatorBuilder: (_, __) => Column(
          //     children: [
          //       sizedBoxWithHeight(16),
          //       const Divider(),
          //       sizedBoxWithHeight(16),
          //     ],
          //   ),
          //   itemBuilder: (_, index) => InkWell(
          //     onTap: () {
          //       AppEnvironment.navigator.pushNamed(BaseRoute.chatScreen);
          //     },
          //   ),
          // ),
          // sizedBoxWithHeight(32),
        ],
      ),
    );
  }
}
