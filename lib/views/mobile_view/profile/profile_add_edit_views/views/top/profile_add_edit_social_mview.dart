import 'package:flutter/material.dart';

import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/social_platforms.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/theme_handler.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

import '../../widgets/profile_add_edit_app_bar_mwidget.dart';

class ProfileAddEditSocialMView extends StatefulWidget {
  final bool isAdd;
  const ProfileAddEditSocialMView({
    super.key,
    required this.isAdd,
  });

  @override
  State<ProfileAddEditSocialMView> createState() =>
      _ProfileAddEditSocialMViewState();
}

class _ProfileAddEditSocialMViewState extends State<ProfileAddEditSocialMView> {
  final _socialFormKey = GlobalKey<FormState>();

  final TextEditingController _githubLinkController = TextEditingController();
  final TextEditingController _linkedinLinkController = TextEditingController();
  final TextEditingController _twitterLinkController = TextEditingController();
  final TextEditingController _instagramLinkController =
      TextEditingController();
  final TextEditingController _portfolioLinkController =
      TextEditingController();

  ProfileNotifier? _profileNotifier;

  List<Social>? socials;

  List<SocialPlatforms> platforms = [
    SocialPlatforms.github,
    SocialPlatforms.linkedin,
    SocialPlatforms.twitter,
    SocialPlatforms.instagram,
    SocialPlatforms.website,
  ];

  int _selectedPlatform = 0;

  @override
  void initState() {
    super.initState();
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    _populateSocial();
  }

  void _populateSocial() {
    socials = _profileNotifier?.userProfile?.socials?.toList() ?? [];
    _githubLinkController.text = socials
            ?.firstWhere((e) => e.platform == SocialPlatforms.github,
                orElse: () => Social())
            .url ??
        '';
    _twitterLinkController.text = socials
            ?.firstWhere((e) => e.platform == SocialPlatforms.twitter,
                orElse: () => Social())
            .url ??
        '';
    _instagramLinkController.text = socials
            ?.firstWhere((e) => e.platform == SocialPlatforms.instagram,
                orElse: () => Social())
            .url ??
        '';
    _linkedinLinkController.text = socials
            ?.firstWhere((e) => e.platform == SocialPlatforms.linkedin,
                orElse: () => Social())
            .url ??
        '';
    _portfolioLinkController.text = socials
            ?.firstWhere((e) => e.platform == SocialPlatforms.website,
                orElse: () => Social())
            .url ??
        '';
  }

  void _saveValue(String? value, TextEditingController textEditingController) {
    Social social = Social(
      platform: SocialPlatforms.values[_selectedPlatform],
      url: textEditingController.text,
    );
    int i = socials?.indexWhere((e) => e.platform == social.platform) ?? -1;
    if (i > -1) {
      socials?[i] = social;
    } else {
      socials ??= [];
      socials?.add(social);
    }
    if (value?.isEmpty ?? true) {
      socials?.removeAt(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: Form(
          key: _socialFormKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sizedBoxWithHeight(36),
                  ProfileAddEditAppBarMWidget(
                    title: 'Social Links',
                    isAdd: widget.isAdd,
                  ),
                  sizedBoxWithHeight(36),
                  AppMaterialInputField(
                    label: 'Github',
                    hint: 'https://xyz.com',
                    controller: _githubLinkController,
                    maxLines: 1,
                    isRequired: false,
                    isLinkTypeInput: true,
                    validateSocialWith: 'github',
                    onChanged: (value) {
                      _selectedPlatform = 0;
                      _saveValue(value, _githubLinkController);
                    },
                  ),
                  sizedBoxWithHeight(24),
                  AppMaterialInputField(
                    label: 'Linkedin',
                    hint: 'https://xyz.com',
                    controller: _linkedinLinkController,
                    maxLines: 1,
                    isRequired: false,
                    isLinkTypeInput: true,
                    validateSocialWith: 'linkedin',
                    onChanged: (value) {
                      _selectedPlatform = 1;
                      _saveValue(value, _linkedinLinkController);
                    },
                  ),
                  sizedBoxWithHeight(24),
                  AppMaterialInputField(
                    label: 'Twitter',
                    hint: 'https://xyz.com',
                    controller: _twitterLinkController,
                    maxLines: 1,
                    isRequired: false,
                    isLinkTypeInput: true,
                    validateSocialWith: 'twitter',
                    onChanged: (value) {
                      _selectedPlatform = 2;
                      _saveValue(value, _twitterLinkController);
                    },
                  ),
                  sizedBoxWithHeight(24),
                  AppMaterialInputField(
                    label: 'Instagram',
                    hint: 'https://xyz.com',
                    controller: _instagramLinkController,
                    maxLines: 1,
                    isRequired: false,
                    isLinkTypeInput: true,
                    validateSocialWith: 'instagram',
                    onChanged: (value) {
                      _selectedPlatform = 3;
                      _saveValue(value, _instagramLinkController);
                    },
                  ),
                  sizedBoxWithHeight(24),
                  AppMaterialInputField(
                    label: 'Portfolio',
                    hint: 'https://xyz.com',
                    controller: _portfolioLinkController,
                    maxLines: 1,
                    isRequired: false,
                    isLinkTypeInput: true,
                    onChanged: (value) {
                      _selectedPlatform = 4;
                      _saveValue(value, _portfolioLinkController);
                    },
                  ),
                  sizedBoxWithHeight(24),
                  CustomButton(
                    onPressed: () async {
                      if (_socialFormKey.currentState?.validate() ?? false) {
                        UserModel? userModel = _profileNotifier?.userProfile;
                        userModel = userModel?.copyWith(socials: socials);
                        await _profileNotifier
                            ?.saveProfile(userModel!)
                            .then((value) {
                          Navigator.pop(context);
                        });
                      }
                    },
                    text:
                        widget.isAdd ? AppStrings.add : AppStrings.saveChanges,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
