// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playground_feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlaygroundFeedModel _$$_PlaygroundFeedModelFromJson(Map json) =>
    _$_PlaygroundFeedModel(
      id: json['id'] as String?,
      prompt: json['prompt'] as String?,
      generatedFeedUrl: json['generatedFeedUrl'] as String?,
      userDetails: json['userDetails'] == null
          ? null
          : UserMinimum.fromJson(
              Map<String, dynamic>.from(json['userDetails'] as Map)),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => PlaygroundFeedCommentModel.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      reactions: (json['reactions'] as List<dynamic>?)
          ?.map(
              (e) => UserReaction.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_PlaygroundFeedModelToJson(
        _$_PlaygroundFeedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prompt': instance.prompt,
      'generatedFeedUrl': instance.generatedFeedUrl,
      'userDetails': instance.userDetails?.toJson(),
      'comments': instance.comments?.map((e) => e.toJson()).toList(),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'reactions': instance.reactions?.map((e) => e.toJson()).toList(),
    };
