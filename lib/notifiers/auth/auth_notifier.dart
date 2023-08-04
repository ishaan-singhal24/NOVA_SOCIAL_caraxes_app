import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/repository/repository.dart';
import 'package:nova_social/utils/utils.dart';
part 'auth_notifier.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthNotifier with ChangeNotifier {
  AuthNotifier();

  @JsonKey(includeFromJson: false, includeToJson: false)
  late AuthRepository _authRepo;

  InitEnum? authStatus;
  InitEnum? appleAuthStatus;

  @JsonKey(includeFromJson: false, includeToJson: false)
  User? currentUser;

  String? deleteActionResponse;

  bool? get isAuth {
    return authStatus == InitEnum.initialized;
  }

  static AuthNotifier initialize(AuthRepository repo) {
    late AuthNotifier instance;
    try {
      instance = AuthNotifier();
    } catch (e) {
      Logger.logError('Initialization failed AuthNotifer', e);
      instance = AuthNotifier();
    }
    instance._authRepo = repo;
    instance.authState();
    return instance;
  }

  void authState() async {
    _authRepo.authState().listen((user) async {
      authStatus = InitEnum.initializing;
      if (user == null) {
        authStatus = InitEnum.uninitialized;
        AppEnvironment.user = null;
        currentUser = null;
      } else {
        if (appleAuthStatus == InitEnum.initializing) {
          return;
        }
        AppEnvironment.user = user;
        authStatus = InitEnum.initialized;
        currentUser = user;
      }
      notifyListeners();
    });
  }

  Future<void> signInWithGoogle() async {
    authStatus = InitEnum.initializing;
    notifyListeners();
    final res = await _authRepo.signInWithGoogle();

    if (res.isSuccess) {
      authStatus = InitEnum.initialized;
    }
    if (res.isSuccess.not || (res.data == null || res.data?.user == null)) {
      authStatus = InitEnum.uninitialized;
    }
    notifyListeners();
  }

  Future<void> signInWithApple() async {
    appleAuthStatus = InitEnum.initializing;
    authStatus = InitEnum.initializing;
    notifyListeners();
    final res = await _authRepo.signInWithApple();

    if (res.isSuccess) {
      appleAuthStatus = InitEnum.initialized;
      authStatus = InitEnum.initialized;
    }
    if (res.isSuccess.not || (res.data == null || res.data?.user == null)) {
      authStatus = InitEnum.uninitialized;
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    await _authRepo.signOut();
  }

  Future<void> deleteAccount() async {
    final value = await _authRepo.deleteAccount();
    if (value.isSuccess.not) {
      deleteActionResponse = value.message;
    }
    print('Delete Response: $deleteActionResponse');
    notifyListeners();
  }

  // @override
  // AuthNotifier fromJson(Map json) =>
  //     _$AuthNotifierFromJson(json as Map<String, dynamic>);

  // @override
  // Map<String, dynamic> toJson(AuthNotifier notifier) =>
  //     _$AuthNotifierToJson(notifier);
}
