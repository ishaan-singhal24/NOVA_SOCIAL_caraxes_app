// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_comment_reply_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeedCommentReplyModel _$$_FeedCommentReplyModelFromJson(Map json) =>
    _$_FeedCommentReplyModel(
      id: json['id'] as String?,
      commentId: json['commentId'] as String?,
      feedId: json['feedId'] as String?,
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

Map<String, dynamic> _$$_FeedCommentReplyModelToJson(
        _$_FeedCommentReplyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'commentId': instance.commentId,
      'feedId': instance.feedId,
      'userDetails': instance.userDetails?.toJson(),
      'repliedToUserDetails': instance.repliedToUserDetails?.toJson(),
      'commentReplyText': instance.commentReplyText,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'reactions': instance.reactions?.map((e) => e.toJson()).toList(),
    };
