// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aptitude_test.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AptitudeTestCWProxy {
  AptitudeTest id(String? id);

  AptitudeTest name(String? name);

  AptitudeTest issuedBy(String? issuedBy);

  AptitudeTest website(String? website);

  AptitudeTest issueDate(DateTime? issueDate);

  AptitudeTest description(String? description);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AptitudeTest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AptitudeTest(...).copyWith(id: 12, name: "My name")
  /// ````
  AptitudeTest call({
    String? id,
    String? name,
    String? issuedBy,
    String? website,
    DateTime? issueDate,
    String? description,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAptitudeTest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAptitudeTest.copyWith.fieldName(...)`
class _$AptitudeTestCWProxyImpl implements _$AptitudeTestCWProxy {
  const _$AptitudeTestCWProxyImpl(this._value);

  final AptitudeTest _value;

  @override
  AptitudeTest id(String? id) => this(id: id);

  @override
  AptitudeTest name(String? name) => this(name: name);

  @override
  AptitudeTest issuedBy(String? issuedBy) => this(issuedBy: issuedBy);

  @override
  AptitudeTest website(String? website) => this(website: website);

  @override
  AptitudeTest issueDate(DateTime? issueDate) => this(issueDate: issueDate);

  @override
  AptitudeTest description(String? description) =>
      this(description: description);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AptitudeTest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AptitudeTest(...).copyWith(id: 12, name: "My name")
  /// ````
  AptitudeTest call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? issuedBy = const $CopyWithPlaceholder(),
    Object? website = const $CopyWithPlaceholder(),
    Object? issueDate = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
  }) {
    return AptitudeTest(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      issuedBy: issuedBy == const $CopyWithPlaceholder()
          ? _value.issuedBy
          // ignore: cast_nullable_to_non_nullable
          : issuedBy as String?,
      website: website == const $CopyWithPlaceholder()
          ? _value.website
          // ignore: cast_nullable_to_non_nullable
          : website as String?,
      issueDate: issueDate == const $CopyWithPlaceholder()
          ? _value.issueDate
          // ignore: cast_nullable_to_non_nullable
          : issueDate as DateTime?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
    );
  }
}

extension $AptitudeTestCopyWith on AptitudeTest {
  /// Returns a callable class that can be used as follows: `instanceOfAptitudeTest.copyWith(...)` or like so:`instanceOfAptitudeTest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AptitudeTestCWProxy get copyWith => _$AptitudeTestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AptitudeTest _$AptitudeTestFromJson(Map json) => AptitudeTest(
      id: json['id'] as String?,
      name: json['name'] as String?,
      issuedBy: json['issuedBy'] as String?,
      website: json['website'] as String?,
      issueDate:
          const TimestampConverter().fromJson(json['issueDate'] as Timestamp?),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AptitudeTestToJson(AptitudeTest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'issuedBy': instance.issuedBy,
      'website': instance.website,
      'issueDate': const TimestampConverter().toJson(instance.issueDate),
      'description': instance.description,
    };
