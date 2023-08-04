// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EducationCWProxy {
  Education id(String? id);

  Education school(String? school);

  Education degree(String? degree);

  Education startDate(DateTime? startDate);

  Education endDate(DateTime? endDate);

  Education fieldOfStudy(String? fieldOfStudy);

  Education description(String? description);

  Education location(String? location);

  Education currentlyStudyHere(bool? currentlyStudyHere);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Education(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Education(...).copyWith(id: 12, name: "My name")
  /// ````
  Education call({
    String? id,
    String? school,
    String? degree,
    DateTime? startDate,
    DateTime? endDate,
    String? fieldOfStudy,
    String? description,
    String? location,
    bool? currentlyStudyHere,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEducation.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEducation.copyWith.fieldName(...)`
class _$EducationCWProxyImpl implements _$EducationCWProxy {
  const _$EducationCWProxyImpl(this._value);

  final Education _value;

  @override
  Education id(String? id) => this(id: id);

  @override
  Education school(String? school) => this(school: school);

  @override
  Education degree(String? degree) => this(degree: degree);

  @override
  Education startDate(DateTime? startDate) => this(startDate: startDate);

  @override
  Education endDate(DateTime? endDate) => this(endDate: endDate);

  @override
  Education fieldOfStudy(String? fieldOfStudy) =>
      this(fieldOfStudy: fieldOfStudy);

  @override
  Education description(String? description) => this(description: description);

  @override
  Education location(String? location) => this(location: location);

  @override
  Education currentlyStudyHere(bool? currentlyStudyHere) =>
      this(currentlyStudyHere: currentlyStudyHere);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Education(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Education(...).copyWith(id: 12, name: "My name")
  /// ````
  Education call({
    Object? id = const $CopyWithPlaceholder(),
    Object? school = const $CopyWithPlaceholder(),
    Object? degree = const $CopyWithPlaceholder(),
    Object? startDate = const $CopyWithPlaceholder(),
    Object? endDate = const $CopyWithPlaceholder(),
    Object? fieldOfStudy = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? currentlyStudyHere = const $CopyWithPlaceholder(),
  }) {
    return Education(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      school: school == const $CopyWithPlaceholder()
          ? _value.school
          // ignore: cast_nullable_to_non_nullable
          : school as String?,
      degree: degree == const $CopyWithPlaceholder()
          ? _value.degree
          // ignore: cast_nullable_to_non_nullable
          : degree as String?,
      startDate: startDate == const $CopyWithPlaceholder()
          ? _value.startDate
          // ignore: cast_nullable_to_non_nullable
          : startDate as DateTime?,
      endDate: endDate == const $CopyWithPlaceholder()
          ? _value.endDate
          // ignore: cast_nullable_to_non_nullable
          : endDate as DateTime?,
      fieldOfStudy: fieldOfStudy == const $CopyWithPlaceholder()
          ? _value.fieldOfStudy
          // ignore: cast_nullable_to_non_nullable
          : fieldOfStudy as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as String?,
      currentlyStudyHere: currentlyStudyHere == const $CopyWithPlaceholder()
          ? _value.currentlyStudyHere
          // ignore: cast_nullable_to_non_nullable
          : currentlyStudyHere as bool?,
    );
  }
}

extension $EducationCopyWith on Education {
  /// Returns a callable class that can be used as follows: `instanceOfEducation.copyWith(...)` or like so:`instanceOfEducation.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EducationCWProxy get copyWith => _$EducationCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Education _$EducationFromJson(Map json) => Education(
      id: json['id'] as String?,
      school: json['school'] as String?,
      degree: json['degree'] as String?,
      startDate:
          const TimestampConverter().fromJson(json['startDate'] as Timestamp?),
      endDate:
          const TimestampConverter().fromJson(json['endDate'] as Timestamp?),
      fieldOfStudy: json['fieldOfStudy'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      currentlyStudyHere: json['currentlyStudyHere'] as bool?,
    );

Map<String, dynamic> _$EducationToJson(Education instance) => <String, dynamic>{
      'id': instance.id,
      'school': instance.school,
      'degree': instance.degree,
      'startDate': const TimestampConverter().toJson(instance.startDate),
      'endDate': const TimestampConverter().toJson(instance.endDate),
      'fieldOfStudy': instance.fieldOfStudy,
      'description': instance.description,
      'location': instance.location,
      'currentlyStudyHere': instance.currentlyStudyHere,
    };
