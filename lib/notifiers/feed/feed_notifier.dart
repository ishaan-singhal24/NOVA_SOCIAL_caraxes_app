import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/feed/comment/comment_reply/feed_comment_reply_model.dart';
import 'package:nova_social/data/models/feed/comment/feed_comment_model.dart';
import 'package:nova_social/data/models/feed/feed_model.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/repository/feed/feed_repository.dart';
import 'package:nova_social/utils/utils.dart';

class FeedNotifier with ChangeNotifier {
  late FeedRepository _feedRepository;

  FeedModel? currentFeedModel;
  List<FeedModel?>? feedList = [];
  List<FeedModel?>? feedByIdList = [];
  InitEnum? createFeedStatus;

  List<FeedCommentModel>? currentFeedCommentsList = [];
  List<UserReaction>? currentFeedReactionList = [];
  List<UserMinimum>? currentReportedByList = [];

  StreamSubscription? _feedNotifierListener;
  StreamSubscription? _feedByIdNotifierListener;
  StreamSubscription? _commentNotifierListener;

  late ProfileNotifier _profileNotifier;

  static FeedNotifier initialize(FeedRepository repo) {
    late FeedNotifier instance;
    try {
      instance = FeedNotifier();
    } catch (e) {
      Logger.logError('Initialization failed PlaygroundNotifier', e);
      instance = FeedNotifier();
    }
    instance._feedRepository = repo;
    return instance;
  }

  update(ProfileNotifier prof) {
    _profileNotifier = prof;
    notifyListeners();
  }

  Future<void> createFeed(FeedModel feedModel) async {
    createFeedStatus = InitEnum.initializing;
    final res = await _feedRepository.createFeed(feedModel);
    if (res.isSuccess) {
      createFeedStatus = InitEnum.initialized;
    } else {
      createFeedStatus = InitEnum.uninitialized;
    }
  }

  Future<void> updateFeed(FeedModel feedModel) async {
    await _feedRepository.updateFeed(feedModel);
  }

  Future<void> fetchFeedById(String id) async {
    createFeedStatus = InitEnum.initializing;
    final res = await _feedRepository.fetchFeedById(
      id: id,
    );
    if (res.isSuccess) {
      updateCurrentFeedById(
        id: res.data?.id ?? '',
        updateByModel: res.data,
      );
      createFeedStatus = InitEnum.initialized;
    } else {
      createFeedStatus = InitEnum.uninitialized;
    }
    notifyListeners();
  }

  Future<void> deleteFeed({required String feedId}) async {
    await _feedRepository.deleteFeed(feedId: feedId);
  }

  Future<void> reportFeed({required UserMinimum currentUser}) async {
    if (currentFeedModel == null) {
      return;
    }
    createFeedStatus = InitEnum.initializing;
    currentReportedByList = currentFeedModel?.reportedAbusiveBy;
    currentReportedByList ??= [];
    currentReportedByList?.add(currentUser);

    currentFeedModel = currentFeedModel?.copyWith(
      reportedAbusiveBy: currentReportedByList,
    );
    final res = await _feedRepository.updateFeed(currentFeedModel!);
    if (res.isSuccess) {
      createFeedStatus = InitEnum.initialized;
    } else {
      createFeedStatus = InitEnum.uninitialized;
    }
  }

  void updateCurrentFeedById({
    required String id,
    FeedModel? updateByModel,
  }) async {
    if (feedList?.isEmpty ?? true) {
      currentFeedModel = updateByModel;
    } else {
      currentFeedModel = feedList?.singleWhere(
        (element) => element?.id == id,
        orElse: () => const FeedModel(),
      );
    }
    currentFeedCommentsList = currentFeedModel?.comments;
    currentReportedByList = currentFeedModel?.reportedAbusiveBy;
    currentFeedReactionList = currentFeedModel?.reactions;
  }

  Future<void> addCommentToFeed(FeedCommentModel feedCommentModel) async {
    if (currentFeedModel == null) {
      return;
    }
    //removing original
    FeedCommentModel? commentModelCheck = currentFeedCommentsList?.firstWhere(
      (element) => element.id == feedCommentModel.id,
      orElse: () => const FeedCommentModel(),
    );

    if (commentModelCheck?.id?.isNotEmpty ?? false) {
      currentFeedCommentsList?.removeWhere(
        (element) => element.id == feedCommentModel.id,
      );
    }
    //...

    currentFeedCommentsList ??= [];
    currentFeedCommentsList?.add(feedCommentModel);

    currentFeedCommentsList
        ?.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    currentFeedModel = currentFeedModel?.copyWith(
      comments: currentFeedCommentsList,
    );

    await updateFeed(currentFeedModel!);
    notifyListeners();
  }

