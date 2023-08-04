// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internship_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InternshipModel _$$_InternshipModelFromJson(Map json) => _$_InternshipModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      internshipDescription: json['internshipDescription'] as String?,
      location: json['location'] as String?,
      companyName: json['companyName'] as String?,
      companyDescription: json['companyDescription'] as String?,
      companyIconUrl: json['companyIconUrl'] as String?,
      internshipCategory: json['internshipCategory'] == null
          ? null
          : InternshipCategoryModel.fromJson(
              Map<String, dynamic>.from(json['internshipCategory'] as Map)),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      expiry: const TimestampConverter().fromJson(json['expiry'] as Timestamp?),
      durationInDays: json['durationInDays'] as String?,
      interestedUsers: (json['interestedUsers'] as List<dynamic>?)
          ?.map(
              (e) => UserMinimum.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      relatedTags: (json['relatedTags'] as List<dynamic>?)
          ?.map((e) =>
              InternshipTagsModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      isLive: json['isLive'] as bool?,
    );

Map<String, dynamic> _$$_InternshipModelToJson(_$_InternshipModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'internshipDescription': instance.internshipDescription,
      'location': instance.location,
      'companyName': instance.companyName,
      'companyDescription': instance.companyDescription,
      'companyIconUrl': instance.companyIconUrl,
      'internshipCategory': instance.internshipCategory?.toJson(),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'expiry': const TimestampConverter().toJson(instance.expiry),
      'durationInDays': instance.durationInDays,
      'interestedUsers':
          instance.interestedUsers?.map((e) => e.toJson()).toList(),
      'relatedTags': instance.relatedTags?.map((e) => e.toJson()).toList(),
      'isLive': instance.isLive,
    };
