import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/repository/repository.dart';
import 'package:nova_social/utils/utils.dart';
part 'profile_notifier.g.dart';

@JsonSerializable(explicitToJson: true)
class ProfileNotifier with ChangeNotifier {
  ProfileNotifier();

  @JsonKey(includeFromJson: false, includeToJson: false)
  late ProfileRepository _profileRepo;
  @JsonKey(includeFromJson: false, includeToJson: false)
  late GlobalRepository _globalRepo;
  @JsonKey(includeFromJson: false, includeToJson: false)
  late ConfigRepository _configRepo;
  @JsonKey(includeFromJson: false, includeToJson: false)
  late NotificationRepository _notificationRepo;
  @JsonKey(includeFromJson: false, includeToJson: false)
  late ConnectionRepository _connectionRepo;
  @JsonKey(includeFromJson: false, includeToJson: false)
  late AuthNotifier _authNotifier;

  InitEnum? authStatus;

  @JsonKey(includeFromJson: false, includeToJson: false)
  User? user;
  InitEnum? userProfileStatus;

  StreamSubscription? _userProfileStream;
  UserModel? userProfile;
  @JsonKey(includeFromJson: false, includeToJson: false)
  UserModel? otherUserProfile;
  @JsonKey(includeFromJson: false, includeToJson: false)
  InitEnum? otherUserProfileStatus;

  UserModel? invitedByUserProfile;
  UserInviteModel? invitedByUserInviteModel;
  InitEnum? invitedByUserProfileStatus;

  int? waitlistCounter;

  bool? callFromFinalOnboarding = false;
  bool? callFromUsername = false;

  bool? get isCurrentUser => _isCurrentUser;
  bool? _isCurrentUser = true;
  set isCurrentUser(v) {
    _isCurrentUser = v;
  }

  List<NovaInterests>? globalInterests;
  List<NovaOpportunities>? globalOpportunities;
  List<UserDreamCountry>? globalCountries;
  List<UserDreamCareer>? globalCareers;
  List<UserDreamCollege>? globalColleges;
  List<UserLocation>? globalCities;
  List<SchoolModel>? globalSchools;

  Map<String, List<UserModel>?>? recommendedProfiles;

  List<UserModel>? filterProfiles;
  List<UserModel>? filterProfiles2;
  List<UserModel>? filterProfiles3;

  // @JsonKey(ignore: true)
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<QueryDocumentSnapshot>? filterProfileDocSnapshots;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<QueryDocumentSnapshot>? filterProfileDocSnapshots2;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<QueryDocumentSnapshot>? filterProfileDocSnapshots3;

  List<ConnectionModel>? allConnections;
  StreamSubscription? _allConnectionsStream;

  // @JsonKey(ignore: true)
  @JsonKey(includeFromJson: false, includeToJson: false)
  // List<QueryDocumentSnapshot>? sentConnectionReqsDoc;
  List<ConnectionModel>? sentConnectionReqs;
  StreamSubscription? _sentConnectionReqsStream;

  @JsonKey(includeFromJson: false, includeToJson: false)
  // List<QueryDocumentSnapshot>? recievedConnectionReqsDoc;
  List<ConnectionModel>? recievedConnectionReqs;
  StreamSubscription? _recievedConnectionReqsStream;

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<QueryDocumentSnapshot>? connectionsDoc;
  List<UserModel>? connections;

  //used for checking weather the user is connected, req pending by them or you, accepted
  ConnectionModel? isUserConnection;
  StreamSubscription? _isUserConnectionStream;
  bool? isUserConnectionStreamInitialized = false;

  update(AuthNotifier auth, InitEnum? prevAuthStatus) async {
    _authNotifier = auth;
    authStatus = _authNotifier.authStatus;
    user = _authNotifier.currentUser;
    if (authStatus != prevAuthStatus) {
      await _populateProfile(user);
      notifyListeners();
    }
  }

  void clearOtherUser() {
    otherUserProfile = null;
    otherUserProfileStatus = null;
  }

  UserModel? profileAsPerRoute() {
    UserModel? userModel;
    if (isCurrentUser ?? false) {
      userModel = userProfile;
    } else {
      userModel = otherUserProfile;
    }
    userModel = _sortModelListsAsPerDate(userModel);
    return userModel;
  }

  static ProfileNotifier initialize(
    ProfileRepository profRepo, {
    required GlobalRepository globalRepo,
    required ConfigRepository configRepo,
    required NotificationRepository notificationRepo,
    required ConnectionRepository connectionRepo,
  }) {
    late ProfileNotifier instance;
    try {
      instance = ProfileNotifier();
    } catch (e) {
      Logger.logError('Initialization failed ProfileNotifer', e);
      instance = ProfileNotifier();
    }
    instance._profileRepo = profRepo;
    instance._globalRepo = globalRepo;
    instance._configRepo = configRepo;
    instance._notificationRepo = notificationRepo;
    instance._connectionRepo = connectionRepo;
    return instance;
  }

