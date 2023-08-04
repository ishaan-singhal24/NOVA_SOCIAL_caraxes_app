// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserCollection _$$_UserCollectionFromJson(Map json) => _$_UserCollection(
      id: json['id'] as String?,
      name: json['name'] as String?,
      tagline: json['tagline'] as String?,
      iconUrl: json['iconUrl'] as String?,
      color: const ColorConverter().fromJson(json['color'] as int?),
      item: (json['item'] as List<dynamic>?)
          ?.map((e) =>
              UserCollectionItem.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_UserCollectionToJson(_$_UserCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tagline': instance.tagline,
      'iconUrl': instance.iconUrl,
      'color': const ColorConverter().toJson(instance.color),
      'item': instance.item?.map((e) => e.toJson()).toList(),
    };
