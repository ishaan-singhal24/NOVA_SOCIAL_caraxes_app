import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/models/misc/converters/converters.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
part 'feed_comment_reply_model.freezed.dart';
part 'feed_comment_reply_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class FeedCommentReplyModel with _$FeedCommentReplyModel {
  const factory FeedCommentReplyModel({
    String? id,
    String? commentId,
    String? feedId,
    UserMinimum? userDetails,
    UserMinimum? repliedToUserDetails,
    String? commentReplyText,
    @TimestampConverter() DateTime? createdAt,
    List<UserReaction>? reactions,
  }) = _FeedCommentReplyModel;

  factory FeedCommentReplyModel.fromJson(Map<String, dynamic> json) =>
      _$FeedCommentReplyModelFromJson(json);
}
