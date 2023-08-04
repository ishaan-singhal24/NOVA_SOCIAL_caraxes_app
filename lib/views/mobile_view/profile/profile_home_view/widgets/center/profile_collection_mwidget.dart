import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/views/center/profile_add_edit_collection_mview.dart';
import 'dart:math';

class ProfileCollectionMWidget extends StatefulWidget {
  final ProfileMViewArgs args;
  const ProfileCollectionMWidget({
    super.key,
    required this.args,
  });
  @override
  State<ProfileCollectionMWidget> createState() =>
      _ProfileCollectionMWidgetState();
}

class _ProfileCollectionMWidgetState extends State<ProfileCollectionMWidget> {
  //List of dummy collections
  final List<UserCollection> _dummyUserCollections = const [
    UserCollection(
      id: 'Projects',
      name: 'Projects',
      tagline: 'Here\’s what i have built so far!',
    ),
    UserCollection(
      id: 'Certificates',
      name: 'Certificates',
      tagline: 'You can show your certificates here..',
    ),
    UserCollection(
      id: 'Publications',
      name: 'Publications',
      tagline: 'Showcase your publications here..',
    ),
  ];
  //List of suggested collections
  List<UserCollection>? _suggestedCollections;
  //List of dummy colors
  final List<Color> _dummyColor = [
    AppColors.novaBlue,
    AppColors.novaDarkGreen,
    AppColors.novaDarkYellow,
    AppColors.novaLightGreen,
    AppColors.novaOrange,
    AppColors.novaPeach,
    AppColors.novaPink,
    AppColors.novaPurple,
  ];