  void listenUserProfile(String? userId) async {
    _userProfileStream =
        _profileRepo.listenUserProfile(userId ?? '').listen((data) {
      userProfile = data;
      notifyListeners();
    });
  }

  void cancelListenUserProfile() {
    _userProfileStream?.cancel();
  }

  Future<void> fetchProfileByUsername(String? username) async {
    if (username != null) {
      invitedByUserProfileStatus = InitEnum.initializing;
      final profileRes = await _profileRepo.fetchProfileByUsername(username);
      if (profileRes.isSuccess) {
        invitedByUserProfile = profileRes.data;
        invitedByUserProfileStatus = InitEnum.initialized;
      } else {
        invitedByUserProfileStatus = InitEnum.uninitialized;
      }
      notifyListeners();
    }
  }

  Future<void> sendConnectionRequest(
    UserMinimum to,
  ) async {
    final res = await _connectionRepo.sendConnectionRequest(
      from: UserMinimum.getUserMinimum(userProfile),
      to: to,
    );
    if (res.isSuccess) {
      final notification = RepoNotification(
        from: UserMinimum.getUserMinimum(userProfile),
        to: to,
        title: 'You have a new connection request on Nova',
        description:
            'Someone wants to connect with you on Nova. Accept the request and grow your network.',
        type: NotificationType.connectionRequest,
        createdAt: DateTime.now(),
        reference: RepoNotificationReference(
          id: userProfile?.id,
          type: NotificationReferenceType.connectionSent,
        ),
      );
      await _notificationRepo.createNotification(notification);
      //show bottom succes noti
    }
  }

  // Future<void> fetchAllConnections() async {
  //   final res = await _connectionRepo.fetchAllConnections();
  //   if (res.isSuccess) {
  //     List<ConnectionModel?>? allConnections = res.data;
  //     List<ConnectionModel?>? dummyConnectionsList = [];
  //     List<ConnectionModel?>? tryConnectionsList = [];

  //     print('fetch all connnections 1');

  //     for (int i = 0; i < (allConnections?.length ?? 0); i++) {
  //       dummyConnectionsList ??= [];
  //       final user1Id = allConnections?[i]?.user1?.id;
  //       final user2Id = allConnections?[i]?.user2?.id;

  //       ConnectionModel? dummyModel = dummyConnectionsList.firstWhere(
  //           (element) => (element?.users?[user1Id] == true &&
  //               element?.users?[user2Id] == true),
  //           orElse: () => const ConnectionModel());

  //       if ((dummyModel?.id?.isEmpty ?? true)) {
  //         dummyConnectionsList.add(allConnections?[i]);
  //       } else {
  //         tryConnectionsList ??= [];
  //         tryConnectionsList.add(allConnections?[i]);
  //       }
  //     }
  //     print('fetch all connnections 2');
  //     print(allConnections?.length);
  //     print(dummyConnectionsList?.length);

  //     // for (int i = 0; i < (tryConnectionsList?.length ?? 0); i++) {
  //     //   if (tryConnectionsList?[i] != null &&
  //     //       (tryConnectionsList?[i]?.id?.isNotEmpty ?? false)) {
  //     //     print('helllo');
  //     //     await _connectionRepo.deleteConnection(
  //     //         id: tryConnectionsList![i]!.id!);
  //     //   }
  //     // }
  //   }
  // }

  Future<void> acceptConnectionRequest(
    ConnectionModel connection,
  ) async {
    final res = await _connectionRepo.acceptConnectionRequest(
      connection: connection,
    );
    if (res.isSuccess) {
      //show bottom succes noti
      await _connectionRepo.addConnectionUserId(
        addTo: connection.user1!,
        connectedUserId: connection.user2!.id!,
      );
      await _connectionRepo.addConnectionUserId(
        addTo: connection.user2!,
        connectedUserId: connection.user1!.id!,
      );
      Map<String, bool>? tmp =
          Map.fromEntries(userProfile?.connections?.entries ?? {});
      tmp[connection.user1?.id ?? ''] = true;
      userProfile = userProfile?.copyWith(connections: tmp);
      notifyListeners();

      final notification = RepoNotification(
        from: UserMinimum.getUserMinimum(userProfile),
        to: connection.user1,
        title: "Yayy! You've got a new connection on Nova!",
        description:
            '${userProfile?.name ?? 'Someone'} accepted your connection request.',
        type: NotificationType.connectionRequest,
        createdAt: DateTime.now(),
        reference: RepoNotificationReference(
          id: userProfile?.id,
          type: NotificationReferenceType.connectionAccept,
        ),
      );
      await _notificationRepo.createNotification(notification);
    }
  }

