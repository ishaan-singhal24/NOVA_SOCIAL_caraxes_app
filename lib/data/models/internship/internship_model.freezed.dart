// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'internship_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InternshipModel _$InternshipModelFromJson(Map<String, dynamic> json) {
  return _InternshipModel.fromJson(json);
}

/// @nodoc
mixin _$InternshipModel {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get internshipDescription => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get companyName => throw _privateConstructorUsedError;
  String? get companyDescription => throw _privateConstructorUsedError;
  String? get companyIconUrl => throw _privateConstructorUsedError;
  InternshipCategoryModel? get internshipCategory =>
      throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get expiry => throw _privateConstructorUsedError;
  String? get durationInDays => throw _privateConstructorUsedError;
  List<UserMinimum>? get interestedUsers => throw _privateConstructorUsedError;
  List<InternshipTagsModel>? get relatedTags =>
      throw _privateConstructorUsedError;
  bool? get isLive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InternshipModelCopyWith<InternshipModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InternshipModelCopyWith<$Res> {
  factory $InternshipModelCopyWith(
          InternshipModel value, $Res Function(InternshipModel) then) =
      _$InternshipModelCopyWithImpl<$Res, InternshipModel>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? internshipDescription,
      String? location,
      String? companyName,
      String? companyDescription,
      String? companyIconUrl,
      InternshipCategoryModel? internshipCategory,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? expiry,
      String? durationInDays,
      List<UserMinimum>? interestedUsers,
      List<InternshipTagsModel>? relatedTags,
      bool? isLive});

  $InternshipCategoryModelCopyWith<$Res>? get internshipCategory;
}

