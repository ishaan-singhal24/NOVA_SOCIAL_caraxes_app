import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/internship/categories/internship_category_model.dart';
import 'package:nova_social/data/models/internship/internship_model.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/utils/utils.dart';

class InternshipRepository {
  final firestore = FirebaseFirestore.instance;

  Future<Responser<List<InternshipCategoryModel>?>>
      fetchInternshipCategories() async {
    try {
      final snapshot = await firestore
          .collection(AppKeyNames.internshipCategoriesCollection)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final List<InternshipCategoryModel> internshipCategories = snapshot.docs
            .map((e) => InternshipCategoryModel.fromJson(e.data()))
            .toList();
        return Responser(
          message: AppStrings.success,
          isSuccess: true,
          data: internshipCategories,
        );
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: null,
      );
    } catch (error) {
      return ErrorHandler.error<List<InternshipCategoryModel>?>(error);
    }
  }

  Future<Responser<List<InternshipModel>?>> fetchInternshipsByCategory(
      {required String categoryId}) async {
    try {
      final snapshot = await firestore
          .collection(AppKeyNames.internshipsCollection)
          .where('${AppKeyNames.internshipCategoryField}.${AppKeyNames.id}',
              isEqualTo: categoryId)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final List<InternshipModel> internshipModel = snapshot.docs
            .map((e) => InternshipModel.fromJson(e.data()))
            .toList();
        return Responser(
          message: AppStrings.success,
          isSuccess: true,
          data: internshipModel,
        );
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: null,
      );
    } catch (error) {
      return ErrorHandler.error<List<InternshipModel>?>(error);
    }
  }

  Future<Responser<InternshipModel?>> updateInternship(
      {required InternshipModel internshipModel}) async {
    try {
      await firestore
          .collection(AppKeyNames.internshipsCollection)
          .doc(internshipModel.id)
          .set(internshipModel.toJson());
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: internshipModel,
      );
    } catch (e) {
      return ErrorHandler.error<InternshipModel>(e);
    }
  }
}
