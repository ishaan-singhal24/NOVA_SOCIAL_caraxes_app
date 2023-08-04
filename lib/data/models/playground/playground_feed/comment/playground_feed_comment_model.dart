import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/models/feed/comment/comment_reply/feed_comment_reply_model.dart';
import 'package:nova_social/data/models/misc/converters/converters.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/playground/playground_feed/comment/comment_reply/playground_feed_comment_reply_model.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
part 'playground_feed_comment_model.freezed.dart';
part 'playground_feed_comment_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class PlaygroundFeedCommentModel with _$PlaygroundFeedCommentModel {
  const factory PlaygroundFeedCommentModel({
    String? id,
    String? playgroundFeedId,
    UserMinimum? userDetails,
    List<PlaygroundFeedCommentReplyModel>? replies,
    String? commentText,
    @TimestampConverter() DateTime? createdAt,
    List<UserReaction>? reactions,
  }) = _PlaygroundFeedCommentModel;

  factory PlaygroundFeedCommentModel.fromJson(Map<String, dynamic> json) =>
      _$PlaygroundFeedCommentModelFromJson(json);
}
