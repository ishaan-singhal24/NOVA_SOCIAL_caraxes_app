import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
import 'package:nova_social/notifiers/ai_tools/stability_ai/stability_ai_notifier.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/playground/data/playground_suggestions_data.dart';
import 'package:nova_social/views/mobile_view/playground/app_playground_feed_common/playground_feed_tile_mwidget.dart';
import 'package:profanity_filter/profanity_filter.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class PlaygroundMView extends StatefulWidget {
  const PlaygroundMView({super.key});

  @override
  State<PlaygroundMView> createState() => _PlaygroundMViewState();
}

class _PlaygroundMViewState extends State<PlaygroundMView> {
  InitEnum? _isGeneratingResponse;
  late ScrollController _listScrollController;

  final FocusNode _promptFocusNode = FocusNode();
  final TextEditingController _promptController = TextEditingController();

  final _playgroundFormKey = GlobalKey<FormState>();

  late StableDiffusionApiNotifier _stableDiffusionApiNotifier;
  late PlaygroundNotifier _playgroundNotifier;
  late ProfileNotifier _profileNotifier;

  bool _hasPrompt = false;

  @override
  void initState() {
    super.initState();
    _listScrollController = ScrollController();
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    _stableDiffusionApiNotifier =
        Provider.of<StableDiffusionApiNotifier>(context, listen: false);
    _playgroundNotifier =
        Provider.of<PlaygroundNotifier>(context, listen: false);

    _playgroundNotifier.streamAllFeed();
  }

  @override
  void dispose() {
    super.dispose();
    _promptController.dispose();
    _listScrollController.dispose();
    _stableDiffusionApiNotifier.result = null;
  }

