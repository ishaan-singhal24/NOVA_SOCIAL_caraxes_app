import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

class SearchMView extends StatefulWidget {
  const SearchMView({Key? key}) : super(key: key);

  @override
  State<SearchMView> createState() => _SearchMViewState();
}

class _SearchMViewState extends State<SearchMView> {
  late SearchNotifier _searchNotifier;
  late ProfileNotifier _profileNotifier;

  final TextEditingController _searchController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchNotifier = context.read<SearchNotifier>();
    _profileNotifier = context.read<ProfileNotifier>();

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreResults();
    }
  }

  Future<void> _searchUsers() async {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      await _searchNotifier.searchUsers(
        searchQuery: _searchController.text,
        clearCachedResults: true,
      );
    });
  }

  Future<void> _loadMoreResults() async {
    if (_searchNotifier.hasMoreResults) {
      await _searchNotifier.searchUsers(
        searchQuery: _searchController.text,
        clearCachedResults: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _searchNotifier = context.watch<SearchNotifier>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          child: Column(
            children: [
              sizedBoxWithHeight(24),
              Row(
                children: [
                  AppIconButton(
                    icon: Icons.arrow_back_ios,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  sizedBoxWithWidth(8),
                  Expanded(
                    child: AppMaterialInputField(
                      controller: _searchController,
                      isRequired: false,
                      label: 'Search',
                      hint: 'Search user..',
                      suffixIcon: AppIconButton(
                        icon: Icons.search,
                        color: AppColors.novaWhite.withOpacity(0.5),
                        onTap: () async {
                          await _searchUsers();
                        },
                      ),
                      onChanged: (value) async {
                        await _searchUsers();
                      },
                    ),
                  ),
                  sizedBoxWithWidth(8),
                ],
              ),
              sizedBoxWithHeight(24),
              Flexible(
                child: ((_searchNotifier.fetchUserStatus ==
                            InitEnum.initializing) &&
                        (_searchNotifier.searchedUserResults?.isEmpty ?? true))
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : _buildSearchResultsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResultsList() {
    final searchResults = _searchNotifier.searchedUserResults;

    return ListView.separated(
      separatorBuilder: (context, index) => sizedBoxWithHeight(16),
      controller: _scrollController,
      itemCount: (searchResults?.length ?? 0) +
          (_searchNotifier.hasMoreResults ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == searchResults?.length) {
          return _searchNotifier.fetchUserStatus == InitEnum.initializing
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container();
        }

        final user = searchResults?[index];

        return GestureDetector(
          onTap: () async {
            final profile =
                await _profileNotifier.fetchUsersById(user?.id ?? '');
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              context.push(
                MobileRouter.profileRoute,
                extra: ProfileMViewArgs(
                  isCurrentUser: _profileNotifier.userProfile?.id == user?.id,
                  profile: profile,
                ),
              );
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 40.w,
                child: AppUserProfileCircle(
                  imageUrl: user?.profilePictureUrl ?? '',
                  errorText: user?.name?[0] ?? '',
                  radius: 20.r,
                ),
              ),
              sizedBoxWithWidth(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user?.name ?? '',
                      style: AppTextStyles.text14w600,
                    ),
                    if (user?.tagline?.isNotEmpty ?? false) ...{
                      sizedBoxWithHeight(4),
                      Text(
                        user?.tagline ?? '',
                        style: AppTextStyles.text12w300,
                      ),
                    },
                  ],
                ),
              ),
              sizedBoxWithWidth(8),
            ],
          ),
        );
      },
    );
  }
}