  Future<void> removeConnectionRequest(
    ConnectionModel connection,
  ) async {
    final res = await _connectionRepo.removeConnectionRequest(
      connection: connection,
    );
    if (res.isSuccess) {
      notifyListeners();
    }
  }

  Future<void> removeConnection(
    String removeConnectedUserId,
  ) async {
    final res = await _connectionRepo.removeConnection(
      user: UserMinimum.getUserMinimum(userProfile),
      removeConnectedUserId: removeConnectedUserId,
    );
    if (res.isSuccess) {
      //show bottom succes noti
      Map<String, bool>? tmp =
          Map.fromEntries(userProfile?.connections?.entries ?? {});
      tmp.removeWhere((key, value) => key == removeConnectedUserId);
      userProfile = userProfile?.copyWith(connections: tmp);
      notifyListeners();
    }
  }

  Future<UserModel?> fetchUsersById(
    String userId,
  ) async {
    final res = await _profileRepo.fetchUserById(userId);
    if (res.isSuccess) {
      return res.data;
    }
    return null;
  }

  Future<void> fetchConnectedUsersByIds(
    List<String> connectedUsersId,
  ) async {
    final res = await _profileRepo.fetchConnectedUsersByIds(connectedUsersId);
    if (res.isSuccess) {
      connections = res.data;
      notifyListeners();
    }
  }

  Future<List<ConnectionModel>?> fetchOtherUserConnection(String userID) async {
    var result =
        await _connectionRepo.fetchOtherUserConnections(userId: userID);
    if (result.isSuccess && (result.data?.isNotEmpty ?? false)) {
      return result.data;
    } else {
      return null;
    }
  }

  Future<int> fetchUserConnectionCount(String userID) async {
    final res = await _connectionRepo.fetchUserConnectionCount(userId: userID);
    if (res.isSuccess) {
      return res.data ?? 0;
    }
    return 0;
  }

  void listenAllConnections(String userID) async {
    _allConnectionsStream =
        _connectionRepo.listenAllConnections(userId: userID).listen((data) {
      allConnections = data;
      notifyListeners();
    });
  }

  void cancellistenAllConnections() {
    allConnections?.clear();
    _allConnectionsStream?.cancel();
  }

  // Future<void> fetchSentConnectionReqs() async {
  //   final res = await _connectionRepo.fetchSentConnectionReqs(
  //     user: UserMinimum.getUserMinimum(userProfile),
  //     documentSnapshot: (sentConnectionReqsDoc?.isEmpty ?? true)
  //         ? null
  //         : sentConnectionReqsDoc?.last,
  //   );
  //   if (res.isSuccess) {
  //     sentConnectionReqsDoc ??= [];
  //     sentConnectionReqsDoc?.addAll(res.data ?? []);
  //     sentConnectionReqs ??= [];
  //     List<ConnectionModel>? temp = res.data
  //         ?.map(
  //             (e) => ConnectionModel.fromJson(e.data() as Map<String, dynamic>))
  //         .toList();
  //     sentConnectionReqs?.addAll(temp ?? []);
  //     notifyListeners();
  //   }
  // }

  // Future<void> fetchRecievedConnectionReqs() async {
  //   final res = await _connectionRepo.fetchRecievedConnectionReqs(
  //     user: UserMinimum.getUserMinimum(userProfile),
  //     documentSnapshot: (recievedConnectionReqsDoc?.isEmpty ?? true)
  //         ? null
  //         : recievedConnectionReqsDoc?.last,
  //   );
  //   if (res.isSuccess) {
  //     recievedConnectionReqsDoc ??= [];
  //     recievedConnectionReqsDoc?.addAll(res.data ?? []);
  //     recievedConnectionReqs ??= [];
  //     List<ConnectionModel>? temp = res.data
  //         ?.map(
  //             (e) => ConnectionModel.fromJson(e.data() as Map<String, dynamic>))
  //         .toList();
  //     recievedConnectionReqs?.addAll(temp ?? []);
  //     notifyListeners();
  //   }
  // }

  void listenSentConnectionReqs() async {
    _sentConnectionReqsStream = _connectionRepo
        .listenSentConnectionReqs(userId: userProfile?.id ?? '')
        .listen((data) {
      sentConnectionReqs = data;
      notifyListeners();
    });
  }