/// @nodoc
class _$InternshipModelCopyWithImpl<$Res, $Val extends InternshipModel>
    implements $InternshipModelCopyWith<$Res> {
  _$InternshipModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? internshipDescription = freezed,
    Object? location = freezed,
    Object? companyName = freezed,
    Object? companyDescription = freezed,
    Object? companyIconUrl = freezed,
    Object? internshipCategory = freezed,
    Object? createdAt = freezed,
    Object? expiry = freezed,
    Object? durationInDays = freezed,
    Object? interestedUsers = freezed,
    Object? relatedTags = freezed,
    Object? isLive = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      internshipDescription: freezed == internshipDescription
          ? _value.internshipDescription
          : internshipDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyDescription: freezed == companyDescription
          ? _value.companyDescription
          : companyDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      companyIconUrl: freezed == companyIconUrl
          ? _value.companyIconUrl
          : companyIconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      internshipCategory: freezed == internshipCategory
          ? _value.internshipCategory
          : internshipCategory // ignore: cast_nullable_to_non_nullable
              as InternshipCategoryModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiry: freezed == expiry
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      durationInDays: freezed == durationInDays
          ? _value.durationInDays
          : durationInDays // ignore: cast_nullable_to_non_nullable
              as String?,
      interestedUsers: freezed == interestedUsers
          ? _value.interestedUsers
          : interestedUsers // ignore: cast_nullable_to_non_nullable
              as List<UserMinimum>?,
      relatedTags: freezed == relatedTags
          ? _value.relatedTags
          : relatedTags // ignore: cast_nullable_to_non_nullable
              as List<InternshipTagsModel>?,
      isLive: freezed == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InternshipCategoryModelCopyWith<$Res>? get internshipCategory {
    if (_value.internshipCategory == null) {
      return null;
    }

    return $InternshipCategoryModelCopyWith<$Res>(_value.internshipCategory!,
        (value) {
      return _then(_value.copyWith(internshipCategory: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InternshipModelCopyWith<$Res>
    implements $InternshipModelCopyWith<$Res> {
  factory _$$_InternshipModelCopyWith(
          _$_InternshipModel value, $Res Function(_$_InternshipModel) then) =
      __$$_InternshipModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? internshipDescription,
      String? location,
      String? companyName,
      String? companyDescription,
      String? companyIconUrl,
      InternshipCategoryModel? internshipCategory,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? expiry,
      String? durationInDays,
      List<UserMinimum>? interestedUsers,
      List<InternshipTagsModel>? relatedTags,
      bool? isLive});

  @override
  $InternshipCategoryModelCopyWith<$Res>? get internshipCategory;
}

/// @nodoc
class __$$_InternshipModelCopyWithImpl<$Res>
    extends _$InternshipModelCopyWithImpl<$Res, _$_InternshipModel>
    implements _$$_InternshipModelCopyWith<$Res> {
  __$$_InternshipModelCopyWithImpl(
      _$_InternshipModel _value, $Res Function(_$_InternshipModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? internshipDescription = freezed,
    Object? location = freezed,
    Object? companyName = freezed,
    Object? companyDescription = freezed,
    Object? companyIconUrl = freezed,
    Object? internshipCategory = freezed,
    Object? createdAt = freezed,
    Object? expiry = freezed,
    Object? durationInDays = freezed,
    Object? interestedUsers = freezed,
    Object? relatedTags = freezed,
    Object? isLive = freezed,
  }) {
    return _then(_$_InternshipModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      internshipDescription: freezed == internshipDescription
          ? _value.internshipDescription
          : internshipDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyDescription: freezed == companyDescription
          ? _value.companyDescription
          : companyDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      companyIconUrl: freezed == companyIconUrl
          ? _value.companyIconUrl
          : companyIconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      internshipCategory: freezed == internshipCategory
          ? _value.internshipCategory
          : internshipCategory // ignore: cast_nullable_to_non_nullable
              as InternshipCategoryModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiry: freezed == expiry
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      durationInDays: freezed == durationInDays
          ? _value.durationInDays
          : durationInDays // ignore: cast_nullable_to_non_nullable
              as String?,
      interestedUsers: freezed == interestedUsers
          ? _value.interestedUsers
          : interestedUsers // ignore: cast_nullable_to_non_nullable
              as List<UserMinimum>?,
      relatedTags: freezed == relatedTags
          ? _value.relatedTags
          : relatedTags // ignore: cast_nullable_to_non_nullable
              as List<InternshipTagsModel>?,
      isLive: freezed == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InternshipModel implements _InternshipModel {
  const _$_InternshipModel(
      {this.id,
      this.title,
      this.internshipDescription,
      this.location,
      this.companyName,
      this.companyDescription,
      this.companyIconUrl,
      this.internshipCategory,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.expiry,
      this.durationInDays,
      this.interestedUsers,
      this.relatedTags,
      this.isLive});

  factory _$_InternshipModel.fromJson(Map<String, dynamic> json) =>
      _$$_InternshipModelFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? internshipDescription;
  @override
  final String? location;
  @override
  final String? companyName;
  @override
  final String? companyDescription;
  @override
  final String? companyIconUrl;
  @override
  final InternshipCategoryModel? internshipCategory;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? expiry;
  @override
  final String? durationInDays;
  @override
  final List<UserMinimum>? interestedUsers;
  @override
  final List<InternshipTagsModel>? relatedTags;
  @override
  final bool? isLive;

  @override
  String toString() {
    return 'InternshipModel(id: $id, title: $title, internshipDescription: $internshipDescription, location: $location, companyName: $companyName, companyDescription: $companyDescription, companyIconUrl: $companyIconUrl, internshipCategory: $internshipCategory, createdAt: $createdAt, expiry: $expiry, durationInDays: $durationInDays, interestedUsers: $interestedUsers, relatedTags: $relatedTags, isLive: $isLive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InternshipModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.internshipDescription, internshipDescription) ||
                other.internshipDescription == internshipDescription) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.companyDescription, companyDescription) ||
                other.companyDescription == companyDescription) &&
            (identical(other.companyIconUrl, companyIconUrl) ||
                other.companyIconUrl == companyIconUrl) &&
            (identical(other.internshipCategory, internshipCategory) ||
                other.internshipCategory == internshipCategory) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiry, expiry) || other.expiry == expiry) &&
            (identical(other.durationInDays, durationInDays) ||
                other.durationInDays == durationInDays) &&
            const DeepCollectionEquality()
                .equals(other.interestedUsers, interestedUsers) &&
            const DeepCollectionEquality()
                .equals(other.relatedTags, relatedTags) &&
            (identical(other.isLive, isLive) || other.isLive == isLive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      internshipDescription,
      location,
      companyName,
      companyDescription,
      companyIconUrl,
      internshipCategory,
      createdAt,
      expiry,
      durationInDays,
      const DeepCollectionEquality().hash(interestedUsers),
      const DeepCollectionEquality().hash(relatedTags),
      isLive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InternshipModelCopyWith<_$_InternshipModel> get copyWith =>
      __$$_InternshipModelCopyWithImpl<_$_InternshipModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InternshipModelToJson(
      this,
    );
  }
}

abstract class _InternshipModel implements InternshipModel {
  const factory _InternshipModel(
      {final String? id,
      final String? title,
      final String? internshipDescription,
      final String? location,
      final String? companyName,
      final String? companyDescription,
      final String? companyIconUrl,
      final InternshipCategoryModel? internshipCategory,
      @TimestampConverter() final DateTime? createdAt,
      @TimestampConverter() final DateTime? expiry,
      final String? durationInDays,
      final List<UserMinimum>? interestedUsers,
      final List<InternshipTagsModel>? relatedTags,
      final bool? isLive}) = _$_InternshipModel;

  factory _InternshipModel.fromJson(Map<String, dynamic> json) =
      _$_InternshipModel.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get internshipDescription;
  @override
  String? get location;
  @override
  String? get companyName;
  @override
  String? get companyDescription;
  @override
  String? get companyIconUrl;
  @override
  InternshipCategoryModel? get internshipCategory;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @TimestampConverter()
  DateTime? get expiry;
  @override
  String? get durationInDays;
  @override
  List<UserMinimum>? get interestedUsers;
  @override
  List<InternshipTagsModel>? get relatedTags;
  @override
  bool? get isLive;
  @override
  @JsonKey(ignore: true)
  _$$_InternshipModelCopyWith<_$_InternshipModel> get copyWith =>
      throw _privateConstructorUsedError;
}
