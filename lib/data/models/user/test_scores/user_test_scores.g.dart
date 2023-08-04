// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_test_scores.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserTestScoresCWProxy {
  UserTestScores id(String? id);

  UserTestScores testName(String? testName);

  UserTestScores conductedBy(String? conductedBy);

  UserTestScores website(String? website);

  UserTestScores testIconUrl(String? testIconUrl);

  UserTestScores scoredMarks(String? scoredMarks);

  UserTestScores maxMarks(String? maxMarks);

  UserTestScores relatedLink(String? relatedLink);

  UserTestScores testDate(DateTime? testDate);

  UserTestScores description(String? description);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserTestScores(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserTestScores(...).copyWith(id: 12, name: "My name")
  /// ````
  UserTestScores call({
    String? id,
    String? testName,
    String? conductedBy,
    String? website,
    String? testIconUrl,
    String? scoredMarks,
    String? maxMarks,
    String? relatedLink,
    DateTime? testDate,
    String? description,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserTestScores.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserTestScores.copyWith.fieldName(...)`
class _$UserTestScoresCWProxyImpl implements _$UserTestScoresCWProxy {
  const _$UserTestScoresCWProxyImpl(this._value);

  final UserTestScores _value;

  @override
  UserTestScores id(String? id) => this(id: id);

  @override
  UserTestScores testName(String? testName) => this(testName: testName);

  @override
  UserTestScores conductedBy(String? conductedBy) =>
      this(conductedBy: conductedBy);

  @override
  UserTestScores website(String? website) => this(website: website);

  @override
  UserTestScores testIconUrl(String? testIconUrl) =>
      this(testIconUrl: testIconUrl);

  @override
  UserTestScores scoredMarks(String? scoredMarks) =>
      this(scoredMarks: scoredMarks);

  @override
  UserTestScores maxMarks(String? maxMarks) => this(maxMarks: maxMarks);

  @override
  UserTestScores relatedLink(String? relatedLink) =>
      this(relatedLink: relatedLink);

  @override
  UserTestScores testDate(DateTime? testDate) => this(testDate: testDate);

  @override
  UserTestScores description(String? description) =>
      this(description: description);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserTestScores(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserTestScores(...).copyWith(id: 12, name: "My name")
  /// ````
  UserTestScores call({
    Object? id = const $CopyWithPlaceholder(),
    Object? testName = const $CopyWithPlaceholder(),
    Object? conductedBy = const $CopyWithPlaceholder(),
    Object? website = const $CopyWithPlaceholder(),
    Object? testIconUrl = const $CopyWithPlaceholder(),
    Object? scoredMarks = const $CopyWithPlaceholder(),
    Object? maxMarks = const $CopyWithPlaceholder(),
    Object? relatedLink = const $CopyWithPlaceholder(),
    Object? testDate = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
  }) {
    return UserTestScores(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      testName: testName == const $CopyWithPlaceholder()
          ? _value.testName
          // ignore: cast_nullable_to_non_nullable
          : testName as String?,
      conductedBy: conductedBy == const $CopyWithPlaceholder()
          ? _value.conductedBy
          // ignore: cast_nullable_to_non_nullable
          : conductedBy as String?,
      website: website == const $CopyWithPlaceholder()
          ? _value.website
          // ignore: cast_nullable_to_non_nullable
          : website as String?,
      testIconUrl: testIconUrl == const $CopyWithPlaceholder()
          ? _value.testIconUrl
          // ignore: cast_nullable_to_non_nullable
          : testIconUrl as String?,
      scoredMarks: scoredMarks == const $CopyWithPlaceholder()
          ? _value.scoredMarks
          // ignore: cast_nullable_to_non_nullable
          : scoredMarks as String?,
      maxMarks: maxMarks == const $CopyWithPlaceholder()
          ? _value.maxMarks
          // ignore: cast_nullable_to_non_nullable
          : maxMarks as String?,
      relatedLink: relatedLink == const $CopyWithPlaceholder()
          ? _value.relatedLink
          // ignore: cast_nullable_to_non_nullable
          : relatedLink as String?,
      testDate: testDate == const $CopyWithPlaceholder()
          ? _value.testDate
          // ignore: cast_nullable_to_non_nullable
          : testDate as DateTime?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
    );
  }
}

extension $UserTestScoresCopyWith on UserTestScores {
  /// Returns a callable class that can be used as follows: `instanceOfUserTestScores.copyWith(...)` or like so:`instanceOfUserTestScores.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserTestScoresCWProxy get copyWith => _$UserTestScoresCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTestScores _$UserTestScoresFromJson(Map json) => UserTestScores(
      id: json['id'] as String?,
      testName: json['testName'] as String?,
      conductedBy: json['conductedBy'] as String?,
      website: json['website'] as String?,
      testIconUrl: json['testIconUrl'] as String?,
      scoredMarks: json['scoredMarks'] as String?,
      maxMarks: json['maxMarks'] as String?,
      relatedLink: json['relatedLink'] as String?,
      testDate:
          const TimestampConverter().fromJson(json['testDate'] as Timestamp?),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$UserTestScoresToJson(UserTestScores instance) =>
    <String, dynamic>{
      'id': instance.id,
      'testName': instance.testName,
      'conductedBy': instance.conductedBy,
      'website': instance.website,
      'testIconUrl': instance.testIconUrl,
      'scoredMarks': instance.scoredMarks,
      'maxMarks': instance.maxMarks,
      'relatedLink': instance.relatedLink,
      'description': instance.description,
      'testDate': const TimestampConverter().toJson(instance.testDate),
    };
