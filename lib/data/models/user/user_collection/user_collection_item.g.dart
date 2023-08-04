// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_collection_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserCollectionItem _$$_UserCollectionItemFromJson(Map json) =>
    _$_UserCollectionItem(
      id: json['id'] as String?,
      name: json['name'] as String?,
      tagline: json['tagline'] as String?,
      description: json['description'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      fileUrl: json['fileUrl'] as String?,
      startDate:
          const TimestampConverter().fromJson(json['startDate'] as Timestamp?),
      endDate:
          const TimestampConverter().fromJson(json['endDate'] as Timestamp?),
      reactions: (json['reactions'] as List<dynamic>?)
          ?.map(
              (e) => UserReaction.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_UserCollectionItemToJson(
        _$_UserCollectionItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tagline': instance.tagline,
      'description': instance.description,
      'thumbnailUrl': instance.thumbnailUrl,
      'fileUrl': instance.fileUrl,
      'startDate': const TimestampConverter().toJson(instance.startDate),
      'endDate': const TimestampConverter().toJson(instance.endDate),
      'reactions': instance.reactions?.map((e) => e.toJson()).toList(),
    };
