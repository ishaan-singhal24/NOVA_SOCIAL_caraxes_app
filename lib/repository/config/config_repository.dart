import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/utils/utils.dart';
// import 'dart:html'; //Important to add this line

class ConfigRepository {
  Future<Responser<bool?>> isInternetAvailable() async {
    try {
      bool result = await InternetConnectionChecker().hasConnection;
      return Responser(
        message: AppStrings.success,
        isSuccess: result,
      );
    } catch (e) {
      return ErrorHandler.error(e);
    }
  }

  Stream<ConnectivityResult> networkConnectionStream() {
    return Connectivity().onConnectivityChanged;
  }

  Future<Responser<bool?>> networkConnectivity() async {
    try {
      final internetConnectivity = await Connectivity().checkConnectivity();
      return Responser(
        message: AppStrings.success,
        isSuccess: internetConnectivity != ConnectivityResult.none,
      );
    } catch (e) {
      return ErrorHandler.error(e);
    }
  }
}
