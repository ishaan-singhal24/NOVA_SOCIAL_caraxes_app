import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

class SopReviewerMView extends StatefulWidget {
  const SopReviewerMView({super.key});

  @override
  State<SopReviewerMView> createState() => _SopReviewerMViewState();
}

class _SopReviewerMViewState extends State<SopReviewerMView> {
  bool _isGeneratingResponse = false;

  late ScrollController _listScrollController;
  final TextEditingController _sopTextController = TextEditingController();

  final _sopReviewerFormKey = GlobalKey<FormState>();

  late OpenAiNotifier _openAiNotifier;
  String messageForGPT = '';

  @override
  void initState() {
    super.initState();
    _listScrollController = ScrollController();
    _openAiNotifier = Provider.of<OpenAiNotifier>(context, listen: false);
    _openAiNotifier.chatList = [];
  }

  void _writeInitialMessageForGPT() {
    messageForGPT =
        'Analyse my following statement of purpose in around 150 words, providing insights on what points are written well and what are the scopes of improvememt?\n';
  }

  void scrollListToEND() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut);
  }

  @override
  void dispose() {
    super.dispose();
    _openAiNotifier.chatList = [];
  }

  void _buttonReviewSop() async {
    try {
      if (_sopReviewerFormKey.currentState?.validate().not ?? true) {
        return;
      }

      if (_sopTextController.text.isEmpty) {
        return;
      }
      _openAiNotifier.chatList = [];
      _writeInitialMessageForGPT();
      messageForGPT = messageForGPT + _sopTextController.text;
      messageForGPT = '$messageForGPT\n';
      setState(() {
        _isGeneratingResponse = true;
      });
      print(messageForGPT);
      String checkSOPMessage =
          'If the above article isn\'t a statement of purpose then give this as a reply: "Sorry, I am unable to review the passage you provided as it doesn\'t seems like a statement of purpose."\n';
      await _openAiNotifier.sendMessageAndGetSOP(
        msg: messageForGPT,
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        scrollListToEND();
        _isGeneratingResponse = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _openAiNotifier = Provider.of<OpenAiNotifier>(context);

    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 16.w,
          ),
          child: Form(
            key: _sopReviewerFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizedBoxWithHeight(24),
                Row(
                  children: [
                    AppIconButton(
                      icon: Icons.arrow_back,
                      onTap: () {
                        _openAiNotifier.chatList = [];
                        context.pop();
                      },
                    ),
                    Expanded(
                      child: Text(
                        'Welcome to Nova\'s AI Powered SOP Reviewer',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.text22w500,
                      ),
                    ),
                  ],
                ),
                sizedBoxWithHeight(24),
                Flexible(
                  child: ListView.builder(
                    controller: _listScrollController,
                    itemCount: _openAiNotifier.getChatList.length,
                    itemBuilder: (context, index) {
                      return AnimatedTextKit(
                        isRepeatingAnimation: false,
                        repeatForever: false,
                        displayFullTextOnTap: true,
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TyperAnimatedText(
                            _openAiNotifier.getChatList[index].message ?? '',
                            textStyle: AppTextStyles.text16w500,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                if (_isGeneratingResponse) ...{
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                },
                sizedBoxWithHeight(16),
                ConstrainedBox(
                  constraints: BoxConstraints.loose(
                    Size(double.maxFinite, 240.h),
                  ),
                  child: AppMaterialInputField(
                    label: 'SOP',
                    hint: 'Please paste or type your sop here..',
                    controller: _sopTextController,
                    isRequired: true,
                    textInputAction: TextInputAction.go,
                  ),
                ),
                sizedBoxWithHeight(16),
                CustomButton(
                  color: _isGeneratingResponse
                      ? AppColors.novaDarkIndigo.withOpacity(0.3)
                      : AppColors.novaDarkIndigo,
                  text: _isGeneratingResponse
                      ? 'Your SOP is being reviewed..'
                      : _openAiNotifier.chatList.isEmpty
                          ? 'Review SOP'
                          : 'Review Again',
                  onPressed: () {
                    if (_isGeneratingResponse.not) {
                      _buttonReviewSop();
                    }
                  },
                ),
                sizedBoxWithHeight(24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
