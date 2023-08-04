import 'package:flutter/material.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/views/web_view/web_view.dart';

class RouteArguments {
  RouteArguments._();

  static Widget misTypedArgsRoute<T>(Object args) {
    return const PageNotFoundScreen();
  }
}

class ProfileViewArgs {
  String? username;
  String? uid;
  bool? showLoading;

  ProfileViewArgs({
    this.username,
    this.uid,
    this.showLoading,
  });
}

class ExploreViewArgs {
  String? id;
  String? name;
  String? filterBy;
  bool? showLoading;
  ExploreViewArgsPageType? pageType;
  ExploreViewArgs({
    this.id,
    this.name,
    this.filterBy,
    this.showLoading,
    this.pageType,
  });
}

class InviteViewArgs {
  String? invitedByUsername;
  String? inviteCode;

  InviteViewArgs({
    this.invitedByUsername,
    this.inviteCode,
  });
}

class UserCollectionViewArgs {
  String? username;
  String? collectionId;
  UserCollection? collection;
  UserCollectionViewArgs({
    this.username,
    this.collectionId,
    this.collection,
  });
}

class ProfileAddEditExperienceMViewArgs {
  final bool isAdd;
  final Experience? editExperience;
  final int? editIndex;
  const ProfileAddEditExperienceMViewArgs({
    required this.isAdd,
    this.editIndex,
    this.editExperience,
  });
}

class ProfileAddEditEducationMViewArgs {
  final bool isAdd;
  final Education? editEducation;
  final int? editIndex;
  const ProfileAddEditEducationMViewArgs({
    required this.isAdd,
    this.editIndex,
    this.editEducation,
  });
}

class ProfileAddEditVolunteeredMViewArgs {
  final bool isAdd;
  final Volunteer? editVolunteer;
  final int? editIndex;
  const ProfileAddEditVolunteeredMViewArgs({
    required this.isAdd,
    this.editIndex,
    this.editVolunteer,
  });
}

class ProfileAddEditTestScoreMViewArgs {
  final bool isAdd;
  final UserTestScores? editTestScore;
  final int? editIndex;
  const ProfileAddEditTestScoreMViewArgs({
    required this.isAdd,
    this.editIndex,
    this.editTestScore,
  });
}

class ProfileAddEditAwardMViewArgs {
  final bool isAdd;
  final Award? editAward;
  final int? editIndex;
  const ProfileAddEditAwardMViewArgs({
    required this.isAdd,
    this.editIndex,
    this.editAward,
  });
}

class AddEditCollectionItemMViewArgs {
  final bool isAdd;
  final String collectionName;
  final UserCollectionItem? editCollectionItem;
  final int? editIndex;
  final int? collectionIndex;
  const AddEditCollectionItemMViewArgs({
    required this.isAdd,
    this.editIndex,
    required this.collectionName,
    this.editCollectionItem,
    this.collectionIndex,
  });
}

class ExploreDreamsMViewArgs {
  final ProfileAddEditDreamType? dreamType;
  final int? selectedDreamIndex;
  final ProfileMViewArgs profileArgs;
  const ExploreDreamsMViewArgs({
    this.dreamType,
    this.selectedDreamIndex,
    required this.profileArgs,
  });
}

class ExploreByTagsMViewArgs {
  final NovaInterests? selectedInterest;
  final NovaOpportunities? selectedOpportunity;
  const ExploreByTagsMViewArgs({
    this.selectedInterest,
    this.selectedOpportunity,
  });
}

class ExploreTagsViewAllMViewArgs {
  final NovaInterests? selectedInterest;
  final NovaOpportunities? selectedOpportunity;
  final String? displaySearchHead;
  final int? filterIndex;
  const ExploreTagsViewAllMViewArgs({
    this.selectedInterest,
    this.selectedOpportunity,
    this.displaySearchHead,
    this.filterIndex,
  });
}

class ExploreInterestMViewArgs {
  final NovaInterests selectedInterest;
  final ProfileMViewArgs profileArgs;
  const ExploreInterestMViewArgs({
    required this.selectedInterest,
    required this.profileArgs,
  });
}

class ExploreAvailabiltyMViewArgs {
  final NovaOpportunities selectedOpportunity;
  final ProfileMViewArgs profileArgs;
  const ExploreAvailabiltyMViewArgs({
    required this.selectedOpportunity,
    required this.profileArgs,
  });
}

class ProfileMViewArgs {
  final bool? isCurrentUser;
  final UserModel? profile;
  const ProfileMViewArgs({
    required this.isCurrentUser,
    required this.profile,
  });
}

class UserCollectionItemMViewArgs {
  final String collectionId;
  final ProfileMViewArgs profileArgs;
  const UserCollectionItemMViewArgs({
    required this.collectionId,
    required this.profileArgs,
  });
}

class ManageNetworkMViewArgs {
  final bool? isCurrentUser;
  final UserModel? profile;
  const ManageNetworkMViewArgs({
    this.isCurrentUser,
    required this.profile,
  });
}

class FeedDetailedMViewArgs {
  final String? feedId;
  const FeedDetailedMViewArgs({
    this.feedId,
  });
}

class PlaygroundFeedDetailedMViewArgs {
  final String? playgroundfeedId;
  const PlaygroundFeedDetailedMViewArgs({
    this.playgroundfeedId,
  });
}

class CreateFeedMViewArgs {
  final String? promptText;
  final String? generatedFeedUrl;

  const CreateFeedMViewArgs({
    required this.promptText,
    required this.generatedFeedUrl,
  });
}
