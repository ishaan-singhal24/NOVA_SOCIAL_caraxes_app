import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/user/blocked/user_blocked_users.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? id,
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
    Map<String, bool>? connections, //user_ids of connected user, {id: true}
    @TimestampConverter() DateTime? createdAt,
    UserBlockedUsers? blocked,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

// @CopyWith(copyWithNull: true)
// @JsonSerializable(anyMap: true, explicitToJson: true)
// class UserModel {
//   String? id;
//   String? name;
//   String? email;
//   String? username;
//   @TimestampConverter()
//   DateTime? dateOfBirth;
//   String? profilePictureUrl;
//   String? about;
//   String? tagline;
//   List<Social>? socials;
//   List<String>? skills;
//   Map<String, bool>? userInterestsIds;
//   List<NovaInterests>? userInterests;
//   Map<String, bool>? userOpportunitiesIds;
//   List<NovaOpportunities>? userOpportunities;
//   Map<String, bool>? experiencesIds;
//   List<Experience>? experiences;
//   Map<String, bool>? educationsIds;
//   List<Education>? educations;
//   Map<String, bool>? testScoresIds;
//   List<UserTestScores>? testScores;
//   Map<String, bool>? volunteeredIds;
//   List<Volunteer>? volunteered;
//   Map<String, bool>? aptitudeTestsIds;
//   List<AptitudeTest>? aptitudeTests;
//   Map<String, bool>? awardsIds;
//   List<Award>? awards;
//   Map<String, bool>? dreamCareersIds;
//   List<UserDreamCareer>? dreamCareers;
//   Map<String, bool>? dreamCollegesIds;
//   List<UserDreamCollege>? dreamColleges;
//   Map<String, bool>? dreamCountriesIds;
//   List<UserDreamCountries>? dreamCountries;
//   Map<String, bool>? languagesIds;
//   List<UserLanguages>? languages;
//   UserInviteModel? invitedBy;
//   List<UserInviteModel>? invitedTo;
//   bool? inTheWaitlist;

//   // UserModel.clone(UserModel obj) : this(
//   //   id: obj.id,
//   //   name: obj.name,
//   //   email: obj.email,
//   //   username: obj.username,
//   //   dateOfBirth: obj.,
//   //   profilePictureUrl: obj.,
//   //   tagline: obj.,
//   //   about: obj.,
//   //   skills: obj.,
//   //   socials: obj.,
//   //   experiences: obj.,
//   //   educations: obj.,
//   //   userInterests: obj.,
//   //   userOpportunities: obj.,
//   //   testScores: obj.,
//   //   inTheWaitlist: obj.,
//   //   volunteered: obj.,
//   //   aptitudeTests: obj.,
//   //   awards: obj.,
//   //   dreamCareers: obj.,
//   //   dreamColleges: obj.,
//   //   dreamCountries: obj.,
//   //   languages: obj.,
//   //   invitedBy: obj.,
//   //   invitedTo: obj.,
//   //   userInterestsIds: obj.,
//   //   userOpportunitiesIds: obj.,
//   //   aptitudeTestsIds: obj.,
//   //   awardsIds: obj.,
//   //   dreamCareersIds: obj.,
//   //   dreamCollegesIds: obj.,
//   //   dreamCountriesIds: obj.,
//   //   educationsIds: obj.,
//   //   experiencesIds: obj.,
//   //   languagesIds: obj.,
//   //   testScoresIds: obj.,
//   //   volunteeredIds: obj.,
//   // );

//   UserModel({
//     this.id,
//     this.name,
//     this.email,
//     this.username,
//     this.dateOfBirth,
//     this.profilePictureUrl,
//     this.tagline,
//     this.about,
//     this.skills,
//     this.socials,
//     this.experiences,
//     this.educations,
//     this.userInterests,
//     this.userOpportunities,
//     this.testScores,
//     this.inTheWaitlist,
//     this.volunteered,
//     this.aptitudeTests,
//     this.awards,
//     this.dreamCareers,
//     this.dreamColleges,
//     this.dreamCountries,
//     this.languages,
//     this.invitedBy,
//     this.invitedTo,
//     this.userInterestsIds,
//     this.userOpportunitiesIds,
//     this.aptitudeTestsIds,
//     this.awardsIds,
//     this.dreamCareersIds,
//     this.dreamCollegesIds,
//     this.dreamCountriesIds,
//     this.educationsIds,
//     this.experiencesIds,
//     this.languagesIds,
//     this.testScoresIds,
//     this.volunteeredIds,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) =>
//       _$UserModelFromJson(json);

//   Map<String, dynamic> toJson() => _$UserModelToJson(this);
// }

final userListModelJson = {
  {
    'userId': '1234',
    'userName': 'Bernard Hofstader',
    'userImage': 'https://randomuser.me/api/portraits/men/75.jpg',
  },
  {
    'userId': '12345',
    'userName': 'Lenard Hofstader',
    'userImage': 'https://randomuser.me/api/portraits/men/76.jpg',
  },
  {
    'userId': '123456',
    'userName': 'bfesdf Hofstader',
    'userImage': 'https://randomuser.me/api/portraits/men/77.jpg',
  },
  {
    'userId': '124534',
    'userName': 'Daisy Hofstader',
    'userImage': 'https://randomuser.me/api/portraits/men/78.jpg',
  },
  {
    'userId': '1234',
    'userName': 'Bernard Hofstader',
    'userImage': 'https://randomuser.me/api/portraits/men/75.jpg',
  },
  {
    'userId': '12345',
    'userName': 'Lenard Hofstader',
    'userImage': 'https://randomuser.me/api/portraits/men/76.jpg',
  },
  {
    'userId': '123456',
    'userName': 'bfesdf Hofstader',
    'userImage': 'https://randomuser.me/api/portraits/men/77.jpg',
  },
  {
    'userId': '124534',
    'userName': 'Daisy Hofstader',
    'userImage': 'https://randomuser.me/api/portraits/men/78.jpg',
  },
};