  void cancelListenSentConnectionReqs() {
    _sentConnectionReqsStream?.cancel();
  }

  void listenRecievedConnectionReqs() async {
    _recievedConnectionReqsStream = _connectionRepo
        .listenRecievedConnectionReqs(userId: userProfile?.id ?? '')
        .listen((data) {
      recievedConnectionReqs = data;
      notifyListeners();
    });
  }

  void cancelListenRecievedConnectionReqs() {
    _recievedConnectionReqsStream?.cancel();
  }

  void startConnectionStream(String userId) async {
    _isUserConnectionStream = _connectionRepo
        .connectionStream(
      userIdOne: userProfile?.id ?? '',
      userIdTwo: userId,
    )
        .listen((data) {
      isUserConnection = data;
      isUserConnectionStreamInitialized = true;
      notifyListeners();
    });
  }

  void cancelConnectionStream() {
    isUserConnectionStreamInitialized = false;
    _isUserConnectionStream?.cancel();
  }

  List<String>? fetchMutualConnectionsIDs(
    UserMinimum to,
  ) {
    List<String>? connectionsId;
    final res = _connectionRepo.fetchMutualConnectionsIDs(
      from: UserMinimum.getUserMinimum(userProfile),
      to: to,
    );
    if (res.isSuccess) {
      //show bottom succes noti
      connectionsId = res.data;
    }
    return connectionsId;
  }

  Future<void> blockUser({
    UserModel? fromUserModel,
    UserModel? toUserModel,
  }) async {
    //If 'User A' is blocking 'User B'; 'User A' will be termed as 'from' & 'User B' will be termed as 'to'
    //User A will store User B in 'to'; User B will store User A in 'from'
    UserBlockedUsers? fromBlockModel = fromUserModel?.blocked;
    UserBlockedUsers? toBlockModel = toUserModel?.blocked;

    Map<String, bool>? tempFromUserFrom =
        Map.fromEntries(fromBlockModel?.from?.entries ?? {});
    Map<String, bool>? tempFromUserTo =
        Map.fromEntries(fromBlockModel?.to?.entries ?? {});
    Map<String, bool>? tempToUserFrom =
        Map.fromEntries(toBlockModel?.from?.entries ?? {});
    Map<String, bool>? tempToUserTo =
        Map.fromEntries(toBlockModel?.to?.entries ?? {});

    tempFromUserTo[toUserModel?.id ?? ''] = true;
    tempToUserFrom[fromUserModel?.id ?? ''] = true;

    fromBlockModel = fromBlockModel?.copyWith(
      to: tempFromUserTo,
      from: tempFromUserFrom,
    );

    toBlockModel = toBlockModel?.copyWith(
      from: tempToUserFrom,
      to: tempToUserTo,
    );

    fromUserModel = fromUserModel?.copyWith(
      blocked: fromBlockModel,
    );

    toUserModel = toUserModel?.copyWith(
      blocked: toBlockModel,
    );

    if (fromUserModel?.id?.isNotEmpty ?? false) {
      await saveProfile(fromUserModel!);
    }
    if (toUserModel?.id?.isNotEmpty ?? false) {
      await saveToOtherProfile(toUserModel!);
    }
    await _connectionRepo.blockUser(
      to: UserMinimum.getUserMinimum(toUserModel),
      from: UserMinimum.getUserMinimum(fromUserModel),
    );
    notifyListeners();
  }

  // Future<void> unblockUser(ConnectionModel connection) async {
  //   This is not the complete implementation
  //   DO NOT USE Directly Before Iterations
  //
  //   final res = await _connectionRepo.unblockUser(connection: connection);
  //   if (res.isSuccess) {
  //     UserBlockedUsers? blocked = userProfile?.blocked;
  //     Map<String, bool>? to = Map.fromEntries(blocked?.to?.entries ?? {});
  //     to.removeWhere((key, value) => key == connection.blocked?.to);
  //     blocked = blocked?.copyWith(to: to);
  //     userProfile = userProfile?.copyWith(blocked: blocked);
  //     notifyListeners();
  //   }
  // }

  Future<void> populateOtherUser(String? username) async {
    if ((isCurrentUser?.not ?? false) &&
        username != null &&
        authStatus != null) {
      otherUserProfileStatus = InitEnum.initializing;
      final profileRes = await _profileRepo.fetchProfileByUsername(username);
      if (profileRes.isSuccess) {
        otherUserProfile = profileRes.data;
        otherUserProfileStatus = InitEnum.initialized;
      } else {
        userProfile = null;
        otherUserProfileStatus = InitEnum.uninitialized;
      }
      notifyListeners();
    }
  }

