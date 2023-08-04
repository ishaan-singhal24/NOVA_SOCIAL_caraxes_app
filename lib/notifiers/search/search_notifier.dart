import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/repository/search/search_repository.dart';
import 'package:nova_social/utils/utils.dart';

class SearchNotifier with ChangeNotifier {
  late final SearchRepository _searchRepository;

  List<DocumentSnapshot>? _searchedSnapshot = [];
  List<UserModel>? _searchedUsersResult = [];
  InitEnum? _fetchUserStatus;
  bool _hasMoreResults = true;

  List<UserModel>? get searchedUserResults => _searchedUsersResult;
  InitEnum? get fetchUserStatus => _fetchUserStatus;
  bool get hasMoreResults => _hasMoreResults;

  static SearchNotifier initialize(SearchRepository repo) {
    late SearchNotifier instance;
    try {
      instance = SearchNotifier();
    } catch (e) {
      Logger.logError('Initialization failed SearchNotifier', e);
      instance = SearchNotifier();
    }
    instance._searchRepository = repo;
    return instance;
  }

  Future<void> searchUsers({
    required String searchQuery,
    bool clearCachedResults = true,
  }) async {
    if (clearCachedResults) {
      _searchedUsersResult?.clear();
      _searchedSnapshot?.clear();
      _hasMoreResults = true;
    }
    _fetchUserStatus = InitEnum.initializing;
    notifyListeners();
    DocumentSnapshot? lastDoc;
    if (_searchedSnapshot?.isNotEmpty ?? false) {
      lastDoc = _searchedSnapshot?.last;
    }

    final res = await _searchRepository.searchUsers(
      searchQuery: searchQuery,
      lastDocument: lastDoc,
    );

    int fetchedResultLength = 0;

    if (res.isSuccess) {
      _fetchUserStatus = InitEnum.initialized;
      if (res.data?.isNotEmpty ?? false) {
        _searchedSnapshot = res.data;
        _searchedUsersResult ??= [];
        _searchedUsersResult?.addAll(_searchedSnapshot?.map<UserModel>(
                (document) =>
                    UserModel.fromJson(document.data() as Map<String, dynamic>))
            as Iterable<UserModel>);

        fetchedResultLength = res.data?.length ?? 0;
      }
    } else {
      _fetchUserStatus = InitEnum.uninitialized;
    }

    // update _hasMoreResults based on whether we received the max number of results per page
    _hasMoreResults = fetchedResultLength == SearchRepository.RESULTS_PER_PAGE;
    notifyListeners();
  }
}
