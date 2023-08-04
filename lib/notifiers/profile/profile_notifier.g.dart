// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_notifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileNotifier _$ProfileNotifierFromJson(Map json) => ProfileNotifier()
  ..authStatus = $enumDecodeNullable(_$InitEnumEnumMap, json['authStatus'])
  ..userProfileStatus =
      $enumDecodeNullable(_$InitEnumEnumMap, json['userProfileStatus'])
  ..userProfile = json['userProfile'] == null
      ? null
      : UserModel.fromJson(
          Map<String, dynamic>.from(json['userProfile'] as Map))
  ..invitedByUserProfile = json['invitedByUserProfile'] == null
      ? null
      : UserModel.fromJson(
          Map<String, dynamic>.from(json['invitedByUserProfile'] as Map))
  ..invitedByUserInviteModel = json['invitedByUserInviteModel'] == null
      ? null
      : UserInviteModel.fromJson(
          Map<String, dynamic>.from(json['invitedByUserInviteModel'] as Map))
  ..invitedByUserProfileStatus =
      $enumDecodeNullable(_$InitEnumEnumMap, json['invitedByUserProfileStatus'])
  ..waitlistCounter = json['waitlistCounter'] as int?
  ..callFromFinalOnboarding = json['callFromFinalOnboarding'] as bool?
  ..callFromUsername = json['callFromUsername'] as bool?
  ..isCurrentUser = json['isCurrentUser'] as bool?
  ..globalInterests = (json['globalInterests'] as List<dynamic>?)
      ?.map((e) => NovaInterests.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..globalOpportunities = (json['globalOpportunities'] as List<dynamic>?)
      ?.map((e) =>
          NovaOpportunities.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..globalCountries = (json['globalCountries'] as List<dynamic>?)
      ?.map(
          (e) => UserDreamCountry.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..globalCareers = (json['globalCareers'] as List<dynamic>?)
      ?.map(
          (e) => UserDreamCareer.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..globalColleges = (json['globalColleges'] as List<dynamic>?)
      ?.map(
          (e) => UserDreamCollege.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..globalCities = (json['globalCities'] as List<dynamic>?)
      ?.map((e) => UserLocation.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..globalSchools = (json['globalSchools'] as List<dynamic>?)
      ?.map((e) => SchoolModel.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..recommendedProfiles = (json['recommendedProfiles'] as Map?)?.map(
    (k, e) => MapEntry(
        k as String,
        (e as List<dynamic>?)
            ?.map(
                (e) => UserModel.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList()),
  )
  ..filterProfiles = (json['filterProfiles'] as List<dynamic>?)
      ?.map((e) => UserModel.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..filterProfiles2 = (json['filterProfiles2'] as List<dynamic>?)
      ?.map((e) => UserModel.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..filterProfiles3 = (json['filterProfiles3'] as List<dynamic>?)
      ?.map((e) => UserModel.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..allConnections = (json['allConnections'] as List<dynamic>?)
      ?.map(
          (e) => ConnectionModel.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..connections = (json['connections'] as List<dynamic>?)
      ?.map((e) => UserModel.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList()
  ..isUserConnection = json['isUserConnection'] == null
      ? null
      : ConnectionModel.fromJson(
          Map<String, dynamic>.from(json['isUserConnection'] as Map))
  ..isUserConnectionStreamInitialized =
      json['isUserConnectionStreamInitialized'] as bool?;

Map<String, dynamic> _$ProfileNotifierToJson(ProfileNotifier instance) =>
    <String, dynamic>{
      'authStatus': _$InitEnumEnumMap[instance.authStatus],
      'userProfileStatus': _$InitEnumEnumMap[instance.userProfileStatus],
      'userProfile': instance.userProfile?.toJson(),
      'invitedByUserProfile': instance.invitedByUserProfile?.toJson(),
      'invitedByUserInviteModel': instance.invitedByUserInviteModel?.toJson(),
      'invitedByUserProfileStatus':
          _$InitEnumEnumMap[instance.invitedByUserProfileStatus],
      'waitlistCounter': instance.waitlistCounter,
      'callFromFinalOnboarding': instance.callFromFinalOnboarding,
      'callFromUsername': instance.callFromUsername,
      'isCurrentUser': instance.isCurrentUser,
      'globalInterests':
          instance.globalInterests?.map((e) => e.toJson()).toList(),
      'globalOpportunities':
          instance.globalOpportunities?.map((e) => e.toJson()).toList(),
      'globalCountries':
          instance.globalCountries?.map((e) => e.toJson()).toList(),
      'globalCareers': instance.globalCareers?.map((e) => e.toJson()).toList(),
      'globalColleges':
          instance.globalColleges?.map((e) => e.toJson()).toList(),
      'globalCities': instance.globalCities?.map((e) => e.toJson()).toList(),
      'globalSchools': instance.globalSchools?.map((e) => e.toJson()).toList(),
      'recommendedProfiles': instance.recommendedProfiles
          ?.map((k, e) => MapEntry(k, e?.map((e) => e.toJson()).toList())),
      'filterProfiles':
          instance.filterProfiles?.map((e) => e.toJson()).toList(),
      'filterProfiles2':
          instance.filterProfiles2?.map((e) => e.toJson()).toList(),
      'filterProfiles3':
          instance.filterProfiles3?.map((e) => e.toJson()).toList(),
      'allConnections':
          instance.allConnections?.map((e) => e.toJson()).toList(),
      'connections': instance.connections?.map((e) => e.toJson()).toList(),
      'isUserConnection': instance.isUserConnection?.toJson(),
      'isUserConnectionStreamInitialized':
          instance.isUserConnectionStreamInitialized,
    };

const _$InitEnumEnumMap = {
  InitEnum.uninitialized: 'uninitialized',
  InitEnum.initializing: 'initializing',
  InitEnum.initialized: 'initialized',
};
