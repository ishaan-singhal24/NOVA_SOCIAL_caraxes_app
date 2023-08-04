import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/profile/sop/sop_generator/sample_sop/sample_sop.dart';
import 'package:provider/provider.dart';

class SopGeneratorMView extends StatefulWidget {
  const SopGeneratorMView({super.key});

  @override
  State<SopGeneratorMView> createState() => _SopGeneratorMViewState();
}

class _SopGeneratorMViewState extends State<SopGeneratorMView> {
  bool _isGeneratingResponse = false;
  bool _showOptionalDetailsBox = true;

  late ScrollController _listScrollController;
  final TextEditingController _programTextController = TextEditingController();
  final TextEditingController _universityTextController =
      TextEditingController();

  final _sopGeneratorFormKey = GlobalKey<FormState>();

  late OpenAiNotifier _openAiNotifier;
  String messageForGPT = '';

  @override
  void initState() {
    super.initState();
    _listScrollController = ScrollController();
    _openAiNotifier = Provider.of<OpenAiNotifier>(context, listen: false);
    _openAiNotifier.chatList = [];
  }

  void _writeMessageForGPT() {
    List<String> dummySOPList = [
      SampleSop.sampleSOP1,
      SampleSop.sampleSOP2,
    ];
    dummySOPList.shuffle();
    final String sampleSOP = dummySOPList.first;
    messageForGPT =
        '$sampleSOP \nBased on the following information, write similar statement of purpose as the above article for a student \n';
    messageForGPT =
        'Based on the following information, write the statement of purpose in about 500 words for me \n';
    final profileNotifier =
        Provider.of<ProfileNotifier>(context, listen: false);
    final userProfile = profileNotifier.userProfile;
    final int interestLength = userProfile?.userInterests?.length ?? 0;
    final int experienceLength = userProfile?.experiences?.length ?? 0;
    final int volunteeringLength = userProfile?.volunteered?.length ?? 0;

    String interests = '';
    String experience = '';
    String volunteeringWork = '';

    for (int i = 0; i < interestLength; i++) {
      interests = '$interests${userProfile?.userInterests?[i].name ?? ''}, ';
    }

    for (int i = 0; i < experienceLength; i++) {
      experience =
          '$experience${userProfile?.experiences?[i].subTag ?? ''} experience as ${userProfile?.experiences?[i].jobTitle ?? ''} at ${userProfile?.experiences?[i].company ?? 'Company'}, ';
    }

    for (int i = 0; i < volunteeringLength; i++) {
      volunteeringWork =
          '$volunteeringWork${userProfile?.volunteered?[i].title ?? ''} at ${userProfile?.volunteered?[i].organization ?? 'Organization'}, ';
    }

    messageForGPT =
        '$messageForGPT\nMy Current School Name: ${userProfile?.educations?.first.school ?? ''}\n Introduction: ${userProfile?.tagline}\n About Me: ${userProfile?.about}\n Areas in which I have interests: $interests\nI have following experiences: $experience\nI have done following volunteering work: $volunteeringWork\n';
  }

  void scrollListToEND() {
    _listScrollController.animateTo(
      _listScrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _openAiNotifier.chatList = [];
  }

  void _buttonGenerateSop() async {
    try {
      setState(() {
        _showOptionalDetailsBox = false;
        _isGeneratingResponse = true;
      });
      _openAiNotifier.chatList = [];

      _writeMessageForGPT();

      if (_programTextController.text.isNotEmpty) {
        messageForGPT =
            '${messageForGPT}I am appling to the following program: ${_programTextController.text}\n';
      }
      if (_universityTextController.text.isNotEmpty) {
        messageForGPT =
            '${messageForGPT}I am appling to the following university: ${_universityTextController.text}\n';
      }
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

  Widget _buildOptionalDetailsBox() {
    return Container(
      decoration: BoxDecoration(
        color: ThemeHandler.mutedPlusColor(nonInverse: false),
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 8.h,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Optional Additional Details',
                  style: AppTextStyles.text12w300,
                ),
              ),
              sizedBoxWithWidth(8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showOptionalDetailsBox = false;
                  });
                },
                child: Text(
                  'Skip',
                  style: AppTextStyles.text12w300,
                ),
              ),
              sizedBoxWithWidth(8),
            ],
          ),
          sizedBoxWithHeight(16),
          Text(
            'Going Abroad? Don\'t leave before trying out this.\n\nFor fine-tuning your SOP, please provide the details of the program and university you\'re writing this sop for.',
            style: AppTextStyles.text14w600,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          sizedBoxWithHeight(24),
          AppMaterialInputField(
            label: 'Program',
            hint: 'Write the program name you\'re applying to here..',
            controller: _programTextController,
            isRequired: false,
            maxLines: 1,
            textInputAction: TextInputAction.go,
          ),
          sizedBoxWithHeight(24),
          AppMaterialInputField(
            label: 'University',
            hint: 'Write the program name you\'re applying to here..',
            controller: _universityTextController,
            isRequired: false,
            maxLines: 1,
            textInputAction: TextInputAction.go,
          ),
          sizedBoxWithHeight(8),
        ],
      ),
    );
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
            key: _sopGeneratorFormKey,
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
                        'Welcome to Nova\'s AI Powered SOP Generator',
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
                if (_showOptionalDetailsBox) ...{
                  _buildOptionalDetailsBox(),
                },
                sizedBoxWithHeight(8),
                CustomButton(
                  color: _isGeneratingResponse
                      ? AppColors.novaDarkIndigo.withOpacity(0.3)
                      : AppColors.novaDarkIndigo,
                  text: _isGeneratingResponse
                      ? 'Your SOP is being generated..'
                      : _openAiNotifier.chatList.isEmpty
                          ? 'Generate SOP'
                          : 'Generate Another SOP',
                  onPressed: () {
                    if (_isGeneratingResponse.not) {
                      _buttonGenerateSop();
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
