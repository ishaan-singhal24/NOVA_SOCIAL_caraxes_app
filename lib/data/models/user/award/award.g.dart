// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'award.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AwardCWProxy {
  Award id(String? id);

  Award name(String? name);

  Award website(String? website);

  Award issuedBy(String? issuedBy);

  Award issueDate(DateTime? issueDate);

  Award description(String? description);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Award(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Award(...).copyWith(id: 12, name: "My name")
  /// ````
  Award call({
    String? id,
    String? name,
    String? website,
    String? issuedBy,
    DateTime? issueDate,
    String? description,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAward.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAward.copyWith.fieldName(...)`
class _$AwardCWProxyImpl implements _$AwardCWProxy {
  const _$AwardCWProxyImpl(this._value);

  final Award _value;

  @override
  Award id(String? id) => this(id: id);

  @override
  Award name(String? name) => this(name: name);

  @override
  Award website(String? website) => this(website: website);

  @override
  Award issuedBy(String? issuedBy) => this(issuedBy: issuedBy);

  @override
  Award issueDate(DateTime? issueDate) => this(issueDate: issueDate);

  @override
  Award description(String? description) => this(description: description);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Award(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Award(...).copyWith(id: 12, name: "My name")
  /// ````
  Award call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? website = const $CopyWithPlaceholder(),
    Object? issuedBy = const $CopyWithPlaceholder(),
    Object? issueDate = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
  }) {
    return Award(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      website: website == const $CopyWithPlaceholder()
          ? _value.website
          // ignore: cast_nullable_to_non_nullable
          : website as String?,
      issuedBy: issuedBy == const $CopyWithPlaceholder()
          ? _value.issuedBy
          // ignore: cast_nullable_to_non_nullable
          : issuedBy as String?,
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

extension $AwardCopyWith on Award {
  /// Returns a callable class that can be used as follows: `instanceOfAward.copyWith(...)` or like so:`instanceOfAward.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AwardCWProxy get copyWith => _$AwardCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Award _$AwardFromJson(Map json) => Award(
      id: json['id'] as String?,
      name: json['name'] as String?,
      website: json['website'] as String?,
      issuedBy: json['issuedBy'] as String?,
      issueDate:
          const TimestampConverter().fromJson(json['issueDate'] as Timestamp?),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AwardToJson(Award instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'website': instance.website,
      'issuedBy': instance.issuedBy,
      'issueDate': const TimestampConverter().toJson(instance.issueDate),
      'description': instance.description,
    };
