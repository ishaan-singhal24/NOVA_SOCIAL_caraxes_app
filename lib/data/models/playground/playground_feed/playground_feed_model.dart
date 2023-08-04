import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/models/misc/converters/converters.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/playground/playground_feed/comment/playground_feed_comment_model.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
part 'playground_feed_model.freezed.dart';
part 'playground_feed_model.g.dart';

@freezed
class PlaygroundFeedModel with _$PlaygroundFeedModel {
  const factory PlaygroundFeedModel({
    String? id,
    String? prompt,
    String? generatedFeedUrl,
    UserMinimum? userDetails,
    List<PlaygroundFeedCommentModel>? comments,
    @TimestampConverter() DateTime? createdAt,
    List<UserReaction>? reactions,
  }) = _PlaygroundFeedModel;

  factory PlaygroundFeedModel.fromJson(Map<String, dynamic> json) =>
      _$PlaygroundFeedModelFromJson(json);
}
