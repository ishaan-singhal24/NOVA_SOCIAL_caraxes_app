import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/connection/connection_blocked_user.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
import 'package:nova_social/utils/utils.dart';

class ConnectionRepository {
  final firestore = FirebaseFirestore.instance;

  Future<Responser<bool>> checkConnectionExists(
      {required String userId1, required String userId2}) async {
    try {
      final snapshot = await firestore
          .collection(AppKeyNames.connections)
          .where('${AppKeyNames.users}.$userId1', isEqualTo: true)
          .where('${AppKeyNames.users}.$userId2', isEqualTo: true)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final List<ConnectionModel> connectionModelList = snapshot.docs
            .map((e) => ConnectionModel.fromJson(e.data()))
            .toList();
        if (connectionModelList.isNotEmpty) {
          return Responser(
            message: AppStrings.success,
            isSuccess: true,
            data: true,
          );
        }
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: false,
      );
    } catch (error) {
      return ErrorHandler.error<bool>(error);
    }
  }

  Future<Responser<bool?>> sendConnectionRequest({
    required UserMinimum from,
    required UserMinimum to,
  }) async {
    try {
      final res = await checkConnectionExists(
          userId1: from.id ?? '', userId2: to.id ?? '');
      if (res.isSuccess.not || (res.data ?? true)) {
        return Responser(
          message: AppStrings.failure,
          isSuccess: false,
        );
      }
      final DocumentReference documentRef =
          firestore.collection(AppKeyNames.connections).doc();
      ConnectionModel connection = ConnectionModel(
        user1: from,
        user2: to,
        users: {
          from.id!: true,
          to.id!: true,
        },
        createdAt: DateTime.now(),
        status: ConnectionStatus.pending,
        isSeen: false,
      );

      connection = connection.copyWith(id: documentRef.id);
      await documentRef.set(
        connection.toJson(),
      );
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
      );
    } catch (e) {
      return ErrorHandler.error<bool>(e);
    }
  }

  Future<Responser<bool?>> acceptConnectionRequest({
    required ConnectionModel connection,
    bool? isSeen,
  }) async {
    try {
      connection = connection.copyWith(
        status: ConnectionStatus.accepted,
        isSeen: isSeen,
      );
      final DocumentReference documentRef =
          firestore.collection(AppKeyNames.connections).doc(connection.id!);
      await documentRef.update(
        connection.toJson(),
      );
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
      );
    } catch (e) {
      return ErrorHandler.error<bool>(e);
    }
  }

  Future<Responser<bool?>> blockUser({
    required UserMinimum to,
    required UserMinimum from,
  }) async {
    try {
      //Blocking field values in connection collection
      ConnectionModel? connection;
      final query = await firestore
          .collection(AppKeyNames.connections)
          .where(
            '${AppKeyNames.users}.${to.id}',
            isEqualTo: true,
          )
          .where(
            '${AppKeyNames.users}.${from.id}',
            isEqualTo: true,
          )
          .limit(1)
          .get();
      if (query.docs.isNotEmpty) {
        connection = ConnectionModel.fromJson(
          query.docs.first.data(),
        );
        connection = connection.copyWith(
          status: ConnectionStatus.blocked,
          blocked: ConnectionBlockedUser(
            from: from.id,
            to: to.id,
          ),
          updatedAt: DateTime.now(),
        );
        await firestore
            .collection(AppKeyNames.connections)
            .doc(connection.id)
            .update(
              connection.toJson(),
            );
      } else {
        connection = ConnectionModel(
          user1: from,
          user2: to,
          status: ConnectionStatus.blocked,
          blocked: ConnectionBlockedUser(
            from: from.id,
            to: to.id,
          ),
          createdAt: DateTime.now(),
        );
        final DocumentReference documentRef =
            firestore.collection(AppKeyNames.connections).doc();
        connection = connection.copyWith(
          id: documentRef.id,
        );
        await documentRef.set(connection.toJson());
      }
      //Blocking field values in user collection
      await firestore.collection(AppKeyNames.user).doc(from.id).update({
        '${AppKeyNames.blocked}.${AppKeyNames.to}.${to.id}': true,
        '${AppKeyNames.connections}.${to.id}': false,
      });
      await firestore.collection(AppKeyNames.user).doc(to.id).update({
        '${AppKeyNames.blocked}.${AppKeyNames.from}.${from.id}': true,
        '${AppKeyNames.connections}.${from.id}': false,
      });
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
      );
    } catch (e) {
      return ErrorHandler.error<bool>(e);
    }
  }

  Future<Responser<bool?>> unblockUser({
    required ConnectionModel connection,
  }) async {
    try {
      await firestore
          .collection(AppKeyNames.connections)
          .doc(connection.id)
          .delete();
      //unblocking field values in user collections
      await firestore
          .collection(AppKeyNames.user)
          .doc(connection.blocked?.from)
          .update({
        '${AppKeyNames.blocked}.${AppKeyNames.to}.${connection.blocked?.to}':
            FieldValue.delete(),
        '${AppKeyNames.connections}.${connection.blocked?.to}':
            FieldValue.delete(),
      });
      await firestore
          .collection(AppKeyNames.user)
          .doc(connection.blocked?.to)
          .update({
        '${AppKeyNames.blocked}.${AppKeyNames.from}.${connection.blocked?.from}':
            FieldValue.delete(),
        '${AppKeyNames.connections}.${connection.blocked?.from}':
            FieldValue.delete(),
      });
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
      );
    } catch (e) {
      return ErrorHandler.error<bool>(e);
    }
  }

  Future<Responser<bool?>> removeConnectionRequest({
    required ConnectionModel connection,
  }) async {
    try {
      final DocumentReference documentRef =
          firestore.collection(AppKeyNames.connections).doc(connection.id!);
      await documentRef.delete();
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
      );
    } catch (e) {
      return ErrorHandler.error<bool>(e);
    }
  }

  Future<Responser> removeConnection({
    required UserMinimum user,
    required String removeConnectedUserId,
  }) async {
    try {
      await firestore.collection(AppKeyNames.user).doc(user.id).update({
        '${AppKeyNames.connections}.$removeConnectedUserId':
            FieldValue.delete(),
      });
      await firestore
          .collection(AppKeyNames.user)
          .doc(removeConnectedUserId)
          .update({
        '${AppKeyNames.connections}.${user.id}': FieldValue.delete(),
      });
      final query = await firestore
          .collection(AppKeyNames.connections)
          .where(
            '${AppKeyNames.users}.${user.id}',
            isEqualTo: true,
          )
          .where(
            '${AppKeyNames.users}.$removeConnectedUserId',
            isEqualTo: true,
          )
          .limit(1)
          .get();
      if (query.docs.isNotEmpty) {
        await firestore
            .collection(AppKeyNames.connections)
            .doc(query.docs.first.id)
            .delete();
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
      );
    } catch (e) {
      return ErrorHandler.error(e);
    }
  }

  Stream<ConnectionModel?> connectionStream({
    required String userIdOne,
    required String userIdTwo,
  }) {
    return firestore
        .collection(AppKeyNames.connections)
        .where(
          '${AppKeyNames.users}.$userIdOne',
          isEqualTo: true,
        )
        .where(
          '${AppKeyNames.users}.$userIdTwo',
          isEqualTo: true,
        )
        .snapshots()
        .map(
      (event) {
        if (event.docs.isEmpty) {
          return null;
        }
        return ConnectionModel.fromJson(
          event.docs.first.data(),
        );
      },
    );
  }

  // Future<Responser<List<QueryDocumentSnapshot>?>> fetchAllConnections({
  //   required UserMinimum user,
  //   DocumentSnapshot? documentSnapshot,
  // }) async {
  //   try {
  //     Query query = firestore
  //         .collection(AppKeyNames.connections)
  //         .where(AppKeyNames.status, isEqualTo: ConnectionStatus.accepted.name)
  //         .where(AppKeyNames.users, arrayContains: user.id);
  //     if (documentSnapshot != null) {
  //       query = query.startAfterDocument(documentSnapshot);
  //     }
  //     final snapshot = await query.limit(12).get();
  //     if (snapshot.docs.isEmpty) {
  //       return Responser(
  //         message: AppStrings.failure,
  //         isSuccess: false,
  //       );
  //     }
  //     return Responser(
  //       message: AppStrings.success,
  //       isSuccess: true,
  //       data: snapshot.docs,
  //     );
  //   } catch (e) {
  //     return ErrorHandler.error<List<QueryDocumentSnapshot>?>(e);
  //   }
  // }

  // Future<Responser> deleteConnection({
  //   required String id,
  // }) async {
  //   // 2p1ba3r0S3QgMbOfTU1A
  //   try {
  //     await firestore.collection(AppKeyNames.connections).doc(id).delete();
  //     return Responser(
  //       message: AppStrings.success,
  //       isSuccess: true,
  //     );
  //   } catch (e) {
  //     return ErrorHandler.error(e);
  //   }
  // }

  // Future<Responser<List<ConnectionModel>?>> fetchAllConnections() async {
  //   try {
  //     final snapshot =
  //         await firestore.collection(AppKeyNames.connections).get();

  //     if (snapshot.docs.isNotEmpty) {
  //       final List<ConnectionModel> connectionModel = snapshot.docs
  //           .map((e) => ConnectionModel.fromJson(e.data()))
  //           .toList();
  //       return Responser(
  //         message: AppStrings.success,
  //         isSuccess: true,
  //         data: connectionModel,
  //       );
  //     }
  //     return Responser(
  //       message: AppStrings.success,
  //       isSuccess: true,
  //       data: null,
  //     );
  //   } catch (error) {
  //     return ErrorHandler.error<List<ConnectionModel>?>(error);
  //   }
  // }

  Future<Responser<List<ConnectionModel>?>> fetchOtherUserConnections(
      {required String userId}) async {
    try {
      final snapshot = await firestore
          .collection(AppKeyNames.connections)
          .where('${AppKeyNames.users}.$userId', isEqualTo: true)
          .where(AppKeyNames.status, isEqualTo: ConnectionStatus.accepted.name)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final List<ConnectionModel> connectionModel = snapshot.docs
            .map((e) => ConnectionModel.fromJson(e.data()))
            .toList();
        return Responser(
          message: AppStrings.success,
          isSuccess: true,
          data: connectionModel,
        );
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: null,
      );
    } catch (error) {
      return ErrorHandler.error<List<ConnectionModel>?>(error);
    }
  }

  Future<Responser<int?>> fetchUserConnectionCount(
      {required String userId}) async {
    try {
      final query = firestore
          .collection(AppKeyNames.connections)
          .where('${AppKeyNames.users}.$userId', isEqualTo: true)
          .where(AppKeyNames.status, isEqualTo: ConnectionStatus.accepted.name);
      final length = await query.count().get();

      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: length.count,
      );
    } catch (error) {
      return ErrorHandler.error<int?>(error);
    }
  }

  Stream<List<ConnectionModel>?> listenAllConnections({
    required String userId,
  }) {
    return firestore
        .collection(AppKeyNames.connections)
        .where('${AppKeyNames.users}.$userId', isEqualTo: true)
        .where(AppKeyNames.status, isEqualTo: ConnectionStatus.accepted.name)
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) {
        return null;
      }
      return snapshot.docs
          .map((e) => ConnectionModel.fromJson(e.data()))
          .toList();
    });
  }

  Responser<List<String>?> fetchMutualConnectionsIDs({
    required UserMinimum from,
    required UserMinimum to,
  }) {
    try {
      List<String> mutual = from.connections?.keys
              .toSet()
              .where((element) =>
                  to.connections?.keys.toSet().contains(element) ?? false)
              .toList() ??
          [];
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: mutual,
      );
    } catch (e) {
      return ErrorHandler.error<List<String>?>(e);
    }
  }

  Future<Responser> addConnectionUserId({
    required UserMinimum addTo,
    required String connectedUserId,
  }) async {
    try {
      await firestore.collection(AppKeyNames.user).doc(addTo.id).update({
        '${AppKeyNames.connections}.$connectedUserId': true,
      });
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
      );
    } catch (e) {
      return ErrorHandler.error(e);
    }
  }

  // Future<Responser<List<QueryDocumentSnapshot>?>> fetchRecievedConnectionReqs({
  //   required UserMinimum user,
  //   DocumentSnapshot? documentSnapshot,
  // }) async {
  //   try {
  //     Query query = firestore
  //         .collection(AppKeyNames.connections)
  //         .where('${AppKeyNames.user2}.${AppKeyNames.id}', isEqualTo: user.id)
  //         .where(AppKeyNames.status, isEqualTo: ConnectionStatus.pending.name);
  //     if (documentSnapshot != null) {
  //       query = query.startAfterDocument(documentSnapshot);
  //     }
  //     final snapshot = await query.limit(4).get();
  //     if (snapshot.docs.isEmpty) {
  //       return Responser(
  //         message: AppStrings.failure,
  //         isSuccess: false,
  //       );
  //     }
  //     return Responser(
  //       message: AppStrings.success,
  //       isSuccess: true,
  //       data: snapshot.docs,
  //     );
  //   } catch (e) {
  //     return ErrorHandler.error(e);
  //   }
  // }

  Stream<List<ConnectionModel>?> listenRecievedConnectionReqs({
    required String userId,
  }) {
    return firestore
        .collection(AppKeyNames.connections)
        .where('${AppKeyNames.user2}.${AppKeyNames.id}', isEqualTo: userId)
        .where(AppKeyNames.status, isEqualTo: ConnectionStatus.pending.name)
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) {
        return null;
      }
      return snapshot.docs
          .map((e) => ConnectionModel.fromJson(e.data()))
          .toList();
    });
  }

  // Future<Responser<List<QueryDocumentSnapshot>?>> fetchSentConnectionReqs({
  //   required UserMinimum user,
  //   DocumentSnapshot? documentSnapshot,
  // }) async {
  //   try {
  //     Query query = firestore
  //         .collection(AppKeyNames.connections)
  //         .where('${AppKeyNames.user1}.${AppKeyNames.id}', isEqualTo: user.id)
  //         .where(AppKeyNames.status, isEqualTo: ConnectionStatus.pending.name);
  //     if (documentSnapshot != null) {
  //       query = query.startAfterDocument(documentSnapshot);
  //     }
  //     final snapshot = await query.limit(5).get();
  //     return Responser(
  //       message: AppStrings.success,
  //       isSuccess: true,
  //       data: snapshot.docs,
  //     );
  //   } catch (e) {
  //     return ErrorHandler.error(e);
  //   }
  // }

  Stream<List<ConnectionModel>?> listenSentConnectionReqs({
    required String userId,
  }) {
    return firestore
        .collection(AppKeyNames.connections)
        .where('${AppKeyNames.user1}.${AppKeyNames.id}', isEqualTo: userId)
        .where(AppKeyNames.status, isEqualTo: ConnectionStatus.pending.name)
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) {
        return null;
      }
      return snapshot.docs
          .map((e) => ConnectionModel.fromJson(e.data()))
          .toList();
    });
  }
}