  Future<void> storeUserImage(UserModel profile, Uint8List imagePath) async {
    final res = await _profileRepo.storeImageToFirebase(imagePath, profile);
    if (res.isSuccess) {
      userProfile = res.data;
    }
    notifyListeners();
  }

  Future<void> countUsersInWaitlist() async {
    final res = await _profileRepo.countUsersInWaitlist();
    if (res.isSuccess) {
      waitlistCounter = res.data;
    }
    notifyListeners();
  }

  Future<void> saveProfile(UserModel profile) async {
    profile = _addIdsToProfileIfNewChange(profile);
    profile = await _updateProfileIfInvitedBy(profile);
    final res = await _profileRepo.saveProfile(profile);
    if (res.isSuccess) {
      userProfile = res.data;
      userProfile = _sortModelListsAsPerDate(userProfile);
    }
    notifyListeners();
  }

  Future<void> saveToOtherProfile(UserModel profile) async {
    final res = await _profileRepo.saveProfile(profile);
    if (res.isSuccess) {
      otherUserProfile = res.data;
      otherUserProfile = _sortModelListsAsPerDate(otherUserProfile);
    }
    notifyListeners();
  }

  Future<void> fetchGlobalInterests() async {
    if (globalInterests?.isNotEmpty ?? false) {
      return;
    }
    final res =
        await _globalRepo.fetchGlobal<NovaInterests>(AppKeyNames.interests);
    if (res.isSuccess) {
      globalInterests = res.data
          ?.map(
            (e) => NovaInterests.fromJson(e),
          )
          .toList();
    }
    notifyListeners();
  }

  Future<void> fetchGlobalSchools() async {
    if (globalSchools?.isNotEmpty ?? false) {
      return;
    }
    final res = await _globalRepo.fetchGlobalSchools();
    if (res.isSuccess) {
      globalSchools = res.data;
    }
    notifyListeners();
  }

  Future<void> addToGlobalSchools(String name) async {
    //Don't allow to add if Global school is not populated
    if (globalSchools?.isEmpty ?? true) {
      return;
    }
    SchoolModel school = SchoolModel(
      name: name,
      id: globalSchools?.last.id ?? 0 + 1,
    );
    final res = await _globalRepo.addToGlobalSchools(school);
    if (res.isSuccess) {}
    notifyListeners();
  }

  Future<void> fetchGlobalOpportunities() async {
    if (globalOpportunities?.isNotEmpty ?? false) {
      return;
    }
    final res = await _globalRepo
        .fetchGlobal<NovaOpportunities>(AppKeyNames.opportunities);
    if (res.isSuccess) {
      globalOpportunities = res.data
          ?.map(
            (e) => NovaOpportunities.fromJson(e),
          )
          .toList();
    }
    notifyListeners();
  }

  Future<void> fetchGlobalCountry() async {
    if (globalCountries?.isNotEmpty ?? false) {
      return;
    }
    final res =
        await _globalRepo.fetchGlobal<UserDreamCountry>(AppKeyNames.countries);
    if (res.isSuccess) {
      globalCountries = res.data
          ?.map(
            (e) => UserDreamCountry.fromJson(e),
          )
          .toList();
    }
    notifyListeners();
  }

  Future<void> fetchGlobalCareer() async {
    if (globalCareers?.isNotEmpty ?? false) {
      return;
    }
    final res =
        await _globalRepo.fetchGlobal<UserDreamCareer>(AppKeyNames.careers);
    if (res.isSuccess) {
      globalCareers = res.data
          ?.map(
            (e) => UserDreamCareer.fromJson(e),
          )
          .toList();
    }
    notifyListeners();
  }

  Future<void> fetchGlobalCollege() async {
    if (globalColleges?.isNotEmpty ?? false) {
      return;
    }
    final res =
        await _globalRepo.fetchGlobal<UserDreamCollege>(AppKeyNames.colleges);
    if (res.isSuccess) {
      globalColleges = res.data
          ?.map(
            (e) => UserDreamCollege.fromJson(e),
          )
          .toList();
    }
    notifyListeners();
  }

  Future<void> fetchGlobalCities() async {
    if (globalCities?.isNotEmpty ?? false) {
      return;
    }
    final res = await _globalRepo.fetchGlobal<UserLocation>(AppKeyNames.cities);
    if (res.isSuccess) {
      globalCities = res.data
          ?.map(
            (e) => UserLocation.fromJson(e),
          )
          .toList();
    }
    notifyListeners();
  }

  Future<void> addGlobalCity(UserLocation location) async {
    final res = await _globalRepo.addToGlobal<UserLocation>(location);
    if (res.isSuccess) {
      globalCities?.add(location);
      notifyListeners();
    }
  }

