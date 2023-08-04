import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/internship/categories/internship_category_model.dart';
import 'package:nova_social/data/models/internship/internship_model.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/repository/internship/internship_repository.dart';
import 'package:nova_social/utils/utils.dart';

class InternshipNotifier with ChangeNotifier {
  late InternshipRepository _internshipRepository;

  InternshipCategoryModel? currentCategoryModel;

  List<InternshipCategoryModel>? internshipCategoriesList = [];
  List<InternshipModel>? currentCategoryInternshipsList = [];
  InitEnum? fetchInternshipStatus;
  InitEnum? fetchInternshipCategoryStatus;

  // late ProfileNotifier _profileNotifier;

  static InternshipNotifier initialize(InternshipRepository repo) {
    late InternshipNotifier instance;
    try {
      instance = InternshipNotifier();
    } catch (e) {
      Logger.logError('Initialization failed PlaygroundNotifier', e);
      instance = InternshipNotifier();
    }
    instance._internshipRepository = repo;
    return instance;
  }

  // update(ProfileNotifier prof) {
  //   _profileNotifier = prof;
  //   notifyListeners();
  // }

  bool isInterestedInInternship({
    required InternshipModel? internshipModel,
    required UserModel? userModel,
  }) {
    if (internshipModel?.id?.isEmpty ?? true) {
      return false;
    }
    final UserMinimum? user = internshipModel?.interestedUsers?.singleWhere(
      (element) => element.id == userModel?.id,
      orElse: () => const UserMinimum(),
    );
    if (user != null && (user.id?.isNotEmpty ?? false)) {
      return true;
    }
    return false;
  }

  Future<void> addInterestedUserToInternship({
    required InternshipModel? internshipModel,
    required UserModel? userModel,
  }) async {
    if (internshipModel == null) {
      return;
    }
    bool userAlreadyInterested = isInterestedInInternship(
      internshipModel: internshipModel,
      userModel: userModel,
    );
    if (userAlreadyInterested) {
      return;
    }
    final userMinimum = UserMinimum.getUserMinimum(userModel);
    List<UserMinimum>? interestedUsersList = internshipModel.interestedUsers;

    interestedUsersList ??= [];
    interestedUsersList.add(userMinimum);

    internshipModel = internshipModel.copyWith(
      interestedUsers: interestedUsersList,
    );
    await _internshipRepository.updateInternship(
      internshipModel: internshipModel,
    );
  }

  Future<void> fetchInternships({required String categoryId}) async {
    fetchInternshipStatus = InitEnum.initializing;
    final res = await _internshipRepository.fetchInternshipsByCategory(
        categoryId: categoryId);
    if (res.isSuccess) {
      currentCategoryInternshipsList = res.data;
      fetchInternshipStatus = InitEnum.initialized;
    } else {
      fetchInternshipStatus = InitEnum.uninitialized;
    }
    notifyListeners();
  }

  Future<void> fetchInternshipCategories() async {
    fetchInternshipCategoryStatus = InitEnum.initializing;
    final res = await _internshipRepository.fetchInternshipCategories();
    if (res.isSuccess) {
      internshipCategoriesList = res.data;
      fetchInternshipCategoryStatus = InitEnum.initialized;
    } else {
      fetchInternshipCategoryStatus = InitEnum.uninitialized;
    }
    notifyListeners();
  }

  int interestedUsersCount({required InternshipModel internshipModel}) {
    List<UserMinimum>? interestedUsersList = internshipModel.interestedUsers;
    if (interestedUsersList?.isEmpty ?? true) {
      return 0;
    }
    int length = interestedUsersList?.length ?? 0;
    return length;
  }
}
