// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Social _$$_SocialFromJson(Map json) => _$_Social(
      platform: $enumDecodeNullable(_$SocialPlatformsEnumMap, json['platform']),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_SocialToJson(_$_Social instance) => <String, dynamic>{
      'platform': _$SocialPlatformsEnumMap[instance.platform],
      'url': instance.url,
    };

const _$SocialPlatformsEnumMap = {
  SocialPlatforms.github: 'github',
  SocialPlatforms.linkedin: 'linkedin',
  SocialPlatforms.twitter: 'twitter',
  SocialPlatforms.instagram: 'instagram',
  SocialPlatforms.website: 'website',
};
