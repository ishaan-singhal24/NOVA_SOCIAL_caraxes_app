import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nova_social/data/constants/app_key_names.dart';
import 'package:nova_social/data/constants/app_strings.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/nova/school/school_model.dart';
import 'package:nova_social/utils/errors/http_errors.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:uuid/uuid.dart';

class GlobalRepository {
  final firestore = FirebaseFirestore.instance;
  final uuid = const Uuid();

  Future saveGlobalSchools() async {
    List<SchoolModel> school1 = [];
    List<SchoolModel> school2 = [];
    List<SchoolModel> school3 = [];
    List<SchoolModel> school4 = [];
    for (var i = 0; i < newJson1.length; i++) {
      // if ((newJson1[i]['id'].runtimeType == int ||
      //         newJson1[i]['id'].runtimeType == Null) &&
      //     (newJson1[i]['name'].runtimeType == String ||
      //         newJson1[i]['name'].runtimeType == Null) &&
      //     (newJson1[i]['district'].runtimeType == String ||
      //         newJson1[i]['district'].runtimeType == Null) &&
      //     (newJson1[i]['pincode'].runtimeType == int ||
      //         newJson1[i]['pincode'].runtimeType == Null) &&
      //     (newJson1[i]['address'].runtimeType == String ||
      //         newJson1[i]['address'].runtimeType == Null)) {
      //   break;
      // } else {
      //   print(newJson1[i]['id']);
      // }
      // print(
      //     'id:${newJson1[i]['id'].runtimeType} name:${newJson1[i]['name'].runtimeType} district:${newJson1[i]['district'].runtimeType} pincode:${newJson1[i]['pincode'].runtimeType} address:${newJson1[i]['address'].runtimeType}  ${newJson1[i]['id']}');
      if ((newJson1[i]['address'].runtimeType != String)) {
        print((newJson1[i]['id']));
      }
      school1.add(SchoolModel.fromJson(newJson1[i]));
    }
    for (var i = 0; i < newJson2.length; i++) {
      // if ((newJson2[i]['id'].runtimeType == int ||
      //         newJson2[i]['id'].runtimeType == Null) &&
      //     (newJson2[i]['name'].runtimeType == String ||
      //         newJson2[i]['name'].runtimeType == Null) &&
      //     (newJson2[i]['district'].runtimeType == String ||
      //         newJson2[i]['district'].runtimeType == Null) &&
      //     (newJson2[i]['pincode'].runtimeType == int ||
      //         newJson2[i]['pincode'].runtimeType == Null) &&
      //     (newJson2[i]['address'].runtimeType == String ||
      //         newJson2[i]['address'].runtimeType == Null)) {
      //   break;
      // } else {
      //   print(newJson2[i]['id']);
      // }
      // print(
      //     'id:${newJson2[i]['id'].runtimeType} name:${newJson2[i]['name'].runtimeType} district:${newJson2[i]['district'].runtimeType} pincode:${newJson2[i]['pincode'].runtimeType} address:${newJson2[i]['address'].runtimeType}  ${newJson2[i]['id']}');
      if ((newJson2[i]['address'].runtimeType != String)) {
        print((newJson2[i]['id']));
      }
      school2.add(SchoolModel.fromJson(newJson2[i]));
    }
    for (var i = 0; i < newJson3.length; i++) {
      // if ((newJson3[i]['id'].runtimeType == int ||
      //         newJson3[i]['id'].runtimeType == Null) &&
      //     (newJson3[i]['name'].runtimeType == String ||
      //         newJson3[i]['name'].runtimeType == Null) &&
      //     (newJson3[i]['district'].runtimeType == String ||
      //         newJson3[i]['district'].runtimeType == Null) &&
      //     (newJson3[i]['pincode'].runtimeType == int ||
      //         newJson3[i]['pincode'].runtimeType == Null) &&
      //     (newJson3[i]['address'].runtimeType == String ||
      //         newJson3[i]['address'].runtimeType == Null)) {
      //   break;
      // } else {
      //   print(newJson3[i]['id']);
      // }
      // print(
      //     'id:${newJson3[i]['id'].runtimeType} name:${newJson3[i]['name'].runtimeType} district:${newJson3[i]['district'].runtimeType} pincode:${newJson3[i]['pincode'].runtimeType} address:${newJson3[i]['address'].runtimeType}  ${newJson3[i]['id']}');
      school3.add(SchoolModel.fromJson(newJson3[i]));
    }
    for (var i = 0; i < newJson4.length; i++) {
      // if ((newJson4[i]['id'].runtimeType == int ||
      //         newJson4[i]['id'].runtimeType == Null) &&
      //     (newJson4[i]['name'].runtimeType == String ||
      //         newJson4[i]['name'].runtimeType == Null) &&
      //     (newJson4[i]['district'].runtimeType == String ||
      //         newJson4[i]['district'].runtimeType == Null) &&
      //     (newJson4[i]['pincode'].runtimeType == int ||
      //         newJson4[i]['pincode'].runtimeType == Null) &&
      //     (newJson4[i]['address'].runtimeType == String ||
      //         newJson4[i]['address'].runtimeType == Null)) {
      //   break;
      // } else {
      //   print(newJson4[i]['id']);
      // }
      // print(
      //     'id:${newJson4[i]['id'].runtimeType} name:${newJson4[i]['name'].runtimeType} district:${newJson4[i]['district'].runtimeType} pincode:${newJson4[i]['pincode'].runtimeType} address:${newJson4[i]['address'].runtimeType}  ${newJson4[i]['id']}');
      school4.add(SchoolModel.fromJson(newJson4[i]));
    }
    print('storing schools');
    await firestore
        .collection(AppKeyNames.global)
        .doc('schools')
        .collection('schools')
        .doc('1')
        .set({
      'schools': school1
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    });
    await firestore
        .collection(AppKeyNames.global)
        .doc('schools')
        .collection('schools')
        .doc('2')
        .set({
      'schools': school2
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    });
    await firestore
        .collection(AppKeyNames.global)
        .doc('schools')
        .collection('schools')
        .doc('3')
        .set({
      'schools': school3
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    });
    await firestore
        .collection(AppKeyNames.global)
        .doc('schools')
        .collection('schools')
        .doc('4')
        .set({
      'schools': school4
          .map(
            (e) => e.toJson(),
          )
          .toList(),
    });
    print('storing schools done');
  }

