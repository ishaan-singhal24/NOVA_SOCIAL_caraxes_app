// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  UserLocation? get location => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  String? get profilePictureUrl => throw _privateConstructorUsedError;
  String? get profileWallpaperUrl => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  String? get tagline => throw _privateConstructorUsedError;
  List<Social>? get socials => throw _privateConstructorUsedError;
  List<String>? get skills => throw _privateConstructorUsedError;
  Map<String, bool>? get userInterestsIds => throw _privateConstructorUsedError;
  List<NovaInterests>? get userInterests => throw _privateConstructorUsedError;
  Map<String, bool>? get userOpportunitiesIds =>
      throw _privateConstructorUsedError;
  List<NovaOpportunities>? get userOpportunities =>
      throw _privateConstructorUsedError;
  Map<String, bool>? get experiencesIds => throw _privateConstructorUsedError;
  List<Experience>? get experiences => throw _privateConstructorUsedError;
  Map<String, bool>? get educationsIds => throw _privateConstructorUsedError;
  List<Education>? get educations => throw _privateConstructorUsedError;
  Map<String, bool>? get testScoresIds => throw _privateConstructorUsedError;
  List<UserTestScores>? get testScores => throw _privateConstructorUsedError;
  Map<String, bool>? get volunteeredIds => throw _privateConstructorUsedError;
  List<Volunteer>? get volunteered => throw _privateConstructorUsedError;
  Map<String, bool>? get aptitudeTestsIds => throw _privateConstructorUsedError;
  List<AptitudeTest>? get aptitudeTests => throw _privateConstructorUsedError;
  Map<String, bool>? get awardsIds => throw _privateConstructorUsedError;
  List<Award>? get awards => throw _privateConstructorUsedError;
  Map<String, bool>? get dreamCareersIds => throw _privateConstructorUsedError;
  List<UserDreamCareer>? get dreamCareers => throw _privateConstructorUsedError;
  Map<String, bool>? get dreamCollegesIds => throw _privateConstructorUsedError;
  List<UserDreamCollege>? get dreamColleges =>
      throw _privateConstructorUsedError;
  Map<String, bool>? get dreamCountriesIds =>
      throw _privateConstructorUsedError;
  List<UserDreamCountry>? get dreamCountries =>
      throw _privateConstructorUsedError;
  Map<String, bool>? get languagesIds => throw _privateConstructorUsedError;
  List<UserLanguages>? get languages => throw _privateConstructorUsedError;
  UserInviteModel? get invitedBy => throw _privateConstructorUsedError;
  List<UserInviteModel>? get invitedTo => throw _privateConstructorUsedError;
  bool? get inTheWaitlist => throw _privateConstructorUsedError;
  String? get inviteCode => throw _privateConstructorUsedError;
  int? get maxAllowedInvites => throw _privateConstructorUsedError;
  List<UserCollection>? get collections => throw _privateConstructorUsedError;
  String? get fcmToken => throw _privateConstructorUsedError;
  Map<String, bool>? get connections =>
      throw _privateConstructorUsedError; //user_ids of connected user, {id: true}
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  UserBlockedUsers? get blocked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? email,
      String? username,
      UserLocation? location,
      @TimestampConverter() DateTime? dateOfBirth,
      String? profilePictureUrl,
      String? profileWallpaperUrl,
      String? about,
      String? tagline,
      List<Social>? socials,
      List<String>? skills,
      Map<String, bool>? userInterestsIds,
      List<NovaInterests>? userInterests,
      Map<String, bool>? userOpportunitiesIds,
      List<NovaOpportunities>? userOpportunities,
      Map<String, bool>? experiencesIds,
      List<Experience>? experiences,
      Map<String, bool>? educationsIds,
      List<Education>? educations,
      Map<String, bool>? testScoresIds,
      List<UserTestScores>? testScores,
      Map<String, bool>? volunteeredIds,
      List<Volunteer>? volunteered,
      Map<String, bool>? aptitudeTestsIds,
      List<AptitudeTest>? aptitudeTests,
      Map<String, bool>? awardsIds,
      List<Award>? awards,
      Map<String, bool>? dreamCareersIds,
      List<UserDreamCareer>? dreamCareers,
      Map<String, bool>? dreamCollegesIds,
      List<UserDreamCollege>? dreamColleges,
      Map<String, bool>? dreamCountriesIds,
      List<UserDreamCountry>? dreamCountries,
      Map<String, bool>? languagesIds,
      List<UserLanguages>? languages,
      UserInviteModel? invitedBy,
      List<UserInviteModel>? invitedTo,
      bool? inTheWaitlist,
      String? inviteCode,
      int? maxAllowedInvites,
      List<UserCollection>? collections,
      String? fcmToken,
      Map<String, bool>? connections,
      @TimestampConverter() DateTime? createdAt,
      UserBlockedUsers? blocked});

  $UserLocationCopyWith<$Res>? get location;
  $UserBlockedUsersCopyWith<$Res>? get blocked;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? location = freezed,
    Object? dateOfBirth = freezed,
    Object? profilePictureUrl = freezed,
    Object? profileWallpaperUrl = freezed,
    Object? about = freezed,
    Object? tagline = freezed,
    Object? socials = freezed,
    Object? skills = freezed,
    Object? userInterestsIds = freezed,
    Object? userInterests = freezed,
    Object? userOpportunitiesIds = freezed,
    Object? userOpportunities = freezed,
    Object? experiencesIds = freezed,
    Object? experiences = freezed,
    Object? educationsIds = freezed,
    Object? educations = freezed,
    Object? testScoresIds = freezed,
    Object? testScores = freezed,
    Object? volunteeredIds = freezed,
    Object? volunteered = freezed,
    Object? aptitudeTestsIds = freezed,
    Object? aptitudeTests = freezed,
    Object? awardsIds = freezed,
    Object? awards = freezed,
    Object? dreamCareersIds = freezed,
    Object? dreamCareers = freezed,
    Object? dreamCollegesIds = freezed,
    Object? dreamColleges = freezed,
    Object? dreamCountriesIds = freezed,
    Object? dreamCountries = freezed,
    Object? languagesIds = freezed,
    Object? languages = freezed,
    Object? invitedBy = freezed,
    Object? invitedTo = freezed,
    Object? inTheWaitlist = freezed,
    Object? inviteCode = freezed,
    Object? maxAllowedInvites = freezed,
    Object? collections = freezed,
    Object? fcmToken = freezed,
    Object? connections = freezed,
    Object? createdAt = freezed,
    Object? blocked = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as UserLocation?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      profileWallpaperUrl: freezed == profileWallpaperUrl
          ? _value.profileWallpaperUrl
          : profileWallpaperUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      socials: freezed == socials
          ? _value.socials
          : socials // ignore: cast_nullable_to_non_nullable
              as List<Social>?,
      skills: freezed == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      userInterestsIds: freezed == userInterestsIds
          ? _value.userInterestsIds
          : userInterestsIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      userInterests: freezed == userInterests
          ? _value.userInterests
          : userInterests // ignore: cast_nullable_to_non_nullable
              as List<NovaInterests>?,
      userOpportunitiesIds: freezed == userOpportunitiesIds
          ? _value.userOpportunitiesIds
          : userOpportunitiesIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      userOpportunities: freezed == userOpportunities
          ? _value.userOpportunities
          : userOpportunities // ignore: cast_nullable_to_non_nullable
              as List<NovaOpportunities>?,
      experiencesIds: freezed == experiencesIds
          ? _value.experiencesIds
          : experiencesIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      experiences: freezed == experiences
          ? _value.experiences
          : experiences // ignore: cast_nullable_to_non_nullable
              as List<Experience>?,
      educationsIds: freezed == educationsIds
          ? _value.educationsIds
          : educationsIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      educations: freezed == educations
          ? _value.educations
          : educations // ignore: cast_nullable_to_non_nullable
              as List<Education>?,
      testScoresIds: freezed == testScoresIds
          ? _value.testScoresIds
          : testScoresIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      testScores: freezed == testScores
          ? _value.testScores
          : testScores // ignore: cast_nullable_to_non_nullable
              as List<UserTestScores>?,
      volunteeredIds: freezed == volunteeredIds
          ? _value.volunteeredIds
          : volunteeredIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      volunteered: freezed == volunteered
          ? _value.volunteered
          : volunteered // ignore: cast_nullable_to_non_nullable
              as List<Volunteer>?,
      aptitudeTestsIds: freezed == aptitudeTestsIds
          ? _value.aptitudeTestsIds
          : aptitudeTestsIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      aptitudeTests: freezed == aptitudeTests
          ? _value.aptitudeTests
          : aptitudeTests // ignore: cast_nullable_to_non_nullable
              as List<AptitudeTest>?,
      awardsIds: freezed == awardsIds
          ? _value.awardsIds
          : awardsIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      awards: freezed == awards
          ? _value.awards
          : awards // ignore: cast_nullable_to_non_nullable
              as List<Award>?,
      dreamCareersIds: freezed == dreamCareersIds
          ? _value.dreamCareersIds
          : dreamCareersIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      dreamCareers: freezed == dreamCareers
          ? _value.dreamCareers
          : dreamCareers // ignore: cast_nullable_to_non_nullable
              as List<UserDreamCareer>?,
      dreamCollegesIds: freezed == dreamCollegesIds
          ? _value.dreamCollegesIds
          : dreamCollegesIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      dreamColleges: freezed == dreamColleges
          ? _value.dreamColleges
          : dreamColleges // ignore: cast_nullable_to_non_nullable
              as List<UserDreamCollege>?,
      dreamCountriesIds: freezed == dreamCountriesIds
          ? _value.dreamCountriesIds
          : dreamCountriesIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      dreamCountries: freezed == dreamCountries
          ? _value.dreamCountries
          : dreamCountries // ignore: cast_nullable_to_non_nullable
              as List<UserDreamCountry>?,
      languagesIds: freezed == languagesIds
          ? _value.languagesIds
          : languagesIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<UserLanguages>?,
      invitedBy: freezed == invitedBy
          ? _value.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as UserInviteModel?,
      invitedTo: freezed == invitedTo
          ? _value.invitedTo
          : invitedTo // ignore: cast_nullable_to_non_nullable
              as List<UserInviteModel>?,
      inTheWaitlist: freezed == inTheWaitlist
          ? _value.inTheWaitlist
          : inTheWaitlist // ignore: cast_nullable_to_non_nullable
              as bool?,
      inviteCode: freezed == inviteCode
          ? _value.inviteCode
          : inviteCode // ignore: cast_nullable_to_non_nullable
              as String?,
      maxAllowedInvites: freezed == maxAllowedInvites
          ? _value.maxAllowedInvites
          : maxAllowedInvites // ignore: cast_nullable_to_non_nullable
              as int?,
      collections: freezed == collections
          ? _value.collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<UserCollection>?,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      connections: freezed == connections
          ? _value.connections
          : connections // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      blocked: freezed == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as UserBlockedUsers?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserLocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $UserLocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserBlockedUsersCopyWith<$Res>? get blocked {
    if (_value.blocked == null) {
      return null;
    }

    return $UserBlockedUsersCopyWith<$Res>(_value.blocked!, (value) {
      return _then(_value.copyWith(blocked: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? email,
      String? username,
      UserLocation? location,
      @TimestampConverter() DateTime? dateOfBirth,
      String? profilePictureUrl,
      String? profileWallpaperUrl,
      String? about,
      String? tagline,
      List<Social>? socials,
      List<String>? skills,
      Map<String, bool>? userInterestsIds,
      List<NovaInterests>? userInterests,
      Map<String, bool>? userOpportunitiesIds,
      List<NovaOpportunities>? userOpportunities,
      Map<String, bool>? experiencesIds,
      List<Experience>? experiences,
      Map<String, bool>? educationsIds,
      List<Education>? educations,
      Map<String, bool>? testScoresIds,
      List<UserTestScores>? testScores,
      Map<String, bool>? volunteeredIds,
      List<Volunteer>? volunteered,
      Map<String, bool>? aptitudeTestsIds,
      List<AptitudeTest>? aptitudeTests,
      Map<String, bool>? awardsIds,
      List<Award>? awards,
      Map<String, bool>? dreamCareersIds,
      List<UserDreamCareer>? dreamCareers,
      Map<String, bool>? dreamCollegesIds,
      List<UserDreamCollege>? dreamColleges,
      Map<String, bool>? dreamCountriesIds,
      List<UserDreamCountry>? dreamCountries,
      Map<String, bool>? languagesIds,
      List<UserLanguages>? languages,
      UserInviteModel? invitedBy,
      List<UserInviteModel>? invitedTo,
      bool? inTheWaitlist,
      String? inviteCode,
      int? maxAllowedInvites,
      List<UserCollection>? collections,
      String? fcmToken,
      Map<String, bool>? connections,
      @TimestampConverter() DateTime? createdAt,
      UserBlockedUsers? blocked});

  @override
  $UserLocationCopyWith<$Res>? get location;
  @override
  $UserBlockedUsersCopyWith<$Res>? get blocked;
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? location = freezed,
    Object? dateOfBirth = freezed,
    Object? profilePictureUrl = freezed,
    Object? profileWallpaperUrl = freezed,
    Object? about = freezed,
    Object? tagline = freezed,
    Object? socials = freezed,
    Object? skills = freezed,
    Object? userInterestsIds = freezed,
    Object? userInterests = freezed,
    Object? userOpportunitiesIds = freezed,
    Object? userOpportunities = freezed,
    Object? experiencesIds = freezed,
    Object? experiences = freezed,
    Object? educationsIds = freezed,
    Object? educations = freezed,
    Object? testScoresIds = freezed,
    Object? testScores = freezed,
    Object? volunteeredIds = freezed,
    Object? volunteered = freezed,
    Object? aptitudeTestsIds = freezed,
    Object? aptitudeTests = freezed,
    Object? awardsIds = freezed,
    Object? awards = freezed,
    Object? dreamCareersIds = freezed,
    Object? dreamCareers = freezed,
    Object? dreamCollegesIds = freezed,
    Object? dreamColleges = freezed,
    Object? dreamCountriesIds = freezed,
    Object? dreamCountries = freezed,
    Object? languagesIds = freezed,
    Object? languages = freezed,
    Object? invitedBy = freezed,
    Object? invitedTo = freezed,
    Object? inTheWaitlist = freezed,
    Object? inviteCode = freezed,
    Object? maxAllowedInvites = freezed,
    Object? collections = freezed,
    Object? fcmToken = freezed,
    Object? connections = freezed,
    Object? createdAt = freezed,
    Object? blocked = freezed,
  }) {
    return _then(_$_UserModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as UserLocation?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      profileWallpaperUrl: freezed == profileWallpaperUrl
          ? _value.profileWallpaperUrl
          : profileWallpaperUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      socials: freezed == socials
          ? _value._socials
          : socials // ignore: cast_nullable_to_non_nullable
              as List<Social>?,
      skills: freezed == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      userInterestsIds: freezed == userInterestsIds
          ? _value._userInterestsIds
          : userInterestsIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      userInterests: freezed == userInterests
          ? _value._userInterests
          : userInterests // ignore: cast_nullable_to_non_nullable
              as List<NovaInterests>?,
      userOpportunitiesIds: freezed == userOpportunitiesIds
          ? _value._userOpportunitiesIds
          : userOpportunitiesIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      userOpportunities: freezed == userOpportunities
          ? _value._userOpportunities
          : userOpportunities // ignore: cast_nullable_to_non_nullable
              as List<NovaOpportunities>?,
      experiencesIds: freezed == experiencesIds
          ? _value._experiencesIds
          : experiencesIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      experiences: freezed == experiences
          ? _value._experiences
          : experiences // ignore: cast_nullable_to_non_nullable
              as List<Experience>?,
      educationsIds: freezed == educationsIds
          ? _value._educationsIds
          : educationsIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      educations: freezed == educations
          ? _value._educations
          : educations // ignore: cast_nullable_to_non_nullable
              as List<Education>?,
      testScoresIds: freezed == testScoresIds
          ? _value._testScoresIds
          : testScoresIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      testScores: freezed == testScores
          ? _value._testScores
          : testScores // ignore: cast_nullable_to_non_nullable
              as List<UserTestScores>?,
      volunteeredIds: freezed == volunteeredIds
          ? _value._volunteeredIds
          : volunteeredIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      volunteered: freezed == volunteered
          ? _value._volunteered
          : volunteered // ignore: cast_nullable_to_non_nullable
              as List<Volunteer>?,
      aptitudeTestsIds: freezed == aptitudeTestsIds
          ? _value._aptitudeTestsIds
          : aptitudeTestsIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      aptitudeTests: freezed == aptitudeTests
          ? _value._aptitudeTests
          : aptitudeTests // ignore: cast_nullable_to_non_nullable
              as List<AptitudeTest>?,
      awardsIds: freezed == awardsIds
          ? _value._awardsIds
          : awardsIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      awards: freezed == awards
          ? _value._awards
          : awards // ignore: cast_nullable_to_non_nullable
              as List<Award>?,
      dreamCareersIds: freezed == dreamCareersIds
          ? _value._dreamCareersIds
          : dreamCareersIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      dreamCareers: freezed == dreamCareers
          ? _value._dreamCareers
          : dreamCareers // ignore: cast_nullable_to_non_nullable
              as List<UserDreamCareer>?,
      dreamCollegesIds: freezed == dreamCollegesIds
          ? _value._dreamCollegesIds
          : dreamCollegesIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      dreamColleges: freezed == dreamColleges
          ? _value._dreamColleges
          : dreamColleges // ignore: cast_nullable_to_non_nullable
              as List<UserDreamCollege>?,
      dreamCountriesIds: freezed == dreamCountriesIds
          ? _value._dreamCountriesIds
          : dreamCountriesIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      dreamCountries: freezed == dreamCountries
          ? _value._dreamCountries
          : dreamCountries // ignore: cast_nullable_to_non_nullable
              as List<UserDreamCountry>?,
      languagesIds: freezed == languagesIds
          ? _value._languagesIds
          : languagesIds // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      languages: freezed == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<UserLanguages>?,
      invitedBy: freezed == invitedBy
          ? _value.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as UserInviteModel?,
      invitedTo: freezed == invitedTo
          ? _value._invitedTo
          : invitedTo // ignore: cast_nullable_to_non_nullable
              as List<UserInviteModel>?,
      inTheWaitlist: freezed == inTheWaitlist
          ? _value.inTheWaitlist
          : inTheWaitlist // ignore: cast_nullable_to_non_nullable
              as bool?,
      inviteCode: freezed == inviteCode
          ? _value.inviteCode
          : inviteCode // ignore: cast_nullable_to_non_nullable
              as String?,
      maxAllowedInvites: freezed == maxAllowedInvites
          ? _value.maxAllowedInvites
          : maxAllowedInvites // ignore: cast_nullable_to_non_nullable
              as int?,
      collections: freezed == collections
          ? _value._collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<UserCollection>?,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      connections: freezed == connections
          ? _value._connections
          : connections // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      blocked: freezed == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as UserBlockedUsers?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.location,
      @TimestampConverter() this.dateOfBirth,
      this.profilePictureUrl,
      this.profileWallpaperUrl,
      this.about,
      this.tagline,
      final List<Social>? socials,
      final List<String>? skills,
      final Map<String, bool>? userInterestsIds,
      final List<NovaInterests>? userInterests,
      final Map<String, bool>? userOpportunitiesIds,
      final List<NovaOpportunities>? userOpportunities,
      final Map<String, bool>? experiencesIds,
      final List<Experience>? experiences,
      final Map<String, bool>? educationsIds,
      final List<Education>? educations,
      final Map<String, bool>? testScoresIds,
      final List<UserTestScores>? testScores,
      final Map<String, bool>? volunteeredIds,
      final List<Volunteer>? volunteered,
      final Map<String, bool>? aptitudeTestsIds,
      final List<AptitudeTest>? aptitudeTests,
      final Map<String, bool>? awardsIds,
      final List<Award>? awards,
      final Map<String, bool>? dreamCareersIds,
      final List<UserDreamCareer>? dreamCareers,
      final Map<String, bool>? dreamCollegesIds,
      final List<UserDreamCollege>? dreamColleges,
      final Map<String, bool>? dreamCountriesIds,
      final List<UserDreamCountry>? dreamCountries,
      final Map<String, bool>? languagesIds,
      final List<UserLanguages>? languages,
      this.invitedBy,
      final List<UserInviteModel>? invitedTo,
      this.inTheWaitlist,
      this.inviteCode,
      this.maxAllowedInvites,
      final List<UserCollection>? collections,
      this.fcmToken,
      final Map<String, bool>? connections,
      @TimestampConverter() this.createdAt,
      this.blocked})
      : _socials = socials,
        _skills = skills,
        _userInterestsIds = userInterestsIds,
        _userInterests = userInterests,
        _userOpportunitiesIds = userOpportunitiesIds,
        _userOpportunities = userOpportunities,
        _experiencesIds = experiencesIds,
        _experiences = experiences,
        _educationsIds = educationsIds,
        _educations = educations,
        _testScoresIds = testScoresIds,
        _testScores = testScores,
        _volunteeredIds = volunteeredIds,
        _volunteered = volunteered,
        _aptitudeTestsIds = aptitudeTestsIds,
        _aptitudeTests = aptitudeTests,
        _awardsIds = awardsIds,
        _awards = awards,
        _dreamCareersIds = dreamCareersIds,
        _dreamCareers = dreamCareers,
        _dreamCollegesIds = dreamCollegesIds,
        _dreamColleges = dreamColleges,
        _dreamCountriesIds = dreamCountriesIds,
        _dreamCountries = dreamCountries,
        _languagesIds = languagesIds,
        _languages = languages,
        _invitedTo = invitedTo,
        _collections = collections,
        _connections = connections;

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? username;
  @override
  final UserLocation? location;
  @override
  @TimestampConverter()
  final DateTime? dateOfBirth;
  @override
  final String? profilePictureUrl;
  @override
  final String? profileWallpaperUrl;
  @override
  final String? about;
  @override
  final String? tagline;
  final List<Social>? _socials;
  @override
  List<Social>? get socials {
    final value = _socials;
    if (value == null) return null;
    if (_socials is EqualUnmodifiableListView) return _socials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _skills;
  @override
  List<String>? get skills {
    final value = _skills;
    if (value == null) return null;
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, bool>? _userInterestsIds;
  @override
  Map<String, bool>? get userInterestsIds {
    final value = _userInterestsIds;
    if (value == null) return null;
    if (_userInterestsIds is EqualUnmodifiableMapView) return _userInterestsIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<NovaInterests>? _userInterests;
  @override
  List<NovaInterests>? get userInterests {
    final value = _userInterests;
    if (value == null) return null;
    if (_userInterests is EqualUnmodifiableListView) return _userInterests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, bool>? _userOpportunitiesIds;
  @override
  Map<String, bool>? get userOpportunitiesIds {
    final value = _userOpportunitiesIds;
    if (value == null) return null;
    if (_userOpportunitiesIds is EqualUnmodifiableMapView)
      return _userOpportunitiesIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<NovaOpportunities>? _userOpportunities;
  @override
  List<NovaOpportunities>? get userOpportunities {
    final value = _userOpportunities;
    if (value == null) return null;
    if (_userOpportunities is EqualUnmodifiableListView)
      return _userOpportunities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, bool>? _experiencesIds;
  @override
  Map<String, bool>? get experiencesIds {
    final value = _experiencesIds;
    if (value == null) return null;
    if (_experiencesIds is EqualUnmodifiableMapView) return _experiencesIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<Experience>? _experiences;
  @override
  List<Experience>? get experiences {
    final value = _experiences;
    if (value == null) return null;
    if (_experiences is EqualUnmodifiableListView) return _experiences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, bool>? _educationsIds;
  @override
  Map<String, bool>? get educationsIds {
    final value = _educationsIds;
    if (value == null) return null;
    if (_educationsIds is EqualUnmodifiableMapView) return _educationsIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<Education>? _educations;
  @override
  List<Education>? get educations {
    final value = _educations;
    if (value == null) return null;
    if (_educations is EqualUnmodifiableListView) return _educations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, bool>? _testScoresIds;
  @override
  Map<String, bool>? get testScoresIds {
    final value = _testScoresIds;
    if (value == null) return null;
    if (_testScoresIds is EqualUnmodifiableMapView) return _testScoresIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<UserTestScores>? _testScores;
  @override
  List<UserTestScores>? get testScores {
    final value = _testScores;
    if (value == null) return null;
    if (_testScores is EqualUnmodifiableListView) return _testScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, bool>? _volunteeredIds;
  @override
  Map<String, bool>? get volunteeredIds {
    final value = _volunteeredIds;
    if (value == null) return null;
    if (_volunteeredIds is EqualUnmodifiableMapView) return _volunteeredIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<Volunteer>? _volunteered;
  @override
  List<Volunteer>? get volunteered {
    final value = _volunteered;
    if (value == null) return null;
    if (_volunteered is EqualUnmodifiableListView) return _volunteered;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, bool>? _aptitudeTestsIds;
  @override
  Map<String, bool>? get aptitudeTestsIds {
    final value = _aptitudeTestsIds;
    if (value == null) return null;
    if (_aptitudeTestsIds is EqualUnmodifiableMapView) return _aptitudeTestsIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<AptitudeTest>? _aptitudeTests;
  @override
  List<AptitudeTest>? get aptitudeTests {
    final value = _aptitudeTests;
    if (value == null) return null;
    if (_aptitudeTests is EqualUnmodifiableListView) return _aptitudeTests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, bool>? _awardsIds;
  @override
  Map<String, bool>? get awardsIds {
    final value = _awardsIds;
    if (value == null) return null;
    if (_awardsIds is EqualUnmodifiableMapView) return _awardsIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<Award>? _awards;
  @override
  List<Award>? get awards {
    final value = _awards;
    if (value == null) return null;
    if (_awards is EqualUnmodifiableListView) return _awards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, bool>? _dreamCareersIds;
  @override
  Map<String, bool>? get dreamCareersIds {
    final value = _dreamCareersIds;
    if (value == null) return null;
    if (_dreamCareersIds is EqualUnmodifiableMapView) return _dreamCareersIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<UserDreamCareer>? _dreamCareers;
  @override
  List<UserDreamCareer>? get dreamCareers {
    final value = _dreamCareers;
    if (value == null) return null;
    if (_dreamCareers is EqualUnmodifiableListView) return _dreamCareers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, bool>? _dreamCollegesIds;
  @override
  Map<String, bool>? get dreamCollegesIds {
    final value = _dreamCollegesIds;
    if (value == null) return null;
    if (_dreamCollegesIds is EqualUnmodifiableMapView) return _dreamCollegesIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<UserDreamCollege>? _dreamColleges;
  @override
  List<UserDreamCollege>? get dreamColleges {
    final value = _dreamColleges;
    if (value == null) return null;
    if (_dreamColleges is EqualUnmodifiableListView) return _dreamColleges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, bool>? _dreamCountriesIds;
  @override
  Map<String, bool>? get dreamCountriesIds {
    final value = _dreamCountriesIds;
    if (value == null) return null;
    if (_dreamCountriesIds is EqualUnmodifiableMapView)
      return _dreamCountriesIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<UserDreamCountry>? _dreamCountries;
  @override
  List<UserDreamCountry>? get dreamCountries {
    final value = _dreamCountries;
    if (value == null) return null;
    if (_dreamCountries is EqualUnmodifiableListView) return _dreamCountries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, bool>? _languagesIds;
  @override
  Map<String, bool>? get languagesIds {
    final value = _languagesIds;
    if (value == null) return null;
    if (_languagesIds is EqualUnmodifiableMapView) return _languagesIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<UserLanguages>? _languages;
  @override
  List<UserLanguages>? get languages {
    final value = _languages;
    if (value == null) return null;
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UserInviteModel? invitedBy;
  final List<UserInviteModel>? _invitedTo;
  @override
  List<UserInviteModel>? get invitedTo {
    final value = _invitedTo;
    if (value == null) return null;
    if (_invitedTo is EqualUnmodifiableListView) return _invitedTo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? inTheWaitlist;
  @override
  final String? inviteCode;
  @override
  final int? maxAllowedInvites;
  final List<UserCollection>? _collections;
  @override
  List<UserCollection>? get collections {
    final value = _collections;
    if (value == null) return null;
    if (_collections is EqualUnmodifiableListView) return _collections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? fcmToken;
  final Map<String, bool>? _connections;
  @override
  Map<String, bool>? get connections {
    final value = _connections;
    if (value == null) return null;
    if (_connections is EqualUnmodifiableMapView) return _connections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

//user_ids of connected user, {id: true}
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  final UserBlockedUsers? blocked;

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, username: $username, location: $location, dateOfBirth: $dateOfBirth, profilePictureUrl: $profilePictureUrl, profileWallpaperUrl: $profileWallpaperUrl, about: $about, tagline: $tagline, socials: $socials, skills: $skills, userInterestsIds: $userInterestsIds, userInterests: $userInterests, userOpportunitiesIds: $userOpportunitiesIds, userOpportunities: $userOpportunities, experiencesIds: $experiencesIds, experiences: $experiences, educationsIds: $educationsIds, educations: $educations, testScoresIds: $testScoresIds, testScores: $testScores, volunteeredIds: $volunteeredIds, volunteered: $volunteered, aptitudeTestsIds: $aptitudeTestsIds, aptitudeTests: $aptitudeTests, awardsIds: $awardsIds, awards: $awards, dreamCareersIds: $dreamCareersIds, dreamCareers: $dreamCareers, dreamCollegesIds: $dreamCollegesIds, dreamColleges: $dreamColleges, dreamCountriesIds: $dreamCountriesIds, dreamCountries: $dreamCountries, languagesIds: $languagesIds, languages: $languages, invitedBy: $invitedBy, invitedTo: $invitedTo, inTheWaitlist: $inTheWaitlist, inviteCode: $inviteCode, maxAllowedInvites: $maxAllowedInvites, collections: $collections, fcmToken: $fcmToken, connections: $connections, createdAt: $createdAt, blocked: $blocked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.profilePictureUrl, profilePictureUrl) ||
                other.profilePictureUrl == profilePictureUrl) &&
            (identical(other.profileWallpaperUrl, profileWallpaperUrl) ||
                other.profileWallpaperUrl == profileWallpaperUrl) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.tagline, tagline) || other.tagline == tagline) &&
            const DeepCollectionEquality().equals(other._socials, _socials) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            const DeepCollectionEquality()
                .equals(other._userInterestsIds, _userInterestsIds) &&
            const DeepCollectionEquality()
                .equals(other._userInterests, _userInterests) &&
            const DeepCollectionEquality()
                .equals(other._userOpportunitiesIds, _userOpportunitiesIds) &&
            const DeepCollectionEquality()
                .equals(other._userOpportunities, _userOpportunities) &&
            const DeepCollectionEquality()
                .equals(other._experiencesIds, _experiencesIds) &&
            const DeepCollectionEquality()
                .equals(other._experiences, _experiences) &&
            const DeepCollectionEquality()
                .equals(other._educationsIds, _educationsIds) &&
            const DeepCollectionEquality()
                .equals(other._educations, _educations) &&
            const DeepCollectionEquality()
                .equals(other._testScoresIds, _testScoresIds) &&
            const DeepCollectionEquality()
                .equals(other._testScores, _testScores) &&
            const DeepCollectionEquality()
                .equals(other._volunteeredIds, _volunteeredIds) &&
            const DeepCollectionEquality()
                .equals(other._volunteered, _volunteered) &&
            const DeepCollectionEquality()
                .equals(other._aptitudeTestsIds, _aptitudeTestsIds) &&
            const DeepCollectionEquality()
                .equals(other._aptitudeTests, _aptitudeTests) &&
            const DeepCollectionEquality()
                .equals(other._awardsIds, _awardsIds) &&
            const DeepCollectionEquality().equals(other._awards, _awards) &&
            const DeepCollectionEquality()
                .equals(other._dreamCareersIds, _dreamCareersIds) &&
            const DeepCollectionEquality()
                .equals(other._dreamCareers, _dreamCareers) &&
            const DeepCollectionEquality()
                .equals(other._dreamCollegesIds, _dreamCollegesIds) &&
            const DeepCollectionEquality()
                .equals(other._dreamColleges, _dreamColleges) &&
            const DeepCollectionEquality()
                .equals(other._dreamCountriesIds, _dreamCountriesIds) &&
            const DeepCollectionEquality()
                .equals(other._dreamCountries, _dreamCountries) &&
            const DeepCollectionEquality()
                .equals(other._languagesIds, _languagesIds) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            (identical(other.invitedBy, invitedBy) ||
                other.invitedBy == invitedBy) &&
            const DeepCollectionEquality()
                .equals(other._invitedTo, _invitedTo) &&
            (identical(other.inTheWaitlist, inTheWaitlist) ||
                other.inTheWaitlist == inTheWaitlist) &&
            (identical(other.inviteCode, inviteCode) ||
                other.inviteCode == inviteCode) &&
            (identical(other.maxAllowedInvites, maxAllowedInvites) ||
                other.maxAllowedInvites == maxAllowedInvites) &&
            const DeepCollectionEquality()
                .equals(other._collections, _collections) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            const DeepCollectionEquality()
                .equals(other._connections, _connections) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.blocked, blocked) || other.blocked == blocked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        email,
        username,
        location,
        dateOfBirth,
        profilePictureUrl,
        profileWallpaperUrl,
        about,
        tagline,
        const DeepCollectionEquality().hash(_socials),
        const DeepCollectionEquality().hash(_skills),
        const DeepCollectionEquality().hash(_userInterestsIds),
        const DeepCollectionEquality().hash(_userInterests),
        const DeepCollectionEquality().hash(_userOpportunitiesIds),
        const DeepCollectionEquality().hash(_userOpportunities),
        const DeepCollectionEquality().hash(_experiencesIds),
        const DeepCollectionEquality().hash(_experiences),
        const DeepCollectionEquality().hash(_educationsIds),
        const DeepCollectionEquality().hash(_educations),
        const DeepCollectionEquality().hash(_testScoresIds),
        const DeepCollectionEquality().hash(_testScores),
        const DeepCollectionEquality().hash(_volunteeredIds),
        const DeepCollectionEquality().hash(_volunteered),
        const DeepCollectionEquality().hash(_aptitudeTestsIds),
        const DeepCollectionEquality().hash(_aptitudeTests),
        const DeepCollectionEquality().hash(_awardsIds),
        const DeepCollectionEquality().hash(_awards),
        const DeepCollectionEquality().hash(_dreamCareersIds),
        const DeepCollectionEquality().hash(_dreamCareers),
        const DeepCollectionEquality().hash(_dreamCollegesIds),
        const DeepCollectionEquality().hash(_dreamColleges),
        const DeepCollectionEquality().hash(_dreamCountriesIds),
        const DeepCollectionEquality().hash(_dreamCountries),
        const DeepCollectionEquality().hash(_languagesIds),
        const DeepCollectionEquality().hash(_languages),
        invitedBy,
        const DeepCollectionEquality().hash(_invitedTo),
        inTheWaitlist,
        inviteCode,
        maxAllowedInvites,
        const DeepCollectionEquality().hash(_collections),
        fcmToken,
        const DeepCollectionEquality().hash(_connections),
        createdAt,
        blocked
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final String? id,
      final String? name,
      final String? email,
      final String? username,
      final UserLocation? location,
      @TimestampConverter() final DateTime? dateOfBirth,
      final String? profilePictureUrl,
      final String? profileWallpaperUrl,
      final String? about,
      final String? tagline,
      final List<Social>? socials,
      final List<String>? skills,
      final Map<String, bool>? userInterestsIds,
      final List<NovaInterests>? userInterests,
      final Map<String, bool>? userOpportunitiesIds,
      final List<NovaOpportunities>? userOpportunities,
      final Map<String, bool>? experiencesIds,
      final List<Experience>? experiences,
      final Map<String, bool>? educationsIds,
      final List<Education>? educations,
      final Map<String, bool>? testScoresIds,
      final List<UserTestScores>? testScores,
      final Map<String, bool>? volunteeredIds,
      final List<Volunteer>? volunteered,
      final Map<String, bool>? aptitudeTestsIds,
      final List<AptitudeTest>? aptitudeTests,
      final Map<String, bool>? awardsIds,
      final List<Award>? awards,
      final Map<String, bool>? dreamCareersIds,
      final List<UserDreamCareer>? dreamCareers,
      final Map<String, bool>? dreamCollegesIds,
      final List<UserDreamCollege>? dreamColleges,
      final Map<String, bool>? dreamCountriesIds,
      final List<UserDreamCountry>? dreamCountries,
      final Map<String, bool>? languagesIds,
      final List<UserLanguages>? languages,
      final UserInviteModel? invitedBy,
      final List<UserInviteModel>? invitedTo,
      final bool? inTheWaitlist,
      final String? inviteCode,
      final int? maxAllowedInvites,
      final List<UserCollection>? collections,
      final String? fcmToken,
      final Map<String, bool>? connections,
      @TimestampConverter() final DateTime? createdAt,
      final UserBlockedUsers? blocked}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get username;
  @override
  UserLocation? get location;
  @override
  @TimestampConverter()
  DateTime? get dateOfBirth;
  @override
  String? get profilePictureUrl;
  @override
  String? get profileWallpaperUrl;
  @override
  String? get about;
  @override
  String? get tagline;
  @override
  List<Social>? get socials;
  @override
  List<String>? get skills;
  @override
  Map<String, bool>? get userInterestsIds;
  @override
  List<NovaInterests>? get userInterests;
  @override
  Map<String, bool>? get userOpportunitiesIds;
  @override
  List<NovaOpportunities>? get userOpportunities;
  @override
  Map<String, bool>? get experiencesIds;
  @override
  List<Experience>? get experiences;
  @override
  Map<String, bool>? get educationsIds;
  @override
  List<Education>? get educations;
  @override
  Map<String, bool>? get testScoresIds;
  @override
  List<UserTestScores>? get testScores;
  @override
  Map<String, bool>? get volunteeredIds;
  @override
  List<Volunteer>? get volunteered;
  @override
  Map<String, bool>? get aptitudeTestsIds;
  @override
  List<AptitudeTest>? get aptitudeTests;
  @override
  Map<String, bool>? get awardsIds;
  @override
  List<Award>? get awards;
  @override
  Map<String, bool>? get dreamCareersIds;
  @override
  List<UserDreamCareer>? get dreamCareers;
  @override
  Map<String, bool>? get dreamCollegesIds;
  @override
  List<UserDreamCollege>? get dreamColleges;
  @override
  Map<String, bool>? get dreamCountriesIds;
  @override
  List<UserDreamCountry>? get dreamCountries;
  @override
  Map<String, bool>? get languagesIds;
  @override
  List<UserLanguages>? get languages;
  @override
  UserInviteModel? get invitedBy;
  @override
  List<UserInviteModel>? get invitedTo;
  @override
  bool? get inTheWaitlist;
  @override
  String? get inviteCode;
  @override
  int? get maxAllowedInvites;
  @override
  List<UserCollection>? get collections;
  @override
  String? get fcmToken;
  @override
  Map<String, bool>? get connections;
  @override //user_ids of connected user, {id: true}
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  UserBlockedUsers? get blocked;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