  Future<void> fetchRecommendedUsers({
    List<String>? schoolId,
    List<String>? interestId1,
    List<String>? interestId2,
    List<String>? interestId3,
    List<String>? interestId4,
    List<String>? interestId5,
  }) async {
    //The List<String>? argument must contain the id at index 0 and name at index 1
    final res = await _profileRepo.fetchRecommendedUsersbyFilters(
      school: schoolId,
      interest1: interestId1,
      interest2: interestId2,
      interest3: interestId3,
      interest4: interestId4,
      interest5: interestId5,
    );
    if (res.isSuccess) {
      recommendedProfiles = res.data;
    }
    notifyListeners();
  }

  void clearFilterUsers() {
    filterProfileDocSnapshots = null;
    filterProfiles = null;
  }

  Future<void> fetchUserByFilter(
    String id,
    String filter, {
    String? filter2,
    String? id2,
    String? filterNumber,
  }) async {
    List<QueryDocumentSnapshot>? filterDocSnapToBeUsed;
    if (filterNumber == '2') {
      filterDocSnapToBeUsed = filterProfileDocSnapshots2;
    } else if (filterNumber == '3') {
      filterDocSnapToBeUsed = filterProfileDocSnapshots3;
    } else {
      filterDocSnapToBeUsed = filterProfileDocSnapshots;
    }
    final res = await _profileRepo.fetchUserByFilter(
      id,
      filter,
      filter2: filter2,
      id2: id2,
      documentSnapshot: filterDocSnapToBeUsed?.last,
    );
    if (res.isSuccess) {
      if (filterNumber == '2') {
        filterProfiles2 ??= [];
        filterProfiles2?.addAll(res.data?.map(
              (e) => UserModel.fromJson(e.data() as Map<String, dynamic>),
            ) ??
            []);

        filterProfiles2 = filterProfiles2?.where((element) {
          return ((userProfile?.blocked?.from?[element.id] != true) &&
              (userProfile?.blocked?.to?[element.id] != true));
        }).toList();

        filterProfileDocSnapshots2 ??= [];
        filterProfileDocSnapshots2?.addAll(res.data ?? []);
      } else if (filterNumber == '3') {
        filterProfiles3 ??= [];
        filterProfiles3?.addAll(res.data?.map(
              (e) => UserModel.fromJson(e.data() as Map<String, dynamic>),
            ) ??
            []);

        filterProfiles3 = filterProfiles3?.where((element) {
          return ((userProfile?.blocked?.from?[element.id] != true) &&
              (userProfile?.blocked?.to?[element.id] != true));
        }).toList();

        filterProfileDocSnapshots3 ??= [];
        filterProfileDocSnapshots3?.addAll(res.data ?? []);
      } else {
        filterProfiles ??= [];
        filterProfiles?.addAll(res.data?.map(
              (e) => UserModel.fromJson(e.data() as Map<String, dynamic>),
            ) ??
            []);

        filterProfiles = filterProfiles?.where((element) {
          return ((userProfile?.blocked?.from?[element.id] != true) &&
              (userProfile?.blocked?.to?[element.id] != true));
        }).toList();

        filterProfileDocSnapshots ??= [];
        filterProfileDocSnapshots?.addAll(res.data ?? []);
      }
    }
    notifyListeners();
  }

  Future<void> createNotification(RepoNotification repoNotification) async {
    // RepoNotification noti = RepoNotification(
    //   from: UserMinimum.getUserMinimum(userProfile),
    //   to: UserMinimum.getUserMinimum(to),
    //   title: 'Sample Noti',
    //   description: 'Notification description',
    //   isRead: false,
    //   type: NotificationType.viewedProfile,
    //   // reference: RepoNotificationReference(id: '3434', type: NotificationReferenceType.)
    //   createdAt: DateTime.now(),
    // );
    final res = await _notificationRepo.createNotification(repoNotification);
    print(res.data);
  }

  //UPLOADING IMAGES

  Future<String?> uploadCollectionItemThumbnail({
    required String base64File,
  }) async {
    final request = CloudinaryUploadRequest(
      file: base64File,
      folder: AppKeyNames.cloudinaryCollectionThumbnails,
      useFilename: true,
      tags: userProfile?.username,
    );
    final res = await _profileRepo.uploadToCloudinary(request);
    return res.data?.secureUrl;
  }

  Future<void> uploadProfilePicture({
    required String base64File,
  }) async {
    final request = CloudinaryUploadRequest(
      file: base64File,
      folder: AppKeyNames.cloudinaryProfilePictures,
      useFilename: true,
      tags: userProfile?.username,
    );
    final res = await _profileRepo.uploadToCloudinary(request);
    if (res.isSuccess) {
      userProfile =
          userProfile?.copyWith(profilePictureUrl: res.data?.secureUrl);
    }
  }

