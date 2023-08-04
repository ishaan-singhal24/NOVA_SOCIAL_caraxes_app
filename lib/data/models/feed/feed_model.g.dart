// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeedModel _$$_FeedModelFromJson(Map json) => _$_FeedModel(
      id: json['id'] as String?,
      userDetails: json['userDetails'] == null
          ? null
          : UserMinimum.fromJson(
              Map<String, dynamic>.from(json['userDetails'] as Map)),
      feedText: json['feedText'] as String?,
      generatedFeedUrl: (json['generatedFeedUrl'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) =>
              FeedCommentModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      reactions: (json['reactions'] as List<dynamic>?)
          ?.map(
              (e) => UserReaction.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      reportedAbusiveBy: (json['reportedAbusiveBy'] as List<dynamic>?)
          ?.map(
              (e) => UserMinimum.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_FeedModelToJson(_$_FeedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userDetails': instance.userDetails?.toJson(),
      'feedText': instance.feedText,
      'generatedFeedUrl': instance.generatedFeedUrl,
      'comments': instance.comments?.map((e) => e.toJson()).toList(),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'reactions': instance.reactions?.map((e) => e.toJson()).toList(),
      'reportedAbusiveBy':
          instance.reportedAbusiveBy?.map((e) => e.toJson()).toList(),
    };
