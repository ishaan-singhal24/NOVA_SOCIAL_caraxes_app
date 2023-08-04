import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/models/misc/converters/converters.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
part 'playground_feed_comment_reply_model.freezed.dart';
part 'playground_feed_comment_reply_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PlaygroundFeedCommentReplyModel with _$PlaygroundFeedCommentReplyModel {
  const factory PlaygroundFeedCommentReplyModel({
    String? id,
    String? playgroundcommentId,
    String? playgroundFeedId,
    UserMinimum? userDetails,
    UserMinimum? repliedToUserDetails,
    String? commentReplyText,
    @TimestampConverter() DateTime? createdAt,
    List<UserReaction>? reactions,
  }) = _PlaygroundFeedCommentReplyModel;

  factory PlaygroundFeedCommentReplyModel.fromJson(Map<String, dynamic> json) =>
      _$PlaygroundFeedCommentReplyModelFromJson(json);
}
