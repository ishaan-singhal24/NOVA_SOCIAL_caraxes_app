import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/playground/playground_feed/comment/comment_reply/playground_feed_comment_reply_model.dart';
import 'package:nova_social/data/models/playground/playground_feed/comment/playground_feed_comment_model.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/repository/playground/playground_repository.dart';
import 'package:nova_social/utils/utils.dart';

class PlaygroundNotifier with ChangeNotifier {
  late PlaygroundRepository _playgroundRepository;
  List<PlaygroundFeedModel?>? feedList = [];
  List<PlaygroundFeedModel?>? personalFeedList = [];
  InitEnum? createFeedStatus;
  List<UserReaction>? currentFeedReactionList = [];

  PlaygroundFeedModel? currentPlaygroundFeedModel;

  List<PlaygroundFeedCommentModel>? currentPlaygroundFeedCommentsList = [];

  StreamSubscription? _feedNotifierListener;

  // My Code...

  StreamSubscription? _commentNotifierListener;

  late ProfileNotifier _profileNotifier;

  static PlaygroundNotifier initialize(PlaygroundRepository repo) {
    late PlaygroundNotifier instance;
    try {
      instance = PlaygroundNotifier();
    } catch (e) {
      Logger.logError('Initialization failed PlaygroundNotifier', e);
      instance = PlaygroundNotifier();
    }
    instance._playgroundRepository = repo;
    return instance;
  }

  update(ProfileNotifier prof) {
    _profileNotifier = prof;
    notifyListeners();
  }

  Future<void> createFeed(PlaygroundFeedModel playgroundFeedModel) async {
    createFeedStatus = InitEnum.initializing;
    final res = await _playgroundRepository.createFeed(playgroundFeedModel);
    if (res.isSuccess) {
      createFeedStatus = InitEnum.initialized;
    } else {
      createFeedStatus = InitEnum.uninitialized;
    }
  }

  Future<void> updateFeed(PlaygroundFeedModel playgroundFeedModel) async {
    await _playgroundRepository.updateFeed(playgroundFeedModel);
  }

  Future<void> fetchFeedById(String id) async {
    createFeedStatus = InitEnum.initializing;
    final res = await _playgroundRepository.fetchFeedById(
      id: id,
    );
    if (res.isSuccess) {
      updateCurrentFeedById(
        id: res.data?.id ?? '',
        updateByModel: res.data,
      );
      createFeedStatus = InitEnum.initialized;
      notifyListeners();
    } else {
      createFeedStatus = InitEnum.uninitialized;
    }
  }

  Future<void> deleteFeed({required String feedId}) async {
    await _playgroundRepository.deleteFeed(feedId: feedId);
  }

  // My Code...

  //   void updateCurrentFeedById({
  //   required String id,
  //   PlaygroundFeedModel? updateByModel,
  // }) async {
  //   if (feedList?.isEmpty ?? true) {
  //     currentPlaygroundFeedModel = updateByModel;
  //   } else {
  //     currentPlaygroundFeedModel = feedList?.singleWhere(
  //       (element) => element?.id == id,
  //       orElse: () => const FeedModel(),
  //     );
  //   }
  //   currentPlaygroundFeedCommentsList = currentPlaygroundFeedModel?.comments;
  //   currentReportedByList = currentPlaygroundFeedModel?.reportedAbusiveBy;
  //   currentFeedReactionList = currentPlaygroundFeedModel?.reactions;
  // }

  void updateCurrentFeedById({
    required String id,
    PlaygroundFeedModel? updateByModel,
  }) async {
    if (feedList?.isEmpty ?? true) {
      currentPlaygroundFeedModel = updateByModel;
    } else {
      currentPlaygroundFeedModel = feedList?.singleWhere(
        (element) => element?.id == id,
        orElse: () => const PlaygroundFeedModel(),
      );
    }
    currentPlaygroundFeedCommentsList = currentPlaygroundFeedModel?.comments;
    // currentReportedByList = currentFeedModel?.reportedAbusiveBy;
    // currentFeedReactionList = currentFeedModel?.reactions;
  }

