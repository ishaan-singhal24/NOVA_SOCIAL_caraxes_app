// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ExperienceCWProxy {
  Experience company(String? company);

  Experience website(String? website);

  Experience jobTitle(String? jobTitle);

  Experience startDate(DateTime? startDate);

  Experience endDate(DateTime? endDate);

  Experience description(String? description);

  Experience location(String? location);

  Experience currentlyWorkingHere(bool? currentlyWorkingHere);

  Experience subTag(ExperienceSubtag? subTag);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Experience(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Experience(...).copyWith(id: 12, name: "My name")
  /// ````
  Experience call({
    String? company,
    String? website,
    String? jobTitle,
    DateTime? startDate,
    DateTime? endDate,
    String? description,
    String? location,
    bool? currentlyWorkingHere,
    ExperienceSubtag? subTag,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfExperience.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfExperience.copyWith.fieldName(...)`
class _$ExperienceCWProxyImpl implements _$ExperienceCWProxy {
  const _$ExperienceCWProxyImpl(this._value);

  final Experience _value;

  @override
  Experience company(String? company) => this(company: company);

  @override
  Experience website(String? website) => this(website: website);

  @override
  Experience jobTitle(String? jobTitle) => this(jobTitle: jobTitle);

  @override
  Experience startDate(DateTime? startDate) => this(startDate: startDate);

  @override
  Experience endDate(DateTime? endDate) => this(endDate: endDate);

  @override
  Experience description(String? description) => this(description: description);

  @override
  Experience location(String? location) => this(location: location);

  @override
  Experience currentlyWorkingHere(bool? currentlyWorkingHere) =>
      this(currentlyWorkingHere: currentlyWorkingHere);

  @override
  Experience subTag(ExperienceSubtag? subTag) => this(subTag: subTag);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Experience(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Experience(...).copyWith(id: 12, name: "My name")
  /// ````
  Experience call({
    Object? company = const $CopyWithPlaceholder(),
    Object? website = const $CopyWithPlaceholder(),
    Object? jobTitle = const $CopyWithPlaceholder(),
    Object? startDate = const $CopyWithPlaceholder(),
    Object? endDate = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? currentlyWorkingHere = const $CopyWithPlaceholder(),
    Object? subTag = const $CopyWithPlaceholder(),
  }) {
    return Experience(
      company: company == const $CopyWithPlaceholder()
          ? _value.company
          // ignore: cast_nullable_to_non_nullable
          : company as String?,
      website: website == const $CopyWithPlaceholder()
          ? _value.website
          // ignore: cast_nullable_to_non_nullable
          : website as String?,
      jobTitle: jobTitle == const $CopyWithPlaceholder()
          ? _value.jobTitle
          // ignore: cast_nullable_to_non_nullable
          : jobTitle as String?,
      startDate: startDate == const $CopyWithPlaceholder()
          ? _value.startDate
          // ignore: cast_nullable_to_non_nullable
          : startDate as DateTime?,
      endDate: endDate == const $CopyWithPlaceholder()
          ? _value.endDate
          // ignore: cast_nullable_to_non_nullable
          : endDate as DateTime?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      location: location == const $CopyWithPlaceholder()
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as String?,
      currentlyWorkingHere: currentlyWorkingHere == const $CopyWithPlaceholder()
          ? _value.currentlyWorkingHere
          // ignore: cast_nullable_to_non_nullable
          : currentlyWorkingHere as bool?,
      subTag: subTag == const $CopyWithPlaceholder()
          ? _value.subTag
          // ignore: cast_nullable_to_non_nullable
          : subTag as ExperienceSubtag?,
    );
  }
}

extension $ExperienceCopyWith on Experience {
  /// Returns a callable class that can be used as follows: `instanceOfExperience.copyWith(...)` or like so:`instanceOfExperience.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ExperienceCWProxy get copyWith => _$ExperienceCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Experience _$ExperienceFromJson(Map json) => Experience(
      company: json['company'] as String?,
      website: json['website'] as String?,
      jobTitle: json['jobTitle'] as String?,
      startDate:
          const TimestampConverter().fromJson(json['startDate'] as Timestamp?),
      endDate:
          const TimestampConverter().fromJson(json['endDate'] as Timestamp?),
      description: json['description'] as String?,
      location: json['location'] as String?,
      currentlyWorkingHere: json['currentlyWorkingHere'] as bool?,
      subTag: $enumDecodeNullable(_$ExperienceSubtagEnumMap, json['subTag']),
    );

Map<String, dynamic> _$ExperienceToJson(Experience instance) =>
    <String, dynamic>{
      'company': instance.company,
      'website': instance.website,
      'jobTitle': instance.jobTitle,
      'startDate': const TimestampConverter().toJson(instance.startDate),
      'endDate': const TimestampConverter().toJson(instance.endDate),
      'currentlyWorkingHere': instance.currentlyWorkingHere,
      'description': instance.description,
      'location': instance.location,
      'subTag': _$ExperienceSubtagEnumMap[instance.subTag],
    };

const _$ExperienceSubtagEnumMap = {
  ExperienceSubtag.Work: 'Work',
  ExperienceSubtag.Leadership: 'Leadership',
  ExperienceSubtag.Athletic: 'Athletic',
};
