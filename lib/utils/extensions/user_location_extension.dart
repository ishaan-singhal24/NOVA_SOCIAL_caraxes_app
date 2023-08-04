import 'package:nova_social/data/models/models.dart';

extension UserLocationExtension on UserLocation {
  String get parseLocation {
    String result = '';
    if (city?.isNotEmpty ?? false) {
      result = '$city';
    }
    if (state?.isNotEmpty ?? false) {
      result = '$result, $state';
    }
    if (country?.isNotEmpty ?? false) {
      result = '$result, $country';
    }
    return result;
  }
}
