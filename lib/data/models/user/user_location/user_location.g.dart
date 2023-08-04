// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserLocation _$$_UserLocationFromJson(Map json) => _$_UserLocation(
      id: json['id'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      concatinated: json['concatinated'] as String?,
    );

Map<String, dynamic> _$$_UserLocationToJson(_$_UserLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'concatinated': instance.concatinated,
    };