  Future<void> uploadWallpaper({
    required String base64File,
  }) async {
    final request = CloudinaryUploadRequest(
      file: base64File,
      folder: AppKeyNames.cloudinaryProfileWallpapers,
      useFilename: true,
      tags: userProfile?.username,
    );
    final res = await _profileRepo.uploadToCloudinary(request);
    if (res.isSuccess) {
      userProfile =
          userProfile?.copyWith(profileWallpaperUrl: res.data?.secureUrl);
    }
  }

  //PRIVATE METHODS OF THIS NOTIFIER

  Future<void> _populateProfile(User? user) async {
    if (user == null) {
      userProfile = null;
      userProfileStatus = InitEnum.uninitialized;
      return;
    }
    if (userProfile != null) {
      userProfileStatus = InitEnum.initialized;
      return;
    }
    final internetStatus = await _configRepo.isInternetAvailable();
    if (internetStatus.isSuccess.not) {
      return;
    }
    userProfileStatus = InitEnum.initializing;
    // await _globalRepo.globalStore();
    final to = UserMinimum.fromJson(
      {
        "id": "d9CqfioyUAhEVaCID4YciwOzfdy1",
        "name": "Khushal Rao",
        "username": "khushal_nova",
        "email": "khushal@novahq.in",
        "profilePictureUrl":
            "https://lh3.googleusercontent.com/a/AEdFTp7XmCBX7Q-oa8C0F7ZXcQTHxITDfcevrxY22Y11=s96-c",
        "profileWallpaperUrl": null,
        "tagline": null,
        "fcmToken":
            "dxFn66NnTMCXqNluPfrexK:APA91bE1QNfIBu7ei6I-msJTa_tt2pUtqE6GzdYswB0pa-LF3zsQN7yEOY6HthT-HhuD9xUrdv2cqV098Px9Zzqibn_zvL-MliXg3ChjrMaTeHvnPOL9A863CLiDEUVEQJb7AVs9H7Sn",
      },
    );
    final profileRes = await _profileRepo.fetchProfile(user);
    if (profileRes.isSuccess) {
      userProfile = profileRes.data;
      userProfile = await _profileFcmChecker(userProfile);
      // await uploadProfilePicture(base64File: AppStrings.base64SampleImage);
      userProfileStatus = InitEnum.initialized;
    } else {
      final createProfRes = await _profileRepo.createProfile(user,
          invitedBy: invitedByUserInviteModel,
          invitedByUserProfile: invitedByUserProfile);
      if (createProfRes.isSuccess) {
        userProfile = createProfRes.data;
        userProfileStatus = InitEnum.initialized;
      } else {
        userProfileStatus = InitEnum.uninitialized;
      }
    }
  }

  Future<UserModel> _updateProfileIfInvitedBy(
      UserModel currentUserModel) async {
    final condition1 = (invitedByUserProfile != null &&
        invitedByUserInviteModel != null &&
        currentUserModel.invitedBy == null &&
        ((currentUserModel.inTheWaitlist ?? true) ||
            (callFromFinalOnboarding ?? false)));
    final condition2 = (invitedByUserProfile != null &&
        invitedByUserInviteModel != null &&
        (callFromUsername ?? false));

    if (condition1 || condition2) {
      currentUserModel =
          currentUserModel.copyWith(invitedBy: invitedByUserInviteModel);
      UserInviteModel userInviteModel = UserInviteModel(
        inviteCode: invitedByUserProfile!.inviteCode,
        name: currentUserModel.name,
        userId: currentUserModel.id,
        userProfileImageUrl: currentUserModel.profilePictureUrl,
        username: currentUserModel.username,
      );

      List<UserInviteModel>? invitedToList =
          invitedByUserProfile!.invitedTo?.toList() ?? [];

      final checkInvitedUserByUsername = invitedToList.firstWhere(
        (element) => element.username == userInviteModel.username,
        orElse: () => UserInviteModel(),
      );
      final checkInvitedUserByUserId = invitedToList.firstWhere(
        (element) => element.userId == userInviteModel.userId,
        orElse: () => UserInviteModel(),
      );
      if (checkInvitedUserByUsername.username == null &&
          checkInvitedUserByUserId.userId != null) {
        invitedToList
            .removeWhere((element) => element.userId == userInviteModel.userId);
        invitedToList.add(userInviteModel);
        invitedByUserProfile = invitedByUserProfile!.copyWith(
          invitedTo: invitedToList,
        );
        await _profileRepo.updateInvitedToOtherProfile(invitedByUserProfile!);
      } else if (checkInvitedUserByUserId.userId == null) {
        invitedToList.add(userInviteModel);
        invitedByUserProfile = invitedByUserProfile!.copyWith(
          invitedTo: invitedToList,
        );
        await _profileRepo.updateInvitedToOtherProfile(invitedByUserProfile!);
      }
      invitedByUserProfile = null;
      if (condition1) {
        callFromFinalOnboarding = false;
      }
      if (condition2) {
        callFromUsername = false;
      }
    }
    return currentUserModel;
  }

