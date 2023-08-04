import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/models/feed/comment/comment_reply/feed_comment_reply_model.dart';
import 'package:nova_social/data/models/misc/converters/converters.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
part 'feed_comment_model.freezed.dart';
part 'feed_comment_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class FeedCommentModel with _$FeedCommentModel {
  const factory FeedCommentModel({
    String? id,
    String? feedId,
    UserMinimum? userDetails,
    List<FeedCommentReplyModel>? replies,
    String? commentText,
    @TimestampConverter() DateTime? createdAt,
    List<UserReaction>? reactions,
  }) = _FeedCommentModel;

  factory FeedCommentModel.fromJson(Map<String, dynamic> json) =>
      _$FeedCommentModelFromJson(json);
}
