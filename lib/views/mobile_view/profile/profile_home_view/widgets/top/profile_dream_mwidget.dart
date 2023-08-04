import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/widget_enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
import 'package:nova_social/routes/mobile/explore_routes.dart/explore_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';

class ProfileDreamMWidget extends StatefulWidget {
  final ProfileMViewArgs args;
  const ProfileDreamMWidget({
    super.key,
    required this.args,
  });

  @override
  State<ProfileDreamMWidget> createState() => _ProfileDreamMWidgetState();
}

class _ProfileDreamMWidgetState extends State<ProfileDreamMWidget> {
  final PageController dreamPageController = PageController();
  int _dreamPage = 0;

  final List<ProfileAddEditDreamType> _dreamTypes = [
    ProfileAddEditDreamType.colleges,
    ProfileAddEditDreamType.careers,
    ProfileAddEditDreamType.countries,
  ];
  List<List<DreamInterface>?> dreams = [];

  final List<Color> dummyColor = [
    AppColors.novaBlue,
    AppColors.novaDarkGreen,
    AppColors.novaDarkYellow,
    AppColors.novaLightGreen,
    AppColors.novaOrange,
    AppColors.novaPeach,
    AppColors.novaPink,
    AppColors.novaPurple,
  ];

  void populateDreams() {
    final user = widget.args.profile;
    dreams.clear();
    if ((user?.dreamColleges?.isNotEmpty ?? false) ||
        (widget.args.isCurrentUser ?? false)) {
      dreams.add(user?.dreamColleges);
    }

    if ((user?.dreamCareers?.isNotEmpty ?? false) ||
        (widget.args.isCurrentUser ?? false)) {
      dreams.add(user?.dreamCareers);
    }

    if ((user?.dreamCountries?.isNotEmpty ?? false) ||
        (widget.args.isCurrentUser ?? false)) {
      dreams.add(user?.dreamCountries);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    populateDreams();
  }

  Widget renderPage(
    String title,
    bool? isCurrentUser,
    List<DreamInterface>? dreams,
    ProfileAddEditDreamType dreamType,
  ) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 24.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: ThemeHandler.mutedPlusColor(nonInverse: false),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.text18w500,
              ),
              if (isCurrentUser ?? false) ...{
                AppIconButton(
                  color: AppColors.novaWhite.withOpacity(0.8),
                  icon: dreams?.isEmpty ?? true ? Icons.add : Icons.edit,
                  onTap: () {
                    context.push(
                      AddEditMRouter.addEditDreamRoute,
                      extra: dreamType,
                    );
                  },
                ),
              },
            ],
          ),
          sizedBoxWithHeight(16),
          Expanded(
            child: Column(
              mainAxisAlignment: (dreams?.isEmpty ?? true)
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceAround,
              children: [
                if (dreams?.isEmpty ?? true) ...{
                  Center(
                    child: Text(
                      'Add your dream ${dreamType.name}',
                      style: AppTextStyles.text12w400,
                    ),
                  ),
                } else ...{
                  ...dreams!.mapIndexed(
                    (index, DreamInterface item) {
                      int i = (item.name ?? '').length % 8;
                      Color color = dummyColor[i];
                      return InkWell(
                        onTap: () {
                          context.push(
                            ExploreMRouter.exploreDreamRoute,
                            extra: ExploreDreamsMViewArgs(
                              dreamType: dreamType,
                              selectedDreamIndex: index,
                              profileArgs: widget.args,
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            if (dreamType ==
                                ProfileAddEditDreamType.careers) ...{
                              CachedNetworkImage(
                                imageUrl: item.iconUrl ?? '',
                                color: color,
                                errorWidget: (context, url, error) =>
                                    const SizedBox(),
                                width: 32.r,
                                height: 32.r,
                              ),
                            } else ...{
                              AppNetworkImageM(
                                url: item.iconUrl ?? '',
                                width: 32.r,
                                height: 32.r,
                              ),
                            },
                            sizedBoxWithWidth(16),
                            Flexible(
                              child: Text(
                                item.name ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.text14w700.darkModeSupport,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                },
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (dreams.isEmpty) {
      return const SizedBox();
    }
    return Column(
      children: [
        sizedBoxWithHeight(16),
        SizedBox(
          width: double.maxFinite,
          height: 246.h,
          child: Stack(
            children: [
              Positioned.fill(
                child: PageView.builder(
                  controller: dreamPageController,
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: (p) {
                    _dreamPage = p;
                    setState(() {});
                  },
                  itemBuilder: (context, index) {
                    return renderPage(
                      'Dream ${_dreamTypes[index].name.firstCap}',
                      widget.args.isCurrentUser,
                      dreams[index],
                      _dreamTypes[index],
                    );
                  },
                  itemCount: dreams.length,
                ),
              ),
              if (_dreamPage > 0) ...{
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 8.w,
                  child: InkWell(
                    onTap: () {
                      dreamPageController.animateToPage(
                        _dreamPage - 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    },
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ThemeHandler.mutedColor(nonInverse: false)
                            .withOpacity(0.5),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 16.r,
                        color: ThemeHandler.widgetColor(),
                      ),
                    ),
                  ),
                ),
              },
              if (_dreamPage < (dreams.length - 1)) ...{
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 8.w,
                  child: InkWell(
                    onTap: () {
                      dreamPageController.animateToPage(
                        _dreamPage + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    },
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ThemeHandler.mutedColor(nonInverse: false)
                            .withOpacity(0.5),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 16.r,
                        color: ThemeHandler.widgetColor(),
                      ),
                    ),
                  ),
                ),
              },
            ],
          ),
        ),
        sizedBoxWithHeight(8),
        SizedBox(
          height: 8.h,
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                dreams.length,
                (index) => InkWell(
                  onTap: () {
                    dreamPageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  },
                  child: Container(
                    width: 24.w,
                    height: double.maxFinite,
                    margin: EdgeInsets.symmetric(
                      horizontal: 8.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: index == _dreamPage
                          ? AppColors.novaDarkIndigo
                          : AppColors.novaViolet.withOpacity(0.15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: Column(
            children: [
              sizedBoxWithHeight(24),
              const AppDividerMwidget(),
              sizedBoxWithHeight(24),
            ],
          ),
        ),
      ],
    );
  }
}
