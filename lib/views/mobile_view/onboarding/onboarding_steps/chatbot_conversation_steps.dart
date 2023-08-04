import 'package:flutter/material.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/onboarding/onboarding_steps/widgets/chatbot_title_mwidget.dart';
import 'package:nova_social/views/mobile_view/onboarding/onboarding_steps/widgets/chatbot_message_mwidget.dart';
import 'package:provider/provider.dart';

class ChatBotConversationStepsMessageModal {
  String message;
  bool isMessageFromAi;
  bool isDelivered;
  ChatBotConversationStepsMessageModal({
    required this.message,
    this.isMessageFromAi = true,
    this.isDelivered = false,
  });
}

class ChatBotConversationSteps extends StatefulWidget {
  const ChatBotConversationSteps({
    super.key,
  });

  @override
  State<ChatBotConversationSteps> createState() =>
      _ChatBotConversationStepsState();
}

class _ChatBotConversationStepsState extends State<ChatBotConversationSteps> {
  final TextEditingController _controller = TextEditingController();
  List<ChatBotConversationStepsMessageModal> conversation = [];
  int currentPage = 1;
  List<SchoolModel>? globalSchools;
  // List<SuggestionInputModel> schoolSuggestions = [];
  bool showSchoolsWidget = false;
  Education? selectedSchool;
  String? name;
  List<SchoolModel> schoolSuggestions = [];
  late ProfileNotifier _profileNoti;

  populateConversation() {
    // conversation.insert(
    //   0,
    //   ChatBotConversationStepsMessageModal(message: 'Hey there! 👋'),
    // );
    conversation.insert(
      0,
      ChatBotConversationStepsMessageModal(
          message:
              'Hey there! 👋\n\nMy name is Robin and its super cool to see you here! What’s your name?'),
    );
  }

  int levenshteinDistance(String a, String b) {
    if (a.length == 0) return b.length;
    if (b.length == 0) return a.length;

    List<List<int>> matrix =
        List.generate(a.length + 1, (i) => List<int>.filled(b.length + 1, 0));

    for (int i = 0; i <= a.length; i++) matrix[i][0] = i;
    for (int j = 0; j <= b.length; j++) matrix[0][j] = j;

    for (int i = 1; i <= a.length; i++) {
      for (int j = 1; j <= b.length; j++) {
        int cost = (a[i - 1] == b[j - 1]) ? 0 : 1;
        matrix[i][j] = [
          matrix[i - 1][j] + 1,
          matrix[i][j - 1] + 1,
          matrix[i - 1][j - 1] + cost,
        ].reduce((value, element) => value < element ? value : element);
      }
    }

    return matrix[a.length][b.length];
  }

  List<SchoolModel> searchSchools(List<SchoolModel> data, String userInput) {
    List<String> keywords = userInput.split(' ');

    // Calculate the score for each SchoolModel object
    Map<SchoolModel, int> scores = {};
    for (SchoolModel school in data) {
      int score = 0;
      for (String keyword in keywords) {
        if (school.name != null && (school.name?.contains(keyword) ?? false)) {
          score++;
        }
        if (school.district != null &&
            (school.district?.contains(keyword) ?? false)) score++;
        if (school.address != null &&
            (school.address?.contains(keyword) ?? false)) score++;
        if (school.pincode != null &&
            school.pincode.toString().contains(keyword)) score++;
      }
      scores[school] = score;
    }

    // Sort the SchoolModel objects based on their scores
    List<SchoolModel> sortedSchools = data.toList();
    sortedSchools.sort((a, b) => (scores[b] ?? 0) - (scores[a] ?? 0));

    // Return the sorted list
    return [sortedSchools.last];
  }

