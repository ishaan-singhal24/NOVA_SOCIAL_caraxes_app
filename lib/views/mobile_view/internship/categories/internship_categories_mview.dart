import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/internship/internship_notifier.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

class InternshipCategoriesMView extends StatefulWidget {
  const InternshipCategoriesMView({super.key});

  @override
  State<InternshipCategoriesMView> createState() =>
      _InternshipCategoriesMViewState();
}

class _InternshipCategoriesMViewState extends State<InternshipCategoriesMView> {
  late InternshipNotifier internshipNotifier;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    internshipNotifier =
        Provider.of<InternshipNotifier>(context, listen: false);
    internshipNotifier.fetchInternshipCategories();
  }

  @override
  Widget build(BuildContext context) {
    final internshipNotifier = Provider.of<InternshipNotifier>(context);
    final internshipCategoriesList =
        internshipNotifier.internshipCategoriesList;
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
                      'Internships',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.text24w700,
                    ),
                  ),
                  sizedBoxWithWidth(24),
                ],
              ),
              sizedBoxWithHeight(32),
              Expanded(
                child: Visibility(
                  visible: internshipCategoriesList?.isNotEmpty ?? false,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        sizedBoxWithHeight(24),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          internshipNotifier.currentCategoryModel =
                              internshipCategoriesList?[index];
                          context
                              .push(MobileRouter.internshipsByCategoriesRoute);
                        },
                        child: Container(
                          height: 180.h,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: CachedNetworkImage(
                              imageUrl: internshipCategoriesList?[index]
                                      .coverImageUrl ??
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
                      );
                    },
                    itemCount: internshipCategoriesList?.length ?? 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
