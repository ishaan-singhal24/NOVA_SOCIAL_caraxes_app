import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/feed/feed_model.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/feed_routes/feed_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:profanity_filter/profanity_filter.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CreateFeedMView extends StatefulWidget {
  const CreateFeedMView({super.key, this.args});

  final CreateFeedMViewArgs? args;

  @override
  State<CreateFeedMView> createState() => _CreateFeedMViewState();
}

class _CreateFeedMViewState extends State<CreateFeedMView> {
  int _currentImageIndex = 0;

  InitEnum? _isGeneratingFeed;
  late ProfileNotifier _profileNotifier;
  late FeedNotifier _feedNotifier;
  late final CarouselController _carouselController;
  late final FocusNode _createFieldFocusNode;

  final TextEditingController _feedTextEditingController =
      TextEditingController();

  List<String>? _encodedImages;
  List<String>? _imageUrls;
  List<Uint8List?>? _pickedPictures;

  Future<void> _createFeed() async {
    try {
      if (_feedTextEditingController.text.isEmpty &&
          (_encodedImages?.isEmpty ?? true)) {
        return;
      }
      if (_profileNotifier.userProfile == null ||
          (_profileNotifier.userProfile?.id?.isEmpty ?? true)) {
        return;
      }
      final filter = ProfanityFilter();
      bool isOffensivePrompt =
          filter.hasProfanity(_feedTextEditingController.text);
      if (isOffensivePrompt) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Nova finds one or more offensive words in your feed!',
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
        _isGeneratingFeed = InitEnum.initializing;
      });

      if (_encodedImages?.isNotEmpty ?? false) {
        _imageUrls ??= [];

        for (int i = 0; i < _encodedImages!.length; i++) {
          String? imageUrl =
              await _profileNotifier.uploadCollectionItemThumbnail(
            base64File: _encodedImages![i],
          );

          _imageUrls?.add(imageUrl!);
        }
      }

