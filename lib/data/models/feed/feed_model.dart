import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/models/feed/comment/feed_comment_model.dart';
import 'package:nova_social/data/models/misc/converters/converters.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
part 'feed_model.freezed.dart';
part 'feed_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class FeedModel with _$FeedModel {
  const factory FeedModel({
    String? id,
    UserMinimum? userDetails,
    String? feedText,
    List<String>? generatedFeedUrl,
    List<FeedCommentModel>? comments,
    @TimestampConverter() DateTime? createdAt,
    List<UserReaction>? reactions,
    List<UserMinimum>? reportedAbusiveBy,
  }) = _FeedModel;

  factory FeedModel.fromJson(Map<String, dynamic> json) =>
      _$FeedModelFromJson(json);
}