  Future<void> addCommentToFeed(
      PlaygroundFeedCommentModel playgroundfeedCommentModel) async {
    if (currentPlaygroundFeedModel == null) {
      return;
    }
    //removing original
    PlaygroundFeedCommentModel? commentModelCheck =
        currentPlaygroundFeedCommentsList?.firstWhere(
      (element) => element.id == playgroundfeedCommentModel.id,
      orElse: () => const PlaygroundFeedCommentModel(),
    );

    if (commentModelCheck?.id?.isNotEmpty ?? false) {
      currentPlaygroundFeedCommentsList?.removeWhere(
        (element) => element.id == playgroundfeedCommentModel.id,
      );
    }
    //...

    currentPlaygroundFeedCommentsList ??= [];
    currentPlaygroundFeedCommentsList?.add(playgroundfeedCommentModel);

    currentPlaygroundFeedCommentsList
        ?.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    currentPlaygroundFeedModel = currentPlaygroundFeedModel?.copyWith(
      comments: currentPlaygroundFeedCommentsList,
    );

    await updateFeed(currentPlaygroundFeedModel!);
    notifyListeners();
  }

  Future<void> addCommentReplyToFeed({
    required PlaygroundFeedCommentReplyModel playgroundFeedCommentReplyModel,
    required PlaygroundFeedCommentModel currentPlaygroundFeedCommentModel,
  }) async {
    if (currentPlaygroundFeedModel == null) {
      return;
    }
    currentPlaygroundFeedCommentsList?.removeWhere(
      (element) => element.id == currentPlaygroundFeedCommentModel.id,
    );
    List<PlaygroundFeedCommentReplyModel>? currentCommentReplies =
        currentPlaygroundFeedCommentModel.replies;

    //removing original
    PlaygroundFeedCommentReplyModel? commentReplyModelCheck =
        currentCommentReplies?.firstWhere(
      (element) => element.id == playgroundFeedCommentReplyModel.id,
      orElse: () => const PlaygroundFeedCommentReplyModel(),
    );

    if (commentReplyModelCheck?.id?.isNotEmpty ?? false) {
      currentCommentReplies?.removeWhere(
        (element) => element.id == playgroundFeedCommentReplyModel.id,
      );
    }
    //..

    currentCommentReplies ??= [];
    // currentCommentReplies = [...currentCommentReplies, playgroundFeedCommentReplyModel];

    currentCommentReplies.add(playgroundFeedCommentReplyModel);

    currentCommentReplies.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    currentPlaygroundFeedCommentModel =
        currentPlaygroundFeedCommentModel.copyWith(
      replies: currentCommentReplies,
    );

    currentPlaygroundFeedCommentsList ??= [];
    currentPlaygroundFeedCommentsList?.add(currentPlaygroundFeedCommentModel);

    currentPlaygroundFeedCommentsList
        ?.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));

    currentPlaygroundFeedModel = currentPlaygroundFeedModel?.copyWith(
      comments: currentPlaygroundFeedCommentsList,
    );
    await updateFeed(currentPlaygroundFeedModel!);
    notifyListeners();
  }

  int commentCount({required PlaygroundFeedModel playgroundfeedModel}) {
    List<PlaygroundFeedCommentModel>? commentList =
        playgroundfeedModel.comments;
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

  int reactionCount({required PlaygroundFeedModel playgroundfeedModel}) {
    return playgroundfeedModel.reactions?.length ?? 0;
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
    if (currentPlaygroundFeedModel == null) {
      return;
    }

    bool isReacted =
        checkIfPostReacted(reactionList: currentPlaygroundFeedModel?.reactions);

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

    currentPlaygroundFeedModel = currentPlaygroundFeedModel?.copyWith(
      reactions: currentFeedReactionList,
    );

    await updateFeed(currentPlaygroundFeedModel!);
    notifyListeners();
  }

  void streamAllFeed() {
    _feedNotifierListener =
        _playgroundRepository.streamAllFeed().listen((event) {
      feedList = event;
      personalFeedList = feedList
          ?.where(
            (element) =>
                _profileNotifier.userProfile?.username ==
                element?.userDetails?.username,
          )
          .toList();
      feedList = feedList?.where((element) {
        return ((_profileNotifier
                    .userProfile?.blocked?.from?[element?.userDetails?.id] !=
                true) &&
            (_profileNotifier
                    .userProfile?.blocked?.to?[element?.userDetails?.id] !=
                true));
      }).toList();
      notifyListeners();
    });
  }

  void removeFeedListener() {
    _feedNotifierListener?.cancel();
  }

  void streamPlaygroundFeedComments(
      {required PlaygroundFeedModel playgroundfeedModel}) {
    _commentNotifierListener = _playgroundRepository
        .streamPlaygroundFeedComments(playgroundfeedModel)
        .listen((event) {
      currentPlaygroundFeedCommentsList = event;
      currentPlaygroundFeedCommentsList
          ?.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      currentPlaygroundFeedCommentsList =
          currentPlaygroundFeedCommentsList?.where((element) {
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
