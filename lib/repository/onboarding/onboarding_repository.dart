import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nova_social/data/constants/app_key_names.dart';
import 'package:nova_social/data/constants/app_strings.dart';
import 'package:nova_social/data/models/misc/responser.dart';
import 'package:nova_social/utils/utils.dart';

class OnboardingRepository {
  final firestore = FirebaseFirestore.instance;

  Future<Responser<bool?>> isUsernameAvailable(String newUsername) async {
    try {
      final QuerySnapshot documentSnapshot = await firestore
          .collection(AppKeyNames.user)
          .where(AppKeyNames.usernameField, isEqualTo: newUsername)
          .get();
      if (documentSnapshot.docs.isNotEmpty) {
        return Responser(
          message: AppStrings.failure,
          isSuccess: true,
          data: false,
        );
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: true,
      );
    } catch (e) {
      return ErrorHandler.error<bool>(e);
    }
  }

  Future<Responser<bool>> storeUsername(
    String newUsername,
  ) async {
    try {
      final User? _user = FirebaseAuth.instance.currentUser;
      if (_user == null) {
        return Responser(
          message: AppStrings.failure,
          isSuccess: false,
        );
      }
      await firestore
          .collection(AppKeyNames.onboardingCollection)
          .doc(AppKeyNames.usernameDoc)
          .update({
        AppKeyNames.usernameField: FieldValue.arrayUnion([newUsername]),
      });
      await firestore
          .collection(AppKeyNames.user)
          .doc(_user.uid)
          .update({AppKeyNames.usernameField: newUsername});
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: true,
      );
    } catch (e) {
      return ErrorHandler.error<bool>(e);
    }
  }

  Future<Responser<bool?>> isWaitlistInviteCodeValid(
      {required String code}) async {
    try {
      bool isTrue = false;

      final CollectionReference collection = firestore.collection('appCodes');
      final DocumentSnapshot snapshot = await collection.doc('waitlist').get();

      // if (snapshot.exists) {
      //   final Map<String, bool> data =
      //       snapshot.data() as Map<String, bool>;
      //   if (data['codeMaps'] != null) {
      //     final Map<String, bool> codeMaps =
      //         Map<String, bool>.from(data['codeMaps']);
      //     if (codeMaps.containsKey(code)) {
      //       isTrue = codeMaps[code] ?? false;
      //     }
      //   }
      // }
      if (snapshot.exists) {
        final Map<dynamic, dynamic> data =
            snapshot.data() as Map<dynamic, dynamic>;
        data.forEach((key, value) {
          if (value is bool && value == true && key is String && key == code) {
            isTrue = true;
          }
        });
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: isTrue,
      );
    } catch (e) {
      return ErrorHandler.error<bool>(e);
    }
  }

  // Future<Responser<List>> storeUserInterests(
  //     List<NovaInterests> userInterests) async {
  //   try {
  //     final User? _user = FirebaseAuth.instance.currentUser;
  //     if (_user == null) {
  //       return Responser(
  //         message: AppStrings.failure,
  //         isSuccess: false,
  //       );
  //     }
  //     await firestore.collection(AppKeyNames.user).doc(_user.uid).update({
  //       AppKeyNames.userInterestField:
  //           userInterests.map((e) => e.toJson()).toList(),
  //     });
  //     return Responser(
  //       message: AppStrings.success,
  //       isSuccess: true,
  //       data: userInterests,
  //     );
  //   } catch (e) {
  //     return ErrorHandler.error<List>(e);
  //   }
  // }

  // Future<Responser<List>> storeUserOpportunities(
  //     List<NovaOpportunities> userOpportunities) async {
  //   try {
  //     final User? _user = FirebaseAuth.instance.currentUser;
  //     if (_user == null) {
  //       return Responser(
  //         message: AppStrings.failure,
  //         isSuccess: false,
  //       );
  //     }
  //     await firestore.collection(AppKeyNames.user).doc(_user.uid).update({
  //       AppKeyNames.userOpportunitiyField:
  //           userOpportunities.map((e) => e.toJson()).toList(),
  //     });
  //     return Responser(
  //       message: AppStrings.success,
  //       isSuccess: true,
  //       data: userOpportunities,
  //     );
  //   } catch (e) {
  //     return ErrorHandler.error<List>(e);
  //   }
  // }

  // Future<Responser<List<NovaOpportunities>>> fetchUserOpportunities() async {
  //   try {
  //     final User? _user = FirebaseAuth.instance.currentUser;
  //     if (_user == null) {
  //       return Responser(
  //         message: AppStrings.failure,
  //         isSuccess: false,
  //       );
  //     }
  //     final DocumentSnapshot documentSnapshot =
  //         await firestore.collection(AppKeyNames.user).doc(_user.uid).get();
  //     if (!documentSnapshot.exists) {
  //       return Responser(
  //         message: AppStrings.failure,
  //         isSuccess: false,
  //       );
  //     }
  //     final List extractedData =
  //         documentSnapshot.get(AppKeyNames.userOpportunitiyField);
  //     final List<NovaOpportunities> userOpportunities = extractedData
  //         .map(
  //           (e) => NovaOpportunities.fromJson(e),
  //         )
  //         .toList()
  //         .cast<NovaOpportunities>();

  //     return Responser(
  //       message: AppStrings.success,
  //       isSuccess: true,
  //       data: userOpportunities,
  //     );
  //   } catch (e) {
  //     return ErrorHandler.error<List<NovaOpportunities>>(e);
  //   }
  // }
}
