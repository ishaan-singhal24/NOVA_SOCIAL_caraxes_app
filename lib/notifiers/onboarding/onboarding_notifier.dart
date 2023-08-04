import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/repository/repository.dart';
import 'package:nova_social/utils/utils.dart';
part 'onboarding_notifier.g.dart';

@JsonSerializable(explicitToJson: true)
class OnboardingNotifier with ChangeNotifier {
  OnboardingNotifier();

  @JsonKey(includeFromJson: false, includeToJson: false)
  late OnboardingRepository _onboardingRepository;
  @JsonKey(includeFromJson: false, includeToJson: false)
  late ProfileNotifier _profileNotifier;

  bool? _isLogged = false;
  // bool? _hasUsername = false;
  // bool? _hasInterests = false;
  // bool? _hasOpportunities = false;
  bool? isUsernameTaken = false;

  InitEnum? get userProfileStatus {
    return _profileNotifier.userProfileStatus;
  }

  bool? get isAuth {
    return _isLogged;
  }

  bool? get hasUsername {
    return _profileNotifier.userProfile?.username != null;
  }

  bool? get hasInterests {
    return _profileNotifier.userProfile?.userInterests?.isNotEmpty ?? false;
  }

  bool? get hasOpportunities {
    return _profileNotifier.userProfile?.userOpportunities?.isNotEmpty ?? false;
  }

  bool? get hasEducation {
    return _profileNotifier.userProfile?.educations?.isNotEmpty ?? false;
  }

  bool? get inTheWaitlist {
    return _profileNotifier.userProfile?.inTheWaitlist;
  }

  static OnboardingNotifier initialize(OnboardingRepository repo) {
    late OnboardingNotifier instance;
    try {
      instance = OnboardingNotifier();
    } catch (e) {
      Logger.logError('Initialization failed AuthNotifer', e);
      instance = OnboardingNotifier();
    }
    instance._onboardingRepository = repo;
    return instance;
  }

  update(ProfileNotifier prof) {
    _profileNotifier = prof;
    notifyListeners();
  }

  Future<void> storeUsername(String newUsername) async {
    final isUsernameAvailable =
        await _onboardingRepository.isUsernameAvailable(newUsername);
    if (isUsernameAvailable.isSuccess) {
      isUsernameTaken = isUsernameAvailable.data?.not ?? false;
    }
    // if (isUsernameTaken?.not ?? false) {
    //   UserModel? userModel = _profileNotifier.userProfile;
    //   userModel = userModel?.copyWith(username: newUsername);

    //   if (userModel != null) {
    //     await _profileNotifier.saveProfile(userModel);
    //   }
    // }
    notifyListeners();
  }

  Future<bool> isWaitlistInviteCodeValid({required String code}) async {
    final isWaitlistInviteCodeValid =
        await _onboardingRepository.isWaitlistInviteCodeValid(code: code);
    if (isWaitlistInviteCodeValid.isSuccess) {
      return isWaitlistInviteCodeValid.data ?? false;
    }
    return false;
  }

  // @override
  // OnboardingNotifier fromJson(Map json) =>
  //     _$OnboardingNotifierFromJson(json as Map<String, dynamic>);

  // @override
  // Map<String, dynamic> toJson(OnboardingNotifier notifier) =>
  //     _$OnboardingNotifierToJson(notifier);
}