  //Individual Collection card tile
  Widget _buildCollectionCard(
    UserCollection? collection, {
    required int index,
    String? username,
    required bool isSuggested,
  }) {
    int colorIndex = (collection?.name?.length ?? 0) % 8;
    Color color = _dummyColor[colorIndex];
    return SizedBox(
      height: 196.h,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: isSuggested
                  ? ThemeHandler.widgetColor().withOpacity(0.5)
                  : (collection?.color ?? color),
              borderRadius: BorderRadius.circular(24.r),
            ),
          ),
          Positioned.fill(
            top: 10.h,
            child: InkWell(
              hoverColor: ThemeHandler.backgroundColor(),
              onTap: () {
                isSuggested.not && collection?.id != null
                    ? context.push(
                        MobileRouter.userCollectionRoute,
                        extra: UserCollectionItemMViewArgs(
                          collectionId: collection!.id!,
                          profileArgs: widget.args,
                        ),
                      )
                    : null;
              },
              child: Container(
                height: 186.h,
                decoration: BoxDecoration(
                  color: ThemeHandler.mutedPlusColor(nonInverse: false),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.w,
                    vertical: 32.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              collection?.name ?? 'Projects',
                              style: AppTextStyles.text20w600.copyWith(
                                color: isSuggested
                                    ? ThemeHandler.widgetColor()
                                        .withOpacity(0.5)
                                    : ThemeHandler.widgetColor(),
                              ),
                            ),
                            sizedBoxWithHeight(8),
                            Text(
                              collection?.tagline ??
                                  'Here\'s what i have done so far',
                              style: AppTextStyles.text14w400.copyWith(
                                color: isSuggested
                                    ? ThemeHandler.widgetColor()
                                        .withOpacity(0.5)
                                    : ThemeHandler.widgetColor(),
                              ),
                            ),
                            sizedBoxWithHeight(8),
                            Text(
                              '${collection?.item?.length ?? '0'} Item',
                              style: AppTextStyles.text14w400.copyWith(
                                color: isSuggested
                                    ? ThemeHandler.widgetColor()
                                        .withOpacity(0.5)
                                    : ThemeHandler.widgetColor(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      sizedBoxWithHeight(8),
                      if (_isCurrentUser) ...{
                        Row(
                          children: [
                            const Spacer(),
                            AppIconButton(
                              icon: isSuggested ? Icons.add : Icons.edit,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      ProfileAddEditCollectionMPopup(
                                    isAdd: isSuggested ? true : false,
                                    editingIndex: index,
                                    isSuggestedId:
                                        isSuggested ? collection?.id : null,
                                    isSuggestedName:
                                        isSuggested ? collection?.name : null,
                                  ),
                                ).then((value) {
                                  if (isSuggested) {
                                    setState(() {
                                      _suggestedCollections!.removeWhere(
                                          (element) =>
                                              element.id == collection?.id);
                                    });
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      },
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  late bool _isCurrentUser;
  late UserModel? _userModel;
  late List<UserCollection>? _collections;

  void _updateSuggestedCollection() {
    for (int i = 0; i < _dummyUserCollections.length; i++) {
      final collection = _collections
          ?.where((element) => element.id == _dummyUserCollections[i].id);
      if (collection?.isEmpty ?? true) {
        _suggestedCollections ??= [];
        _suggestedCollections!.add(_dummyUserCollections[i]);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_isCurrentUser) {
        _updateSuggestedCollection();
        setState(() {});
      }
    });
  }

  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();
  final ScrollController _indicatorScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _isCurrentUser = widget.args.isCurrentUser ?? false;
    _userModel = widget.args.profile;
    _collections = _userModel?.collections;
    final name = _userModel?.name?.split(' ');
    if ((_collections?.isEmpty ?? true) && _isCurrentUser.not) {
      return const SizedBox();
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxWithHeight(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${(name?[0] ?? '')}\'s Collections',
                style: AppTextStyles.text20w500,
              ),
              if (_isCurrentUser) ...{
                AppIconButton(
                  icon: Icons.add,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          const ProfileAddEditCollectionMPopup(
                        isAdd: true,
                      ),
                    );
                  },
                ),
              },
            ],
          ),
          sizedBoxWithHeight(4),
          Text(
            '${_collections?.length ?? '0'} Collections',
            style: AppTextStyles.text14w300,
          ),
          if ((_suggestedCollections?.isNotEmpty ?? false) &&
              _isCurrentUser) ...{
            sizedBoxWithHeight(16),
            Text(
              'Suggested',
              style: AppTextStyles.text16w600,
            ),
          },
          sizedBoxWithHeight(32),
          Column(
            children: [
              CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: (_collections?.length ?? 0) +
                    (_suggestedCollections?.length ?? 0),
                itemBuilder: (context, index, _) {
                  var collectionLength = _collections?.length ?? 0;
                  if ((index >= collectionLength) &&
                      (_suggestedCollections?.isNotEmpty ?? false)) {
                    return _buildCollectionCard(
                      _suggestedCollections![index - collectionLength],
                      index: index,
                      username: _userModel?.username,
                      isSuggested: true,
                    );
                  } else if (index < collectionLength &&
                      collectionLength != 0) {
                    return _buildCollectionCard(
                      _collections?[index],
                      index: index,
                      username: _userModel?.username,
                      isSuggested: false,
                    );
                  }
                  return Container();
                },
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: false,
                  aspectRatio: 1.6,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      if (index < 6) {
                        _indicatorScrollController.jumpTo(
                            _indicatorScrollController
                                .position.minScrollExtent);
                      }
                      if (index == 6) {
                        _indicatorScrollController.jumpTo(
                            _indicatorScrollController
                                .position.maxScrollExtent);
                      }
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 24.h,
                width: min(((_collections?.length ?? 0) * 40),
                    ScreenUtil.instance.screenWidth * 0.6),
                child: ListView(
                  controller: _indicatorScrollController,
                  scrollDirection: Axis.horizontal,
                  children: (_collections?.isNotEmpty ?? false)
                      ? _collections!.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () =>
                                _carouselController.animateToPage(entry.key),
                            child: Container(
                              width: 24.w,
                              height: 24.h,
                              margin: EdgeInsets.symmetric(
                                vertical: 8.h,
                                horizontal: 8.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: _currentIndex == entry.key
                                    ? AppColors.novaDarkIndigo
                                    : AppColors.novaViolet.withOpacity(0.15),
                              ),
                            ),
                          );
                        }).toList()
                      : [],
                ),
              ),
            ],
          ),
          sizedBoxWithHeight(24),
          const AppDividerMwidget(),
          sizedBoxWithHeight(24),
        ],
      ),
    );
  }
}
