import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/feed/comment/feed_comment_model.dart';
import 'package:nova_social/data/models/feed/feed_model.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/utils/utils.dart';

class FeedRepository {
  final firestore = FirebaseFirestore.instance;

  Future<Responser<FeedModel?>> createFeed(FeedModel feedModel) async {
    try {
      final DocumentReference documentRef =
          firestore.collection(AppKeyNames.feeds).doc();
      feedModel = feedModel.copyWith(
        id: documentRef.id,
      );
      await documentRef.set(feedModel.toJson());
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: feedModel,
      );
    } catch (e) {
      return ErrorHandler.error<FeedModel>(e);
    }
  }

  Future<Responser<FeedModel?>> updateFeed(FeedModel feedModel) async {
    try {
      await firestore
          .collection(AppKeyNames.feeds)
          .doc(feedModel.id)
          .set(feedModel.toJson());
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: feedModel,
      );
    } catch (e) {
      return ErrorHandler.error<FeedModel>(e);
    }
  }

  Future<Responser<FeedModel?>> fetchFeedById({required String id}) async {
    try {
      var query = await firestore.collection(AppKeyNames.feeds).doc(id).get();
      if (query.exists && (query.data()?.isNotEmpty ?? false)) {
        final feedModel = FeedModel.fromJson(query.data()!);

        return Responser(
          message: AppStrings.success,
          isSuccess: true,
          data: feedModel,
        );
      } else {
        return Responser(
          message: AppStrings.success,
          isSuccess: false,
        );
      }
    } catch (e) {
      return ErrorHandler.error<FeedModel>(e);
    }
  }

  Stream<List<FeedModel?>?> streamAllFeed() {
    return firestore
        .collection(AppKeyNames.feeds)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs.map((doc) {
              FeedModel feedModel = FeedModel.fromJson(doc.data());
              return feedModel;
            }).toList());
  }

  Stream<List<FeedModel?>?> streamFeedByUserId({required String userId}) {
    return firestore
        .collection(AppKeyNames.feeds)
        .where('userDetails.id', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs.map((doc) {
              FeedModel feedModel = FeedModel.fromJson(doc.data());
              return feedModel;
            }).toList());
  }

  Stream<List<FeedCommentModel>?> streamFeedComments(FeedModel feedModel) {
    return firestore
        .collection(AppKeyNames.feeds)
        .doc(feedModel.id)
        .snapshots()
        .map((snapshot) {
      List<dynamic> list = snapshot.data()?['comments'] ?? [];
      return list.map((item) => FeedCommentModel.fromJson(item)).toList();
    });
  }

  Future<Responser> deleteFeed({required String feedId}) async {
    try {
      await firestore.collection(AppKeyNames.feeds).doc(feedId).delete();

      return Responser(
        message: 'Success',
        isSuccess: true,
      );
    } catch (e) {
      return ErrorHandler.error(e);
    }
  }
}