      final feedModel = FeedModel(
        createdAt: DateTime.now(),
        feedText: _feedTextEditingController.text,
        userDetails: UserMinimum.getUserMinimum(_profileNotifier.userProfile),
        generatedFeedUrl: (_imageUrls?.isNotEmpty ?? false) ? _imageUrls : null,
      );
      await _feedNotifier.createFeed(feedModel).then((value) {
        setState(() {
          _isGeneratingFeed = InitEnum.initialized;
        });

        context.pop();
      });
    } catch (error) {
      setState(() {
        _isGeneratingFeed = InitEnum.uninitialized;
      });

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
  void initState() {
    // TODO: implement initState
    super.initState();
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    _feedNotifier = Provider.of<FeedNotifier>(context, listen: false);
    _carouselController = CarouselController();
    _createFieldFocusNode = FocusNode();
    _createFieldFocusNode.requestFocus();

    if (widget.args != null) {
      _feedTextEditingController.text = widget.args?.promptText ?? "";

      _encodedImages ??= [];
      _encodedImages?.add(widget.args?.generatedFeedUrl ?? "");

      _pickedPictures ??= [];
      loadImage(widget.args?.generatedFeedUrl ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    _profileNotifier = Provider.of<ProfileNotifier>(context);
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 16.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizedBoxWithHeight(24),
                Row(
                  children: [
                    AppIconButton(
                      icon: Icons.arrow_back,
                      onTap: () {
                        context.pop();
                      },
                    ),
                    Expanded(
                      child: Text(
                        'Create Feed',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.text22w500,
                      ),
                    ),
                    sizedBoxWithWidth(24),
                  ],
                ),
                sizedBoxWithHeight(24),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: AppUserProfileCircle(
                    radius: 24.r,
                    imageUrl:
                        _profileNotifier.userProfile?.profilePictureUrl ?? '',
                    errorText: 'NA',
                  ),
                  title: Text(
                    _profileNotifier.userProfile?.name ?? '',
                    style: AppTextStyles.text14w500,
                  ),
                  subtitle: Text(
                    _profileNotifier.userProfile?.tagline ?? '',
                    style: AppTextStyles.text12w300,
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      context.push(
                        FeedMRouter.feedImagePreviewMViewRoute,
                        extra: (encodedImage, pickedPictures) {
                          _encodedImages = encodedImage;
                          _pickedPictures = pickedPictures;
                          setState(() {});
                        },
                      );
                    },
                    child: SvgPicture.asset(
                      AppAssets.cameraIcon,
                      height: 24.h,
                      color: AppColors.novaWhite,
                    ),
                  ),
                ),
                sizedBoxWithHeight(16),
                if (_isGeneratingFeed == InitEnum.initializing) ...{
                  sizedBoxWithHeight(16),
                  const LinearProgressBarMWidget(),
                  sizedBoxWithHeight(32),
                },
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 240.h, // set the fixed max height here
                    maxWidth: double.maxFinite,
                  ),
                  child: AppMaterialInputField(
                    focusNode: _createFieldFocusNode,
                    showBorder: false,
                    focusFillColor:
                        ThemeHandler.mutedPlusColor(nonInverse: false),
                    nonFocusFillColor:
                        ThemeHandler.mutedPlusColor(nonInverse: false),
                    minLines: 7,
                    hint: 'Talk about anything you want....',
                    controller: _feedTextEditingController,
                    isRequired: false,
                    maxLines: null,
                  ),
                ),
                if (_pickedPictures?.isNotEmpty ?? false) ...{
                  // sizedBoxWithHeight(16),
                  Container(
                    decoration: BoxDecoration(
                      color: ThemeHandler.mutedPlusColor(nonInverse: false),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.r),
                        bottomRight: Radius.circular(8.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: CarouselSlider.builder(
                            carouselController: _carouselController,
                            itemCount: _pickedPictures!.length,
                            itemBuilder: (context, index, _) {
                              return _buildImagePreviewTiles(
                                imageBytes: _pickedPictures![index],
                              );
                            },
                            options: CarouselOptions(
                              enableInfiniteScroll: false,
                              autoPlay:
                                  _pickedPictures!.length == 1 ? false : true,
                              viewportFraction: 1.0,
                              onPageChanged: (index, reason) {
                                _currentImageIndex = index;
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        sizedBoxWithHeight(8),
                        if ((_pickedPictures?.length ?? 0) > 1) ...{
                          SizedBox(
                            width: double.infinity,
                            child: Center(
                              child: SizedBox(
                                width: (_pickedPictures?.length ?? 0) * 16,
                                height: 24.h,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      sizedBoxWithWidth(4),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CircleAvatar(
                                      radius: _currentImageIndex == index
                                          ? 6.r
                                          : 4.r,
                                      backgroundColor:
                                          _currentImageIndex == index
                                              ? AppColors.novaDarkIndigo
                                              : AppColors.novaWhite
                                                  .withOpacity(0.8),
                                    );
                                  },
                                  itemCount: (_pickedPictures?.length ?? 0),
                                ),
                              ),
                            ),
                          ),
                        },
                        sizedBoxWithHeight(16),
                      ],
                    ),
                  ),
                },
                sizedBoxWithHeight(16),
                CustomButton(
                  text: 'Post',
                  onPressed: () {
                    _createFeed();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImagePreviewTiles({
    Uint8List? imageBytes,
  }) {
    return SizedBox(
      height: 256.h,
      child: Image.memory(
        imageBytes!,
        width: double.maxFinite,
        height: 256.h,
        fit: BoxFit.cover,
        errorBuilder: (context, err, v) => Container(
          color: AppColors.novaDarkIndigo,
          width: double.maxFinite,
          height: double.maxFinite,
          alignment: Alignment.center,
          child: Text(
            'You can upload an image here',
            style: AppTextStyles.text16w400.white,
          ),
        ),
      ),
    );
  }

  Future<Uint8List> getBytesFromUrl(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Uint8List.fromList(response.bodyBytes);
    } else {
      throw Exception('Failed to load image from $url');
    }
  }

  Future<void> loadImage(String url) async {
    Uint8List imgBytes = await getBytesFromUrl(url);

    setState(() {
      _pickedPictures?.add(imgBytes);
    });
  }
}