  UserModel _addIdsToProfileIfNewChange(UserModel newModel) {
    Function deepEq = const DeepCollectionEquality.unordered().equals;
    if (deepEq(newModel.userInterests, userProfile?.userInterests) == false) {
      newModel = newModel.copyWith(userInterestsIds: {
        for (NovaInterests v in newModel.userInterests ?? [])
          v.id.toString(): true
      });
    }
    if (deepEq(newModel.userOpportunities, userProfile?.userOpportunities) ==
        false) {
      newModel = newModel.copyWith(userOpportunitiesIds: {
        for (NovaOpportunities v in newModel.userOpportunities ?? [])
          v.id.toString(): true
      });
    }
    return newModel;
  }

  _sortModelListsAsPerDate(UserModel? userModel) {
    List<Education>? educations = userModel?.educations?.toList();
    List<Experience>? experiences = userModel?.experiences?.toList();
    List<Volunteer>? volunteered = userModel?.volunteered?.toList();
    List<Award>? awards = userModel?.awards?.toList();
    List<UserTestScores>? testScores = userModel?.testScores?.toList();
    List<AptitudeTest>? aptitudeTests = userModel?.aptitudeTests?.toList();

    educations?.sort(
      (a, b) {
        if (a.startDate == null) return -1;
        if (b.startDate == null) return 1;
        return b.startDate!.compareTo(a.startDate!);
      },
    );
    experiences?.sort(
      (a, b) {
        if (a.startDate == null) return -1;
        if (b.startDate == null) return 1;
        return b.startDate!.compareTo(a.startDate!);
      },
    );
    volunteered?.sort(
      (a, b) {
        if (a.startDate == null) return -1;
        if (b.startDate == null) return 1;
        return b.startDate!.compareTo(a.startDate!);
      },
    );
    awards?.sort(
      (a, b) {
        if (a.issueDate == null) return -1;
        if (b.issueDate == null) return 1;
        return b.issueDate!.compareTo(a.issueDate!);
      },
    );
    testScores?.sort(
      (a, b) {
        if (a.testDate == null) return -1;
        if (b.testDate == null) return 1;
        return b.testDate!.compareTo(a.testDate!);
      },
    );
    aptitudeTests?.sort(
      (a, b) {
        if (a.issueDate == null) return -1;
        if (b.issueDate == null) return 1;
        return b.issueDate!.compareTo(a.issueDate!);
      },
    );
    userModel = userModel?.copyWith(
      educations: educations,
      experiences: experiences,
      volunteered: volunteered,
      awards: awards,
      testScores: testScores,
      aptitudeTests: aptitudeTests,
    );
    return userModel;
  }

  Future<UserModel?> _profileFcmChecker(UserModel? userModel) async {
    final fcmToken = await AppEnvironment.firebaseMessaging.getToken();
    if (fcmToken != userModel?.fcmToken) {
      userModel = userModel?.copyWith(fcmToken: fcmToken);
      final res = await _profileRepo.saveProfile(userModel!);
      if (res.isSuccess) {
        return res.data;
      }
    }
    return userModel;
  }

  // @override
  // ProfileNotifier fromJson(Map json) =>
  //     _$ProfileNotifierFromJson(json as Map<String, dynamic>);

  // @override
  // Map<String, dynamic> toJson(ProfileNotifier notifier) =>
  //     _$ProfileNotifierToJson(notifier);

  // Future<void> blockUser(UserMinimum user) async {
  //   final res = await _connectionRepo.blockUser(
  //       to: user, from: UserMinimum.getUserMinimum(userProfile));
  //   if (res.isSuccess) {
  //     UserBlockedUsers? blocked = userProfile?.blocked;
  //     Map<String, bool>? to = Map.fromEntries(blocked?.to?.entries ?? {});
  //     to[user.id ?? ''] = true;
  //     blocked = blocked?.copyWith(to: to);
  //     userProfile = userProfile?.copyWith(blocked: blocked);
  //     notifyListeners();
  //   }
  // }
}
