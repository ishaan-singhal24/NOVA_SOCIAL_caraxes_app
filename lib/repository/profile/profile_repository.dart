import 'dart:math';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:nova_social/data/constants/app_key_names.dart';
import 'package:nova_social/data/constants/app_strings.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/nova/school/school_model.dart';
import 'package:nova_social/utils/utils.dart';

class ProfileRepository {
  final firestore = FirebaseFirestore.instance;
  final functions = FirebaseFunctions.instance;

  Future<Responser<UserModel?>> storeImageToFirebase(
      Uint8List imagePath, UserModel userProfile) async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child(AppKeyNames.userImageBucket)
          .child(userProfile.id!);
      var imageUrl = '';
      await ref.putData(imagePath).whenComplete(() async {
        imageUrl = await ref.getDownloadURL();
      });
      userProfile = userProfile.copyWith(profilePictureUrl: imageUrl);
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: userProfile,
      );
    } catch (e) {
      return ErrorHandler.error<UserModel>(e);
    }
  }

  Future<Responser<UserModel?>> saveProfile(UserModel profile) async {
    try {
      await firestore
          .collection(AppKeyNames.user)
          .doc(profile.id)
          .set(profile.toJson());
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: profile,
      );
    } catch (e) {
      return ErrorHandler.error<UserModel>(e);
    }
  }

  Future<Responser<UserModel?>> updateInvitedToOtherProfile(
      UserModel profile) async {
    try {
      await firestore.collection(AppKeyNames.user).doc(profile.id).update({
        AppKeyNames.invitedToField:
            profile.invitedTo?.map((e) => e.toJson()).toList(),
      });

      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: profile,
      );
    } catch (e) {
      return ErrorHandler.error<UserModel>(e);
    }
  }

  Future<Responser<UserModel?>> fetchProfile(User user) async {
    try {
      // await storeDummyUser();
      final query = await firestore
          .collection(AppKeyNames.user)
          .where(AppKeyNames.id, isEqualTo: user.uid)
          .get();
      if (query.docs.isEmpty) {
        //failed to find user document
        return Responser(message: AppStrings.failure, isSuccess: false);
      }
      final userModel = UserModel.fromJson(query.docs.first.data());
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: userModel,
      );
    } catch (e) {
      return ErrorHandler.error<UserModel>(e);
    }
  }

  Future<Responser<UserModel?>> fetchProfileByUsername(String username) async {
    try {
      final query = await firestore
          .collection(AppKeyNames.user)
          .where(AppKeyNames.usernameField, isEqualTo: username)
          .get();
      if (query.docs.isEmpty) {
        //failed to find user document
        return Responser(message: AppStrings.failure, isSuccess: false);
      }
      final userModel = UserModel.fromJson(query.docs.first.data());
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: userModel,
      );
    } catch (e) {
      return ErrorHandler.error<UserModel>(e);
    }
  }

  int _generateRandom3Digit() {
    var rng = Random();
    var rand = rng.nextInt(900) + 100;
    return rand.toInt();
  }

  String _generateRandomString(int len) {
    var random = Random.secure();
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return List.generate(len, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  //Stores new signed in user into database
  Future<Responser<UserModel?>> createProfile(
    User user, {
    UserInviteModel? invitedBy,
    UserModel? invitedByUserProfile,
  }) async {
    try {
      final String randomCode = user.uid[0] +
          user.uid[1] +
          _generateRandom3Digit().toString() +
          user.uid[2];
      final fcmToken = await AppEnvironment.firebaseMessaging.getToken();
      final String randomUsername = _generateRandomString(3) + randomCode;
      final UserModel currentUserModel = UserModel(
        id: user.uid,
        name: user.displayName,
        profilePictureUrl: user.photoURL,
        email: user.email,
        invitedBy: invitedBy,
        inviteCode: randomCode,
        createdAt: DateTime.now(),
        fcmToken: fcmToken,
        username: randomUsername,
      );

      if (invitedBy != null && invitedByUserProfile != null) {
        UserInviteModel userInviteModel = UserInviteModel(
          inviteCode: invitedByUserProfile.inviteCode,
          name: currentUserModel.name,
          userId: currentUserModel.id,
          userProfileImageUrl: currentUserModel.profilePictureUrl,
          username: currentUserModel.username,
        );
        List<UserInviteModel>? invitedToList =
            invitedByUserProfile.invitedTo?.toList() ?? [];

        final checkInvitedUser = invitedToList.firstWhere(
          (element) => element.username == userInviteModel.username,
          orElse: () => UserInviteModel(),
        );
        if (checkInvitedUser.username == null) {
          invitedToList.add(userInviteModel);
          invitedByUserProfile = invitedByUserProfile.copyWith(
            invitedTo: invitedToList,
          );
          await updateInvitedToOtherProfile(invitedByUserProfile);
        }

        // if (invitedByUserProfile.invitedTo?.isEmpty ?? true) {
        //   invitedByUserProfile.invitedTo = [];
        //   invitedByUserProfile.invitedTo!.add(userInviteModel);
        // } else {
        //   invitedByUserProfile.invitedTo!.add(userInviteModel);
        // }
      }

      await firestore
          .collection(AppKeyNames.user)
          .doc(user.uid)
          .set(currentUserModel.toJson());
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: currentUserModel,
      );
    } catch (e) {
      return ErrorHandler.error<UserModel>(e);
    }
  }

  Future<Responser<int?>> countUsersInWaitlist() async {
    try {
      final query = firestore
          .collection(AppKeyNames.user)
          .where(AppKeyNames.inTheWaitlistField, isEqualTo: true);
      final length = await query.count().get();
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: length.count,
      );
    } catch (e) {
      return ErrorHandler.error<int>(e);
    }
  }

  Future<Responser<Map<String, List<UserModel>?>>>
      fetchRecommendedUsersbyFilters({
    List<String>? school,
    List<String>? interest1,
    List<String>? interest2,
    List<String>? interest3,
    List<String>? interest4,
    List<String>? interest5,
  }) async {
    try {
      List<UserModel>? allProfiles = [];
      final List<List<String>?> interestFilters = [
        interest1,
        interest2,
        interest3,
        interest4,
        interest5
      ];
      final Map<String, List<UserModel>?> profilesByFilter = {};

      for (var element in interestFilters) {
        if (element?.isEmpty ?? true) {
          break;
        }
        final QuerySnapshot snapshot = await FirebaseFirestore.instance
            .collection(AppKeyNames.user)
            .where('${AppKeyNames.userInterestsIds}.${element?[0]}',
                isEqualTo: true)
            .limit(4)
            .get();

        final List<UserModel> profiles = [];
        for (final QueryDocumentSnapshot doc in snapshot.docs) {
          if (!allProfiles.any((profile) => profile.id == doc.id)) {
            final UserModel profile =
                UserModel.fromJson(doc.data() as Map<String, dynamic>);
            profiles.add(profile);
          }
        }

        profilesByFilter[element?[1] ?? ''] = profiles;
      }

      if (school?.isNotEmpty ?? false) {
        final QuerySnapshot schoolIdSnapshot = await FirebaseFirestore.instance
            .collection(AppKeyNames.user)
            .where('${AppKeyNames.userEducationIds}.${school?[0]}',
                isEqualTo: true)
            .limit(5)
            .get();
        final List<UserModel> profiles = [];

        for (final QueryDocumentSnapshot doc in schoolIdSnapshot.docs) {
          if (!allProfiles.any((profile) => profile.id == doc.id)) {
            final UserModel profile =
                UserModel.fromJson(doc.data() as Map<String, dynamic>);
            profiles.add(profile);
          }
        }
        profilesByFilter['school'] = profiles;
      }

      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: profilesByFilter,
      );
    } catch (e) {
      return ErrorHandler.error<Map<String, List<UserModel>?>>(e);
    }
  }

  Future<Responser<List<QueryDocumentSnapshot>?>> fetchUserByFilter(
    String id,
    String filter, {
    String? id2,
    String? filter2,
    DocumentSnapshot? documentSnapshot,
  }) async {
    try {
      var query;
      if ((filter2?.isNotEmpty ?? false) && (id2?.isNotEmpty ?? false)) {
        query = firestore
            .collection(AppKeyNames.user)
            .where(
              '$filter.$id',
              isEqualTo: true,
            )
            .where(
              '$filter2.$id2',
              isEqualTo: true,
            );
      } else {
        query = firestore.collection(AppKeyNames.user).where(
              '$filter.$id',
              isEqualTo: true,
            );
      }

      if (documentSnapshot != null) {
        query = query.startAfterDocument(documentSnapshot);
      }
      final snapshot = await query.limit(20).get();
      if (snapshot.docs.isEmpty) {
        return Responser(
          message: AppStrings.failure,
          isSuccess: false,
        );
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: snapshot.docs,
      );
    } catch (e) {
      return ErrorHandler.error<List<QueryDocumentSnapshot>?>(e);
    }
  }

  Future<Responser<CloudinaryUploadResponse?>> uploadToCloudinary(
    CloudinaryUploadRequest request,
  ) async {
    try {
      final funcRef =
          functions.httpsCallable(AppKeyNames.funcUploadToCloudinary);
      final response = await funcRef.call(request.toJson());
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: CloudinaryUploadResponse.fromJson(response.data),
      );
    } on FirebaseFunctionsException catch (e) {
      return ErrorHandler.error(e);
    } catch (e) {
      return ErrorHandler.error(e);
    }
  }

  Future<Responser<UserModel?>> fetchUserById(
    String? userId,
  ) async {
    try {
      final doc =
          await firestore.collection(AppKeyNames.user).doc(userId).get();
      if (doc.exists.not) {
        return Responser(
          message: AppStrings.failure,
          isSuccess: false,
        );
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: UserModel.fromJson(doc.data() as Map<String, dynamic>),
      );
    } catch (e) {
      return ErrorHandler.error(e);
    }
  }

  Future<Responser<List<UserModel>?>> fetchConnectedUsersByIds(
    List<String>? connectedUserIds,
  ) async {
    try {
      List<UserModel>? data = [];
      for (var i = 0; i < (connectedUserIds?.length ?? 0); i++) {
        final doc = await firestore
            .collection(AppKeyNames.user)
            .doc(connectedUserIds?[i])
            .get();
        if (doc.exists) {
          data.add(
            UserModel.fromJson(doc.data() as Map<String, dynamic>),
          );
        }
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: data,
      );
    } catch (e) {
      return ErrorHandler.error(e);
    }
  }

  Stream<UserModel?> listenUserProfile(String userId) {
    return firestore
        .collection(AppKeyNames.feeds)
        .doc(userId)
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists.not) {
        return null;
      }
      return UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
    });
  }
}
