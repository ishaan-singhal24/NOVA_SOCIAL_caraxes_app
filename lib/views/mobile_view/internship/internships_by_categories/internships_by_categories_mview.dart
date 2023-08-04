import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/internship/internship_notifier.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

class InternshipsByCategoriesMView extends StatefulWidget {
  const InternshipsByCategoriesMView({super.key});

  @override
  State<InternshipsByCategoriesMView> createState() =>
      _InternshipsByCategoriesMViewState();
}

class _InternshipsByCategoriesMViewState
    extends State<InternshipsByCategoriesMView> {
  late InternshipNotifier _internshipNotifier;
  late ProfileNotifier _profileNotifier;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _internshipNotifier =
        Provider.of<InternshipNotifier>(context, listen: false);
    if (_internshipNotifier.currentCategoryModel?.id?.isNotEmpty ?? false) {
      _internshipNotifier.fetchInternships(
          categoryId: _internshipNotifier.currentCategoryModel?.id ?? '');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _internshipNotifier.currentCategoryModel = null;
    _internshipNotifier.currentCategoryInternshipsList?.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _profileNotifier = Provider.of<ProfileNotifier>(context);
    _internshipNotifier = Provider.of<InternshipNotifier>(context);

    final internshipsList = _internshipNotifier.currentCategoryInternshipsList;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              sizedBoxWithHeight(32),
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
                      '${_internshipNotifier.currentCategoryModel?.name ?? ''} Internships',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.text24w700,
                    ),
                  ),
                  sizedBoxWithWidth(24),
                ],
              ),
              sizedBoxWithHeight(32),
              Container(
                height: 180.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CachedNetworkImage(
                    imageUrl: _internshipNotifier
                            .currentCategoryModel?.coverImageUrl ??
                        '',
                    fit: BoxFit.cover,
                    height: 180.h,
                    width: double.maxFinite,
                    errorWidget: (_, __, ___) => Text(
                      'Error occured while loading image',
                      style: AppTextStyles.text14w400.white,
                    ),
                  ),
                ),
              ),
              sizedBoxWithHeight(16),
              Text(
                'Internships Available',
                style: AppTextStyles.text16w600,
              ),
              sizedBoxWithHeight(16),
              if ((internshipsList?.isNotEmpty ?? false)) ...{
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => sizedBoxWithHeight(8),
                    itemBuilder: (context, index) {
                      if (internshipsList?[index] == null ||
                          (internshipsList?[index].id?.isEmpty ?? true)) {
                        return const SizedBox();
                      }
                      bool isUserAlreadyInterested =
                          _internshipNotifier.isInterestedInInternship(
                        internshipModel: internshipsList?[index],
                        userModel: _profileNotifier.userProfile,
                      );
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 24.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.r),
                          color: ThemeHandler.mutedPlusColor(nonInverse: false),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                if (internshipsList?[index]
                                        .companyIconUrl
                                        ?.isNotEmpty ??
                                    false) ...{
                                  Container(
                                    height: 40.h,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.r),
                                      child: CachedNetworkImage(
                                        imageUrl: internshipsList?[index]
                                                .companyIconUrl ??
                                            '',
                                        fit: BoxFit.cover,
                                        height: 40.h,
                                        width: double.maxFinite,
                                        errorWidget: (_, __, ___) => Text(
                                          'Error occured while loading image',
                                          style: AppTextStyles.text14w400.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  sizedBoxWithWidth(16),
                                },
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      internshipsList?[index].title ?? '',
                                      style: AppTextStyles.text16w600,
                                    ),
                                    sizedBoxWithHeight(8),
                                    Text(
                                      '${internshipsList?[index].companyName ?? ''}, ${internshipsList?[index].location ?? ''}',
                                      style: AppTextStyles.text16w600,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            sizedBoxWithHeight(16),
                            Text(
                              internshipsList?[index].internshipDescription ??
                                  '',
                              style: AppTextStyles.text12w400,
                            ),
                            sizedBoxWithHeight(16),
                            CustomButton(
                              height: 32.h,
                              text: isUserAlreadyInterested
                                  ? 'Interested'
                                  : 'Express Interest',
                              onPressed: () async {
                                if (isUserAlreadyInterested.not) {
                                  await _internshipNotifier
                                      .addInterestedUserToInternship(
                                    internshipModel: internshipsList?[index],
                                    userModel: _profileNotifier.userProfile,
                                  );
                                  setState(() {});
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: internshipsList?.length ?? 0,
                  ),
                ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
