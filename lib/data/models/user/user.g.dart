// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map json) => _$_UserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      location: json['location'] == null
          ? null
          : UserLocation.fromJson(
              Map<String, dynamic>.from(json['location'] as Map)),
      dateOfBirth: const TimestampConverter()
          .fromJson(json['dateOfBirth'] as Timestamp?),
      profilePictureUrl: json['profilePictureUrl'] as String?,
      profileWallpaperUrl: json['profileWallpaperUrl'] as String?,
      about: json['about'] as String?,
      tagline: json['tagline'] as String?,
      socials: (json['socials'] as List<dynamic>?)
          ?.map((e) => Social.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      skills:
          (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
      userInterestsIds: (json['userInterestsIds'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as bool),
      ),
      userInterests: (json['userInterests'] as List<dynamic>?)
          ?.map((e) =>
              NovaInterests.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      userOpportunitiesIds: (json['userOpportunitiesIds'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as bool),
      ),
      userOpportunities: (json['userOpportunities'] as List<dynamic>?)
          ?.map((e) =>
              NovaOpportunities.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      experiencesIds: (json['experiencesIds'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as bool),
      ),
      experiences: (json['experiences'] as List<dynamic>?)
          ?.map((e) => Experience.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      educationsIds: (json['educationsIds'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as bool),
      ),
      educations: (json['educations'] as List<dynamic>?)
          ?.map((e) => Education.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      testScoresIds: (json['testScoresIds'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as bool),
      ),
      testScores: (json['testScores'] as List<dynamic>?)
          ?.map((e) =>
              UserTestScores.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      volunteeredIds: (json['volunteeredIds'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as bool),
      ),
      volunteered: (json['volunteered'] as List<dynamic>?)
          ?.map((e) => Volunteer.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      aptitudeTestsIds: (json['aptitudeTestsIds'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as bool),
      ),
      aptitudeTests: (json['aptitudeTests'] as List<dynamic>?)
          ?.map(
              (e) => AptitudeTest.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      awardsIds: (json['awardsIds'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as bool),
      ),
      awards: (json['awards'] as List<dynamic>?)
          ?.map((e) => Award.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      dreamCareersIds: (json['dreamCareersIds'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as bool),
      ),
      dreamCareers: (json['dreamCareers'] as List<dynamic>?)
          ?.map((e) =>
              UserDreamCareer.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      dreamCollegesIds: (json['dreamCollegesIds'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as bool),
      ),
      dreamColleges: (json['dreamColleges'] as List<dynamic>?)
          ?.map((e) =>
              UserDreamCollege.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      dreamCountriesIds: (json['dreamCountriesIds'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as bool),
      ),
      dreamCountries: (json['dreamCountries'] as List<dynamic>?)
          ?.map((e) =>
              UserDreamCountry.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      languagesIds: (json['languagesIds'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as bool),
      ),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) =>
              UserLanguages.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      invitedBy: json['invitedBy'] == null
          ? null
          : UserInviteModel.fromJson(
              Map<String, dynamic>.from(json['invitedBy'] as Map)),
      invitedTo: (json['invitedTo'] as List<dynamic>?)
          ?.map((e) =>
              UserInviteModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      inTheWaitlist: json['inTheWaitlist'] as bool?,
      inviteCode: json['inviteCode'] as String?,
      maxAllowedInvites: json['maxAllowedInvites'] as int?,
      collections: (json['collections'] as List<dynamic>?)
          ?.map((e) =>
              UserCollection.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      fcmToken: json['fcmToken'] as String?,
      connections: (json['connections'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as bool),
      ),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      blocked: json['blocked'] == null
          ? null
          : UserBlockedUsers.fromJson(
              Map<String, dynamic>.from(json['blocked'] as Map)),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'username': instance.username,
      'location': instance.location?.toJson(),
      'dateOfBirth': const TimestampConverter().toJson(instance.dateOfBirth),
      'profilePictureUrl': instance.profilePictureUrl,
      'profileWallpaperUrl': instance.profileWallpaperUrl,
      'about': instance.about,
      'tagline': instance.tagline,
      'socials': instance.socials?.map((e) => e.toJson()).toList(),
      'skills': instance.skills,
      'userInterestsIds': instance.userInterestsIds,
      'userInterests': instance.userInterests?.map((e) => e.toJson()).toList(),
      'userOpportunitiesIds': instance.userOpportunitiesIds,
      'userOpportunities':
          instance.userOpportunities?.map((e) => e.toJson()).toList(),
      'experiencesIds': instance.experiencesIds,
      'experiences': instance.experiences?.map((e) => e.toJson()).toList(),
      'educationsIds': instance.educationsIds,
      'educations': instance.educations?.map((e) => e.toJson()).toList(),
      'testScoresIds': instance.testScoresIds,
      'testScores': instance.testScores?.map((e) => e.toJson()).toList(),
      'volunteeredIds': instance.volunteeredIds,
      'volunteered': instance.volunteered?.map((e) => e.toJson()).toList(),
      'aptitudeTestsIds': instance.aptitudeTestsIds,
      'aptitudeTests': instance.aptitudeTests?.map((e) => e.toJson()).toList(),
      'awardsIds': instance.awardsIds,
      'awards': instance.awards?.map((e) => e.toJson()).toList(),
      'dreamCareersIds': instance.dreamCareersIds,
      'dreamCareers': instance.dreamCareers?.map((e) => e.toJson()).toList(),
      'dreamCollegesIds': instance.dreamCollegesIds,
      'dreamColleges': instance.dreamColleges?.map((e) => e.toJson()).toList(),
      'dreamCountriesIds': instance.dreamCountriesIds,
      'dreamCountries':
          instance.dreamCountries?.map((e) => e.toJson()).toList(),
      'languagesIds': instance.languagesIds,
      'languages': instance.languages?.map((e) => e.toJson()).toList(),
      'invitedBy': instance.invitedBy?.toJson(),
      'invitedTo': instance.invitedTo?.map((e) => e.toJson()).toList(),
      'inTheWaitlist': instance.inTheWaitlist,
      'inviteCode': instance.inviteCode,
      'maxAllowedInvites': instance.maxAllowedInvites,
      'collections': instance.collections?.map((e) => e.toJson()).toList(),
      'fcmToken': instance.fcmToken,
      'connections': instance.connections,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'blocked': instance.blocked?.toJson(),
    };
