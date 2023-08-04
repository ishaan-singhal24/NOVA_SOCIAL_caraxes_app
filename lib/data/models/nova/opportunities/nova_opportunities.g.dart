// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nova_opportunities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NovaOpportunities _$$_NovaOpportunitiesFromJson(Map json) =>
    _$_NovaOpportunities(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      iconUrl: json['iconUrl'] as String?,
      mapSvgUrl: json['mapSvgUrl'] as String?,
      topDisplayPosition: json['topDisplayPosition'] as String?,
      leftDisplayPosition: json['leftDisplayPosition'] as String?,
      semanticsLabel: json['semanticsLabel'] as String?,
      angle: json['angle'] as String?,
    );

Map<String, dynamic> _$$_NovaOpportunitiesToJson(
        _$_NovaOpportunities instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'iconUrl': instance.iconUrl,
      'mapSvgUrl': instance.mapSvgUrl,
      'topDisplayPosition': instance.topDisplayPosition,
      'leftDisplayPosition': instance.leftDisplayPosition,
      'semanticsLabel': instance.semanticsLabel,
      'angle': instance.angle,
    };
