import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:provider/provider.dart';

class AddEditSocialLinksWidget extends StatefulWidget {
  final String columnHead;
  final String textFieldHintText;
  final TextEditingController textEditingController;
  final GlobalKey<FormState> formKey;
  final Function(List<Social>?) socialsCallback;
  const AddEditSocialLinksWidget({
    Key? key,
    required this.columnHead,
    required this.textFieldHintText,
    required this.textEditingController,
    required this.socialsCallback,
    required this.formKey,
  }) : super(key: key);

  @override
  State<AddEditSocialLinksWidget> createState() =>
      _AddEditSocialLinksWidgetState();
}

class _AddEditSocialLinksWidgetState extends State<AddEditSocialLinksWidget> {
  final FocusNode _textFieldFocus = FocusNode();
  Color _color = ThemeHandler.mutedPlusColor(nonInverse: false);
  // final _socialFormKey = GlobalKey<FormState>();

  List<Social>? socials;

  List<SocialPlatforms> platforms = [
    SocialPlatforms.github,
    SocialPlatforms.linkedin,
    SocialPlatforms.twitter,
    SocialPlatforms.website,
  ];

  int _selectedSocial = 0;

  void _populateSocial() {
    socials = Provider.of<ProfileNotifier>(context, listen: false)
            .userProfile
            ?.socials
            ?.toList() ??
        [];
    widget.textEditingController.text = socials
            ?.firstWhere((e) => e.platform == SocialPlatforms.github,
                orElse: () => Social())
            .url ??
        '';
  }

  @override
  void initState() {
    _populateSocial();
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {
          _color = ThemeHandler.backgroundColor();
        });
      } else {
        setState(() {
          _color = ThemeHandler.mutedPlusColor(nonInverse: false);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.columnHead,
          style: AppTextStyles.text14w600,
        ),
        sizedBoxWithHeight(8),
        Wrap(
          runSpacing: 4.h,
          children: <Widget>[
            for (var i = 0; i < platforms.length; i++)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: GestureDetector(
                  onTap: () {
                    if (widget.formKey.currentState?.validate().not ?? true) {
                      return;
                    }
                    widget.textEditingController.text = socials
                            ?.firstWhere((e) => e.platform == platforms[i],
                                orElse: () => Social())
                            .url ??
                        '';
                    _selectedSocial = i;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 4.w,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _selectedSocial == i
                            ? AppColors.novaIndigo
                            : ThemeHandler.mutedColor(),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      platforms[i].name,
                      style: _selectedSocial == i
                          ? AppTextStyles.text12w400.indigo
                          : AppTextStyles.text12w400.muted,
                    ),
                  ),
                ),
              ),
          ],
        ),
        sizedBoxWithHeight(8),
        TextFormField(
          controller: widget.textEditingController,
          focusNode: _textFieldFocus,
          style: AppTextStyles.text14w600,
          textInputAction: TextInputAction.done,
          validator: (s) {
            if (s?.isEmpty ?? false) {
              return null;
            }
            if (Uri.tryParse(s ?? '')?.isAbsolute.not ?? true) {
              return AppStrings.enterValidLink;
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: _color,
            hoverColor: ThemeHandler.mutedPlusColor(nonInverse: false),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 16.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: AppColors.novaIndigo,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: AppColors.novaIndigo,
                width: 1,
              ),
            ),
            hintText: widget.textFieldHintText,
            hintStyle: AppTextStyles.text12w400.muted,
          ),
          onChanged: (value) {
            Social social = Social(
              platform: SocialPlatforms.values[_selectedSocial],
              url: widget.textEditingController.text,
            );
            int i =
                socials?.indexWhere((e) => e.platform == social.platform) ?? -1;
            if (i > -1) {
              socials?[i] = social;
            } else {
              socials ??= [];
              socials?.add(social);
            }
            if (value.isEmpty) {
              socials?.removeAt(i);
            }
            widget.socialsCallback(socials);
          },
        ),
      ],
    );
  }
}
