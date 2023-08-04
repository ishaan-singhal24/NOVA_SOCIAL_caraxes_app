// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VolunteerCWProxy {
  Volunteer id(String? id);

  Volunteer title(String? title);

  Volunteer organization(String? organization);

  Volunteer website(String? website);

  Volunteer startDate(DateTime? startDate);

  Volunteer endDate(DateTime? endDate);

  Volunteer description(String? description);

  Volunteer currentlyVolunteering(bool? currentlyVolunteering);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Volunteer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Volunteer(...).copyWith(id: 12, name: "My name")
  /// ````
  Volunteer call({
    String? id,
    String? title,
    String? organization,
    String? website,
    DateTime? startDate,
    DateTime? endDate,
    String? description,
    bool? currentlyVolunteering,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVolunteer.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVolunteer.copyWith.fieldName(...)`
class _$VolunteerCWProxyImpl implements _$VolunteerCWProxy {
  const _$VolunteerCWProxyImpl(this._value);

  final Volunteer _value;

  @override
  Volunteer id(String? id) => this(id: id);

  @override
  Volunteer title(String? title) => this(title: title);

  @override
  Volunteer organization(String? organization) =>
      this(organization: organization);

  @override
  Volunteer website(String? website) => this(website: website);

  @override
  Volunteer startDate(DateTime? startDate) => this(startDate: startDate);

  @override
  Volunteer endDate(DateTime? endDate) => this(endDate: endDate);

  @override
  Volunteer description(String? description) => this(description: description);

  @override
  Volunteer currentlyVolunteering(bool? currentlyVolunteering) =>
      this(currentlyVolunteering: currentlyVolunteering);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Volunteer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Volunteer(...).copyWith(id: 12, name: "My name")
  /// ````
  Volunteer call({
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? organization = const $CopyWithPlaceholder(),
    Object? website = const $CopyWithPlaceholder(),
    Object? startDate = const $CopyWithPlaceholder(),
    Object? endDate = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? currentlyVolunteering = const $CopyWithPlaceholder(),
  }) {
    return Volunteer(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      organization: organization == const $CopyWithPlaceholder()
          ? _value.organization
          // ignore: cast_nullable_to_non_nullable
          : organization as String?,
      website: website == const $CopyWithPlaceholder()
          ? _value.website
          // ignore: cast_nullable_to_non_nullable
          : website as String?,
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
      currentlyVolunteering:
          currentlyVolunteering == const $CopyWithPlaceholder()
              ? _value.currentlyVolunteering
              // ignore: cast_nullable_to_non_nullable
              : currentlyVolunteering as bool?,
    );
  }
}

extension $VolunteerCopyWith on Volunteer {
  /// Returns a callable class that can be used as follows: `instanceOfVolunteer.copyWith(...)` or like so:`instanceOfVolunteer.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VolunteerCWProxy get copyWith => _$VolunteerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Volunteer _$VolunteerFromJson(Map json) => Volunteer(
      id: json['id'] as String?,
      title: json['title'] as String?,
      organization: json['organization'] as String?,
      website: json['website'] as String?,
      startDate:
          const TimestampConverter().fromJson(json['startDate'] as Timestamp?),
      endDate:
          const TimestampConverter().fromJson(json['endDate'] as Timestamp?),
      description: json['description'] as String?,
      currentlyVolunteering: json['currentlyVolunteering'] as bool?,
    );

Map<String, dynamic> _$VolunteerToJson(Volunteer instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'organization': instance.organization,
      'website': instance.website,
      'startDate': const TimestampConverter().toJson(instance.startDate),
      'endDate': const TimestampConverter().toJson(instance.endDate),
      'description': instance.description,
      'currentlyVolunteering': instance.currentlyVolunteering,
    };
