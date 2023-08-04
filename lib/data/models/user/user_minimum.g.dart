// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_minimum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserMinimum _$$_UserMinimumFromJson(Map json) => _$_UserMinimum(
      id: json['id'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      profilePictureUrl: json['profilePictureUrl'] as String?,
      profileWallpaperUrl: json['profileWallpaperUrl'] as String?,
      tagline: json['tagline'] as String?,
      fcmToken: json['fcmToken'] as String?,
      connections: (json['connections'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as bool),
      ),
    );

Map<String, dynamic> _$$_UserMinimumToJson(_$_UserMinimum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'profilePictureUrl': instance.profilePictureUrl,
      'profileWallpaperUrl': instance.profileWallpaperUrl,
      'tagline': instance.tagline,
      'fcmToken': instance.fcmToken,
      'connections': instance.connections,
    };