  @override
  void initState() {
    super.initState();
    _profileNoti = Provider.of<ProfileNotifier>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchGlobalSchools();
    });
    populateConversation();
    // _controller.addListener(() {
    //   if (currentPage != 2) {
    //     return;
    //   }
    //   globalSchools?.sort((a, b) => a.name,)
    //   setState(() {});
    //   print(schoolSuggestions);
    // });
  }

  Future fetchGlobalSchools() async {
    await _profileNoti.fetchGlobalSchools().then((value) {
      globalSchools =
          Provider.of<ProfileNotifier>(context, listen: false).globalSchools;
    });
    setState(() {});
  }

  void handleMessages() {
    switch (currentPage) {
      case 1:
        if (_controller.text.isEmpty) {
          conversation.insert(
            0,
            ChatBotConversationStepsMessageModal(
              message: "Please enter your name!",
            ),
          );
          break;
        }
        conversation.insert(
          0,
          ChatBotConversationStepsMessageModal(
            message: _controller.text,
            isDelivered: true,
            isMessageFromAi: false,
          ),
        );

        // conversation.insert(
        //   0,
        //   ChatBotConversationStepsMessageModal(
        //     message: 'Nice',
        //   ),
        // );
        conversation.insert(
          0,
          ChatBotConversationStepsMessageModal(
            message:
                "Nice name, $name!\nCan you please tell me your school name too?",
          ),
        );
        _controller.clear();
        currentPage++;
        setState(() {});
        break;
      case 2:
        if (_controller.text.isEmpty) {
          conversation.insert(
            0,
            ChatBotConversationStepsMessageModal(
              message: "Please enter your school name!",
            ),
          );
          break;
        }
        conversation.insert(
          0,
          ChatBotConversationStepsMessageModal(
            message: _controller.text,
            isDelivered: true,
            isMessageFromAi: false,
          ),
        );

        // _controller.clear();
        currentPage++;
        // conversation.insert(
        //   0,
        //   ChatBotConversationStepsMessageModal(
        //     message:
        //         "I'm super excited to get to know you better and help you make the most of your time here. I can tell we're going to have a blast together! 🚀",
        //   ),
        // );
        conversation.insert(
          0,
          ChatBotConversationStepsMessageModal(
            message:
                "Great! I'm super excited to get to know you better and help you make the most of your time here. I can tell we're going to have a blast together! 🚀\n\nI love icecream 🤤, adventure and all things technology. What are you interested in?",
          ),
        );
        setState(() {});
        break;
      default:
    }
  }

  String inputLabelText() {
    String inputLabel = 'Enter your name';
    switch (currentPage) {
      case 2:
        inputLabel = 'Enter your school';
        break;
      default:
        inputLabel = 'Enter your name';
    }
    return inputLabel;
  }

  String buttonText() {
    String inputLabel = 'Continue';
    switch (currentPage) {
      case 2:
        inputLabel = 'Next';
        break;
      case 3:
        inputLabel = 'Select your interests';
        break;
      default:
        inputLabel = 'Continue';
    }
    return inputLabel;
  }

  @override
  Widget build(BuildContext context) {
    final profileNoti = Provider.of<ProfileNotifier>(context);
    List<SuggestionInputModel> inputSuggestion = [];
    if (currentPage == 2) {
      // schoolSuggestions
      inputSuggestion = profileNoti.globalSchools
              ?.map(
                (e) => SuggestionInputModel(
                  id: e.id.toString(),
                  name: '${e.name}, ${e.district}',
                ),
              )
              .toList() ??
          [];
    }
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const ChatBotTitleMWidget(),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              reverse: true,
              itemBuilder: (_, index) => Column(
                children: [
                  ChatBotMessageMWidget(
                    data: conversation[index],
                    isDelivered: () {},
                    isLatestMessage: index == 0,
                  ),
                  // if (index == 0 && _controller.text.isNotEmpty) ...{
                  //   sizedBoxWithHeight(8),
                  //   Container(
                  //     height: 160.h,
                  //     width: double.maxFinite,
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  //     decoration: BoxDecoration(
                  //       color: AppColors.novaViolet.withOpacity(0.1),
                  //       border: Border.all(
                  //         color: ThemeHandler.mutedColor(nonInverse: false),
                  //         width: 0.5,
                  //       ),
                  //       borderRadius: BorderRadius.only(
                  //         topRight: Radius.circular(8.r),
                  //         bottomRight: Radius.circular(8.r),
                  //         bottomLeft: Radius.circular(8.r),
                  //       ),
                  //     ),
                  //     child: ListView.separated(
                  //       itemBuilder: (_, index) => Padding(
                  //           padding: EdgeInsets.symmetric(vertical: 4.h),
                  //           child: Column(
                  //             children: [
                  //               Text(
                  //                 schoolSuggestions[index].name ?? '',
                  //                 style: AppTextStyles.text14w400,
                  //               ),
                  //               Text(
                  //                 schoolSuggestions[index].address ?? '',
                  //                 style: AppTextStyles.text10w400,
                  //               ),
                  //             ],
                  //           )),
                  //       separatorBuilder: (_, __) => const AppDividerMwidget(),
                  //       itemCount: schoolSuggestions.length,
                  //     ),
                  //   ),
                  // }
                ],
              ),
              separatorBuilder: (_, __) => sizedBoxWithHeight(8),
              itemCount: conversation.length,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxWithHeight(24),
              // AppMaterialInputField(
              //   controller: _controller,
              //   isRequired: true,
              //   label: inputLabelText(),
              //   hint: '',
              // ),
              if (currentPage == 2) ...{
                AppMaterialAutofillInputField(
                  controller: _controller,
                  isRequired: true,
                  label: inputLabelText(),
                  suggestions: inputSuggestion,
                  onSuggestionSelected: (s) {
                    SchoolModel? school = globalSchools?.singleWhere(
                      (element) => element.id.toString() == s.id,
                      orElse: () => const SchoolModel(),
                    );
                    selectedSchool = Education(
                      school: school?.name,
                      id: school?.id.toString(),
                      location: school?.district,
                    );
                  },
                  textInputAction: TextInputAction.go,
                ),
              } else if (currentPage == 3)
                ...{}
              else ...{
                AppMaterialInputField(
                  controller: _controller,
                  isRequired: true,
                  label: inputLabelText(),
                  hint: '',
                  textInputAction: TextInputAction.go,
                  onChanged: (value) {
                    name = _controller.text;
                  },
                ),
              },
              sizedBoxWithHeight(24),
              CustomButton(
                text: buttonText(),
                onPressed: () async {
                  handleMessages();
                  if (currentPage == 3) {
                    UserModel? userModel =
                        Provider.of<ProfileNotifier>(context, listen: false)
                            .userProfile;
                    // userModel = userModel?.copyWith(name: _controller.text);
                    // _profileNoti.saveProfile(userModel!);
                    selectedSchool ??= Education(
                      school: _controller.text,
                      id: '',
                    );
                    List<Education> educations =
                        userModel?.educations?.toList() ?? [];
                    educations.add(selectedSchool!);
                    userModel = userModel?.copyWith(
                      educations: educations,
                      name: name,
                    );
                    await Future.delayed(const Duration(seconds: 13));
                    await _profileNoti.saveProfile(userModel!);
                  }
                  // widget.onTap(currentPage);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
