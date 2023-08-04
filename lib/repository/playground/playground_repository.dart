import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/data/models/playground/playground_feed/comment/playground_feed_comment_model.dart';

class PlaygroundRepository {
  final firestore = FirebaseFirestore.instance;

  Future<Responser<PlaygroundFeedModel?>> createFeed(
      PlaygroundFeedModel playgroundFeedModel) async {
    try {
      await firestore
          .collection(AppKeyNames.playgroundFeed)
          .add(playgroundFeedModel.toJson());
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: playgroundFeedModel,
      );
    } catch (e) {
      return ErrorHandler.error<PlaygroundFeedModel>(e);
    }
  }

  Future<Responser<PlaygroundFeedModel?>> updateFeed(
      PlaygroundFeedModel playgroundFeedModel) async {
    try {
      await firestore
          .collection(AppKeyNames.playgroundFeed)
          .doc(playgroundFeedModel.id)
          .set(playgroundFeedModel.toJson());
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: playgroundFeedModel,
      );
    } catch (e) {
      return ErrorHandler.error<PlaygroundFeedModel>(e);
    }
  }

  Future<Responser> deleteFeed({required String feedId}) async {
    try {
      await firestore
          .collection(AppKeyNames.playgroundFeed)
          .doc(feedId)
          .delete();

      return Responser(
        message: 'Success',
        isSuccess: true,
      );
    } catch (e) {
      return ErrorHandler.error(e);
    }
  }

  Future<Responser<PlaygroundFeedModel?>> fetchFeedById(
      {required String id}) async {
    try {
      var query =
          await firestore.collection(AppKeyNames.playgroundFeed).doc(id).get();
      if (query.exists && (query.data()?.isNotEmpty ?? false)) {
        final playgroundFeedModel = PlaygroundFeedModel.fromJson(query.data()!);

        return Responser(
          message: AppStrings.success,
          isSuccess: true,
          data: playgroundFeedModel,
        );
      } else {
        return Responser(
          message: AppStrings.success,
          isSuccess: false,
        );
      }
    } catch (e) {
      return ErrorHandler.error<PlaygroundFeedModel>(e);
    }
  }

  Stream<List<PlaygroundFeedModel?>?> streamAllFeed() {
    return firestore
        .collection(AppKeyNames.playgroundFeed)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs.map((doc) {
              PlaygroundFeedModel playgroundFeedModel =
                  PlaygroundFeedModel.fromJson(doc.data());
              playgroundFeedModel = playgroundFeedModel.copyWith(
                id: doc.id,
              );
              return playgroundFeedModel;
            }).toList());
  }

  Stream<List<PlaygroundFeedCommentModel>?> streamPlaygroundFeedComments(
      PlaygroundFeedModel playgroundfeedModel) {
    return firestore
        .collection(AppKeyNames.playgroundFeed)
        .doc(playgroundfeedModel.id)
        .snapshots()
        .map((snapshot) {
      List<dynamic> list = snapshot.data()?['comments'] ?? [];
      return list
          .map((item) => PlaygroundFeedCommentModel.fromJson(item))
          .toList();
    });
  }
}
