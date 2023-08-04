import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_strings.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/auth/auth_notifier.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/widgets/widgets.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:provider/provider.dart';

class ProfileAddEditSocial extends StatefulWidget {
  final bool isAdd;
  const ProfileAddEditSocial({Key? key, this.isAdd = true}) : super(key: key);

  @override
  State<ProfileAddEditSocial> createState() => _ProfileAddEditSocialState();
}

class _ProfileAddEditSocialState extends State<ProfileAddEditSocial> {
  final _socialFormKey = GlobalKey<FormState>();
  final TextEditingController _socialLinkController = TextEditingController();

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
    _socialLinkController.text = socials
            ?.firstWhere((e) => e.platform == SocialPlatforms.github,
                orElse: () => Social())
            .url ??
        '';
  }

  void _onChangePlatform(int index) {
    if (_socialFormKey.currentState?.validate().not ?? true) {
      return;
    }
    _selectedPlatform = index;
    _socialLinkController.text = socials
            ?.firstWhere((e) => e.platform == platforms[_selectedPlatform],
                orElse: () => Social())
            .url ??
        '';
    setState(() {});
  }

  void _saveValue(String? value) {
    Social social = Social(
      platform: SocialPlatforms.values[_selectedPlatform],
      url: _socialLinkController.text,
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
    final bool kIsLargeScreen = !ResponsiveWidget.isSmallScreen();
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: AppColors.novaIndigo.withOpacity(0.5),
        child: FittedBox(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: kIsLargeScreen
                  ? ScreenUtil.instance.width * 0.5
                  : ScreenUtil.instance.width * 0.8,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ThemeHandler.backgroundColor(),
              boxShadow: const [
                BoxShadow(),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(16.w),
            child: Form(
              key: _socialFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AddEditTopBarWidget(
                    title: 'Social Links',
                    isAdd: widget.isAdd,
                  ),
                  sizedBoxWithHeight(16),
                  AddEditToggleFormWidget(
                    items: platforms.map((e) => e.name).toList(),
                    selected: _selectedPlatform,
                    onTap: (i) {
                      _onChangePlatform(i);
                    },
                  ),
                  sizedBoxWithHeight(16),
                  sizedBoxWithHeight(16),
                  AppMaterialInputField(
                    label: 'Link',
                    hint: 'https://xyz.com',
                    controller: _socialLinkController,
                    isRequired: false,
                    isLinkTypeInput: true,
                    onChanged: (value) {
                      _saveValue(value);
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
                  sizedBoxWithHeight(16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
