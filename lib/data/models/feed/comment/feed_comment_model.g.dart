// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeedCommentModel _$$_FeedCommentModelFromJson(Map json) =>
    _$_FeedCommentModel(
      id: json['id'] as String?,
      feedId: json['feedId'] as String?,
      userDetails: json['userDetails'] == null
          ? null
          : UserMinimum.fromJson(
              Map<String, dynamic>.from(json['userDetails'] as Map)),
      replies: (json['replies'] as List<dynamic>?)
          ?.map((e) => FeedCommentReplyModel.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
      commentText: json['commentText'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      reactions: (json['reactions'] as List<dynamic>?)
          ?.map(
              (e) => UserReaction.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_FeedCommentModelToJson(_$_FeedCommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'feedId': instance.feedId,
      'userDetails': instance.userDetails?.toJson(),
      'replies': instance.replies?.map((e) => e.toJson()).toList(),
      'commentText': instance.commentText,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'reactions': instance.reactions?.map((e) => e.toJson()).toList(),
    };