  Future<void> addCommentReplyToFeed({
    required FeedCommentReplyModel feedCommentReplyModel,
    required FeedCommentModel currentCommentModel,
  }) async {
    if (currentFeedModel == null) {
      return;
    }
    currentFeedCommentsList?.removeWhere(
      (element) => element.id == currentCommentModel.id,
    );
    List<FeedCommentReplyModel>? currentCommentReplies =
        currentCommentModel.replies;

    //removing original
    FeedCommentReplyModel? commentReplyModelCheck =
        currentCommentReplies?.firstWhere(
      (element) => element.id == feedCommentReplyModel.id,
      orElse: () => const FeedCommentReplyModel(),
    );

    if (commentReplyModelCheck?.id?.isNotEmpty ?? false) {
      currentCommentReplies?.removeWhere(
        (element) => element.id == feedCommentReplyModel.id,
      );
    }
    //..

    currentCommentReplies ??= [];
    // currentCommentReplies = [...currentCommentReplies, feedCommentReplyModel];

    currentCommentReplies.add(feedCommentReplyModel);

    currentCommentReplies.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    currentCommentModel = currentCommentModel.copyWith(
      replies: currentCommentReplies,
    );

    currentFeedCommentsList ??= [];
    currentFeedCommentsList?.add(currentCommentModel);

    currentFeedCommentsList
        ?.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

    currentFeedModel = currentFeedModel?.copyWith(
      comments: currentFeedCommentsList,
    );
    await updateFeed(currentFeedModel!);
    notifyListeners();
  }

  int commentCount({required FeedModel feedModel}) {
    List<FeedCommentModel>? commentList = feedModel.comments;
    if (commentList?.isEmpty ?? true) {
      return 0;
    }
    int commentLength = commentList?.length ?? 0;
    int counter = 0;
    for (int i = 0; i < commentLength; i++) {
      if (commentList?[i].replies?.isNotEmpty ?? false) {
        counter += commentList?[i].replies?.length ?? 0;
      }
      counter++;
    }
    return counter;
  }

  int reactionCount({required FeedModel feedModel}) {
    return feedModel.reactions?.length ?? 0;
  }

  bool checkIfPostReacted({List<UserReaction>? reactionList}) {
    var myReaction = reactionList?.firstWhere(
      (element) => element.id == _profileNotifier.userProfile?.id,
      orElse: () => const UserReaction(),
    );
    return (myReaction?.id?.isNotEmpty ?? false);
  }

  Future<void> togglePostReaction() async {
    if (_profileNotifier.userProfile == null) {
      return;
    }
    if (currentFeedModel == null) {
      return;
    }

    bool isReacted =
        checkIfPostReacted(reactionList: currentFeedModel?.reactions);

    var userModel = _profileNotifier.userProfile;

    currentFeedReactionList ??= [];
    if (isReacted.not) {
      final UserReaction reaction = UserReaction(
        id: userModel?.id,
        name: userModel?.name,
        username: userModel?.username,
        profilePictureUrl: userModel?.profilePictureUrl,
        reaction: ReactionEnum.love,
      );
      currentFeedReactionList?.add(reaction);
    } else {
      currentFeedReactionList
          ?.removeWhere((element) => element.id == userModel?.id);
    }

    currentFeedModel = currentFeedModel?.copyWith(
      reactions: currentFeedReactionList,
    );

    await updateFeed(currentFeedModel!);
    notifyListeners();
  }

  void streamAllFeed() {
    _feedNotifierListener = _feedRepository.streamAllFeed().listen((event) {
      feedList = event;
      feedList = feedList?.where((element) {
        return ((_profileNotifier
                    .userProfile?.blocked?.from?[element?.userDetails?.id] !=
                true) &&
            (_profileNotifier
                    .userProfile?.blocked?.to?[element?.userDetails?.id] !=
                true));
      }).toList();
      _feedNotifierListener;
      notifyListeners();
    });
  }

  void streamFeedByUserId({required String userId}) {
    if (feedList?.isNotEmpty ?? false) {
      feedByIdList = feedList
          ?.where(
            (element) => userId == element?.userDetails?.id,
          )
          .toList();
    } else {
      _feedByIdNotifierListener =
          _feedRepository.streamFeedByUserId(userId: userId).listen((event) {
        feedByIdList = event;
        _feedByIdNotifierListener;
        notifyListeners();
      });
    }
  }

  void removeFeedListener() {
    if (_feedNotifierListener != null) {
      _feedNotifierListener?.cancel();
    }
  }

  void removeFeedByIdListener() {
    if (_feedByIdNotifierListener != null) {
      _feedByIdNotifierListener?.cancel();
    }
  }

  void streamFeedComments({required FeedModel feedModel}) {
    _commentNotifierListener =
        _feedRepository.streamFeedComments(feedModel).listen((event) {
      currentFeedCommentsList = event;
      currentFeedCommentsList
          ?.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      currentFeedCommentsList = currentFeedCommentsList?.where((element) {
        return ((_profileNotifier
                    .userProfile?.blocked?.from?[element.userDetails?.id] !=
                true) &&
            (_profileNotifier
                    .userProfile?.blocked?.to?[element.userDetails?.id] !=
                true));
      }).toList();
      _commentNotifierListener;
      notifyListeners();
    });
  }

  void removeCommentListener() {
    _commentNotifierListener?.cancel();
  }
}
