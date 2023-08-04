import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/routes.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/add_edit_profile.dart';
import 'package:provider/provider.dart';

class ProfileCollectionsWidget extends StatefulWidget {
  const ProfileCollectionsWidget({super.key});
  @override
  State<ProfileCollectionsWidget> createState() =>
      _ProfileCollectionsWidgetState();
}

class _ProfileCollectionsWidgetState extends State<ProfileCollectionsWidget> {
  //List of dummy collections
  final List<UserCollection> _dummyUserCollections = const [
    UserCollection(
      id: 'Projects',
      name: 'Projects',
      tagline: 'Here\’s what i have done so far!',
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
  //Controller
  late ScrollController _controller;
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
      height: double.maxFinite,
      width: ScreenUtil.instance.width * 0.21,
      child: Stack(
        children: [
          Positioned.fill(
            bottom: 16.h,
            left: 2.w,
            right: 2.w,
            child: Container(
              decoration: BoxDecoration(
                color: isSuggested
                    ? ThemeHandler.widgetColor().withOpacity(0.5)
                    : (collection?.color ?? color),
                borderRadius: BorderRadius.circular(32.r),
              ),
            ),
          ),
          Positioned.fill(
            top: 4.h,
            child: InkWell(
              hoverColor: ThemeHandler.backgroundColor(),
              onTap: () {
                print(
                    '${NovaRouter.userRoute}/$username/${NovaRouter.collection}/${collection?.id}');
                isSuggested.not
                    ? context.push(
                        '${NovaRouter.userRoute}/$username/${NovaRouter.collection}/${collection?.id}',
                        extra: collection,
                      )
                    : null;
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ThemeHandler.mutedPlusColor(nonInverse: false),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.r),
                    topRight: Radius.circular(32.r),
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
                      Text(
                        collection?.name ?? 'Projects',
                        style: AppTextStyles.text20w600.copyWith(
                          color: isSuggested
                              ? ThemeHandler.widgetColor().withOpacity(0.5)
                              : ThemeHandler.widgetColor(),
                        ),
                      ),
                      sizedBoxWithHeight(8),
                      Text(
                        collection?.tagline ??
                            'Here\'s what i have done so far',
                        style: AppTextStyles.text14w400.copyWith(
                          color: isSuggested
                              ? ThemeHandler.widgetColor().withOpacity(0.5)
                              : ThemeHandler.widgetColor(),
                        ),
                      ),
                      sizedBoxWithHeight(8),
                      Text(
                        '${collection?.item?.length ?? '0'} Item',
                        style: AppTextStyles.text14w400.copyWith(
                          color: isSuggested
                              ? ThemeHandler.widgetColor().withOpacity(0.5)
                              : ThemeHandler.widgetColor(),
                        ),
                      ),
                      const Spacer(),
                      if (_isCurrentUser) ...{
                        Row(
                          children: [
                            const Spacer(),
                            AppIconButton(
                              icon:
                                  isSuggested ? Icons.add : Icons.edit_outlined,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      ProfileAddEditCollection(
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

  //Variable declarations
  late ProfileNotifier _profileNoti;
  late bool _isCurrentUser;
  late UserModel? _userModel;
  late List<UserCollection>? _collections;
  //Init for did change dependency
  var _init = true;
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
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (_init) {
      _collections = Provider.of<ProfileNotifier>(context)
          .profileAsPerRoute()
          ?.collections;
      _isCurrentUser =
          Provider.of<ProfileNotifier>(context).isCurrentUser ?? false;
      if (_isCurrentUser) {
        _updateSuggestedCollection();
      }
      _init = false;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    _profileNoti = Provider.of<ProfileNotifier>(context);
    _isCurrentUser = _profileNoti.isCurrentUser ?? false;
    _userModel = _profileNoti.profileAsPerRoute();
    _collections = _userModel?.collections;
    final name = _userModel?.name?.split(' ');
    if ((_collections?.isEmpty ?? true) && _isCurrentUser.not) {
      return const SizedBox();
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${(name?[0] ?? '')}\'s Collections',
          style: AppTextStyles.text22w500,
        ),
        sizedBoxWithHeight(40),
        if (_isCurrentUser) ...{
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
            ),
            child: Row(
              children: [
                Container(
                  height: 48.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.r),
                    gradient: AppColors.novaBlueGradient,
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Image.asset(
                        AppAssets.collectionLogo,
                        height: 24.h,
                      ),
                    ),
                  ),
                ),
                sizedBoxWithWidth(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add a collection',
                      style: AppTextStyles.text16w600,
                    ),
                    sizedBoxWithHeight(8),
                    Text(
                      'Organize your projects, certificates, publications etc..',
                      style: AppTextStyles.text14w300,
                    ),
                  ],
                ),
                const Spacer(),
                AppIconButton(
                  icon: Icons.add,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const ProfileAddEditCollection(
                        isAdd: true,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        },
        if ((_suggestedCollections?.isNotEmpty ?? false) && _isCurrentUser) ...{
          sizedBoxWithHeight(24),
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
            ),
            child: Text(
              'Suggested',
              style: AppTextStyles.text16w600,
            ),
          ),
        },
        sizedBoxWithHeight(16),
        Padding(
          padding: EdgeInsets.only(
            left: 16.w,
          ),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 224.h,
                  child: ListView.separated(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    physics: const PageScrollPhysics(),
                    itemCount: (_collections?.length ?? 0) +
                        (_suggestedCollections?.length ?? 0),
                    separatorBuilder: (context, index) => sizedBoxWithWidth(16),
                    itemBuilder: (context, index) {
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
                  ),
                ),
              ),
              sizedBoxWithWidth(8),
              AppIconButton(
                icon: Icons.arrow_forward_ios_rounded,
                onTap: () {
                  _controller.animateTo(
                    _controller.offset + ScreenUtil.instance.width * 0.21 * 2,
                    curve: Curves.easeOut,
                    duration: Duration(milliseconds: 200),
                  );
                },
              ),
            ],
          ),
        ),
        sizedBoxWithHeight(56),
      ],
    );
  }
}
