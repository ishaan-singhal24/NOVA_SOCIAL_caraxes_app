// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internship_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InternshipCategoryModel _$$_InternshipCategoryModelFromJson(Map json) =>
    _$_InternshipCategoryModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      coverImageUrl: json['coverImageUrl'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_InternshipCategoryModelToJson(
        _$_InternshipCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coverImageUrl': instance.coverImageUrl,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
