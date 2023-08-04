import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/utils/utils.dart';

class SearchRepository {
  static const int RESULTS_PER_PAGE = 10;

  Future<Responser<List<DocumentSnapshot>?>> searchUsers({
    required String searchQuery,
    DocumentSnapshot? lastDocument,
  }) async {
    try {
      Query query = FirebaseFirestore.instance
          .collection(AppKeyNames.user)
          .orderBy('name')
          .startAt([searchQuery]).endAt(['$searchQuery\uf8ff']).limit(
              RESULTS_PER_PAGE);

      if (lastDocument != null) {
        query = query.startAfterDocument(lastDocument);
      }

      final querySnapshot = await query.get();
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: querySnapshot.docs,
      );
    } catch (error) {
      return ErrorHandler.error<List<DocumentSnapshot>?>(error);
    }
  }
}
