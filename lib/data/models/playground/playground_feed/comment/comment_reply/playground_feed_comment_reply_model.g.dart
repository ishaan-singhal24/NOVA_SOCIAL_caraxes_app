// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playground_feed_comment_reply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlaygroundFeedCommentReplyModel _$$_PlaygroundFeedCommentReplyModelFromJson(
        Map json) =>
    _$_PlaygroundFeedCommentReplyModel(
      id: json['id'] as String?,
      playgroundcommentId: json['playgroundcommentId'] as String?,
      playgroundFeedId: json['playgroundFeedId'] as String?,
      userDetails: json['userDetails'] == null
          ? null
          : UserMinimum.fromJson(
              Map<String, dynamic>.from(json['userDetails'] as Map)),
      repliedToUserDetails: json['repliedToUserDetails'] == null
          ? null
          : UserMinimum.fromJson(
              Map<String, dynamic>.from(json['repliedToUserDetails'] as Map)),
      commentReplyText: json['commentReplyText'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      reactions: (json['reactions'] as List<dynamic>?)
          ?.map(
              (e) => UserReaction.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_PlaygroundFeedCommentReplyModelToJson(
        _$_PlaygroundFeedCommentReplyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'playgroundcommentId': instance.playgroundcommentId,
      'playgroundFeedId': instance.playgroundFeedId,
      'userDetails': instance.userDetails?.toJson(),
      'repliedToUserDetails': instance.repliedToUserDetails?.toJson(),
      'commentReplyText': instance.commentReplyText,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'reactions': instance.reactions?.map((e) => e.toJson()).toList(),
    };