  Future<void> _buttonGenerateImage() async {
    try {
      if (_playgroundFormKey.currentState?.validate().not ?? true) {
        return;
      }

      if (_promptController.text.isEmpty) {
        return;
      }

      final filter = ProfanityFilter();
      bool isOffensivePrompt = filter.hasProfanity(_promptController.text);
      if (isOffensivePrompt) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Nova finds this prompt offensive!',
              style: AppTextStyles.text16w400,
            ),
            backgroundColor: Colors.red,
            showCloseIcon: true,
            closeIconColor: AppColors.novaWhite.withOpacity(0.8),
          ),
        );
        return;
      }

      setState(() {
        _isGeneratingResponse = InitEnum.initializing;
      });
      // await Provider.of<StabilityAiNotifier>(context, listen: false)
      //     .textToImageOpenJourney(
      //   inputText: _promptController.text,
      // );
      await _stableDiffusionApiNotifier.textToImageStableDiffusion(
        inputText: _promptController.text,
      );
      if (_stableDiffusionApiNotifier.result?.output?.isEmpty ?? true) {
        return;
      }
      final playgroundFeedModel = PlaygroundFeedModel(
        prompt: _promptController.text,
        generatedFeedUrl:
            _stableDiffusionApiNotifier.result?.output?.first ?? '',
        createdAt: DateTime.now(),
        userDetails: UserMinimum.getUserMinimum(_profileNotifier.userProfile),
      );
      await _playgroundNotifier.createFeed(playgroundFeedModel);
      setState(() {
        _isGeneratingResponse = _stableDiffusionApiNotifier.result != null
            ? InitEnum.initialized
            : InitEnum.uninitialized;
        _promptController.text = '';
        _hasPrompt = false;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _stableDiffusionApiNotifier =
        Provider.of<StableDiffusionApiNotifier>(context);
    _playgroundNotifier = Provider.of<PlaygroundNotifier>(context);

    final playgroundFeedList = _index == 0
        ? _playgroundNotifier.personalFeedList
        : _playgroundNotifier.feedList;
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 0,
          ),
          child: Form(
            key: _playgroundFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizedBoxWithHeight(24),
                Row(
                  children: [
                    AppIconButton(
                      icon: Icons.arrow_back,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Text(
                        'Magic AI Art',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.text24w700,
                      ),
                    ),
                    sizedBoxWithWidth(24),
                  ],
                ),
                sizedBoxWithHeight(24),
                _buildNavigationTile(),
                sizedBoxWithHeight(24),
                if (_isGeneratingResponse == InitEnum.initializing) ...{
                  PlaygroundFeedTileMWidget(
                    showLoader: true,
                    playgroundFeedModel: PlaygroundFeedModel(
                      createdAt: DateTime.now(),
                      userDetails: UserMinimum.getUserMinimum(
                          _profileNotifier.userProfile),
                      prompt: _promptController.text,
                    ),
                  ),
                } else ...{
                  Flexible(
                    child: ListView.separated(
                      reverse: _index == 0 ? false : true,
                      separatorBuilder: (context, index) =>
                          sizedBoxWithHeight(32),
                      controller: _listScrollController,
                      itemCount: playgroundFeedList?.length ?? 0,
                      itemBuilder: (context, index) {
                        if ((playgroundFeedList?.isNotEmpty ?? false) &&
                            (playgroundFeedList?[index] != null)) {
                          return PlaygroundFeedTileMWidget(
                            playgroundFeedModel: playgroundFeedList![index]!,
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                },
                if (_index == 1 &&
                    (_isGeneratingResponse != InitEnum.initializing)) ...{
                  sizedBoxWithHeight(16),
                  ConstrainedBox(
                    constraints: BoxConstraints.loose(
                      Size(double.maxFinite, 80.h),
                    ),
                    child: AppMaterialInputField(
                      focusNode: _promptFocusNode,
                      label: 'Imagine',
                      hint: 'Write a prompt to generate image..',
                      controller: _promptController,
                      isRequired: true,
                      textInputAction: TextInputAction.go,
                      onSubmit: (value) {
                        _promptFocusNode.unfocus();
                        if (_isGeneratingResponse != InitEnum.initializing) {
                          _buttonGenerateImage().then((value) {
                            _listScrollController.animateTo(
                              _listScrollController.position.minScrollExtent,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          });
                        }
                        if (_isGeneratingResponse == InitEnum.uninitialized) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Error generating image',
                                style: AppTextStyles.text14w400,
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      onChanged: (value) {
                        if (value?.isEmpty ?? true) {
                          _hasPrompt = false;
                        } else {
                          _hasPrompt = true;
                        }
                        setState(() {});
                      },
                    ),
                  ),
                  sizedBoxWithHeight(16),
                  CustomButton(
                    text: _hasPrompt ? 'Generate' : 'Surprise Me',
                    onPressed: () {
                      _promptFocusNode.unfocus();
                      if (_hasPrompt) {
                        if (_isGeneratingResponse != InitEnum.initializing) {
                          _buttonGenerateImage().then((value) {
                            _listScrollController.animateTo(
                              _listScrollController.position.minScrollExtent,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          });
                        }
                        if (_isGeneratingResponse == InitEnum.uninitialized) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                              'Error generating image',
                            ),
                            backgroundColor: Colors.red,
                          ));
                        }
                      } else {
                        PlaygroundSuggestionsData.playgroundSuggestionsList
                            .shuffle();
                        _promptController.text = PlaygroundSuggestionsData
                                .playgroundSuggestionsList.first.prompt ??
                            '';
                        if (_isGeneratingResponse != InitEnum.initializing) {
                          _buttonGenerateImage().then((value) {});
                        }
                        if (_isGeneratingResponse == InitEnum.uninitialized) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Error generating image',
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Expanded(
                  //       child: Text(
                  //         'Confused what to generate? Try this: ',
                  //         style: AppTextStyles.text14w400.copyWith(
                  //           color: AppColors.novaWhite.withOpacity(0.4),
                  //         ),
                  //         maxLines: 2,
                  //         overflow: TextOverflow.ellipsis,
                  //       ),
                  //     ),
                  //     sizedBoxWithWidth(8),
                  //     CustomButton(
                  //       width: 108.w,
                  //       height: 30.h,
                  //       text: 'Surprise Me',
                  //       onPressed: () {
                  //         PlaygroundSuggestionsData.playgroundSuggestionsList
                  //             .shuffle();
                  //         _promptController.text = PlaygroundSuggestionsData
                  //                 .playgroundSuggestionsList.first.prompt ??
                  //             '';
                  //         if (_isGeneratingResponse != InitEnum.initializing) {
                  //           _buttonGenerateImage();
                  //         }
                  //         if (_isGeneratingResponse == InitEnum.uninitialized) {
                  //           ScaffoldMessenger.of(context).showSnackBar(
                  //             const SnackBar(
                  //               content: Text(
                  //                 'Error generating image',
                  //               ),
                  //               backgroundColor: Colors.red,
                  //             ),
                  //           );
                  //         }
                  //       },
                  //     ),
                  //   ],
                  // ),
                },
                sizedBoxWithHeight(16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int _index = 1;
  Widget _buildNavigationTile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _index = 0;
              });
            },
            child: SizedBox(
              width: double.maxFinite,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _index == 0
                          ? AppColors.novaDarkIndigo
                          : ThemeHandler.backgroundColor(),
                    ),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Personal',
                      style: _index == 0
                          ? AppTextStyles.text16w800
                          : AppTextStyles.text16w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        sizedBoxWithWidth(8),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _index = 1;
              });
            },
            child: SizedBox(
              width: double.maxFinite,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _index == 1
                          ? AppColors.novaDarkIndigo
                          : ThemeHandler.backgroundColor(),
                    ),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Social',
                      style: _index == 1
                          ? AppTextStyles.text16w800
                          : AppTextStyles.text16w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