  Future<void> globalStore() async {
    List<UserLocation> data = [];
    const indianCities = cities;
    for (var i = 0; i < indianCities.length; i++) {
      // indianCities[i].remove("id");
      UserLocation userLocation = UserLocation.fromJson(indianCities[i]);
      userLocation = userLocation.copyWith(
        id: uuid.v4(),
        country: 'India',
        concatinated: '${userLocation.city}, ${userLocation.state}',
      );
      data.add(userLocation);
    }
    final mappedList = data.map((e) => e.toJson()).toList();
    await firestore
        .collection(AppKeyNames.global)
        .doc(AppKeyNames.cities)
        .set({'items': mappedList});
  }

  Future<Responser<List?>> fetchGlobal<T extends GlobalDocHelperInterface>(
      String docName) async {
    try {
      final doc =
          await firestore.collection(AppKeyNames.global).doc(docName).get();
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: doc.data()?[AppKeyNames.items],
      );
    } catch (e) {
      return ErrorHandler.error(e);
    }
  }

  Future<Responser> addToGlobal<T extends GlobalDocHelperInterface>(
    T item,
  ) async {
    try {
      await firestore.collection(AppKeyNames.global).doc(item.docName).update({
        AppKeyNames.ids: {item.id: true},
        AppKeyNames.items: FieldValue.arrayUnion([item.toJson()]),
      });
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
      );
    } catch (e) {
      return ErrorHandler.error(e);
    }
  }

  Future<Responser> addToGlobalSchools(
    SchoolModel school,
  ) async {
    try {
      await firestore
          .collection(AppKeyNames.global)
          .doc(AppKeyNames.schools)
          .collection(AppKeyNames.schools)
          .doc('5')
          .update({
        AppKeyNames.schools: FieldValue.arrayUnion([school.toJson()]),
      });
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
      );
    } catch (e) {
      return ErrorHandler.error(e);
    }
  }

  Future<Responser<List<SchoolModel>?>> fetchGlobalSchools() async {
    try {
      List<SchoolModel> schools = [];
      final query = await firestore
          .collection(AppKeyNames.global)
          .doc(AppKeyNames.schools)
          .collection(AppKeyNames.schools)
          .get();
      if (query.docs.isEmpty) {
        return Responser(
          message: AppStrings.failure,
          isSuccess: false,
        );
      }
      for (var i = 0; i < query.docs.length; i++) {
        final schoolDoc = (query.docs[i].data()[AppKeyNames.schools] as List)
            .map((school) => SchoolModel.fromJson(school))
            .toList()
            .cast<SchoolModel>();
        schools.addAll(schoolDoc);
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: schools,
      );
    } catch (e) {
      return ErrorHandler.error<List<SchoolModel>?>(e);
    }
  }
}
