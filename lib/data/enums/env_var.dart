import 'package:nova_social/utils/enum_values.dart';

/// To enable this need to pass in --dart-define while building apk
/// eg. flutter (run | build) --dart-define=TEST_MODE=true
/// or user ./build.sh to build apk with release mode and use -t to enable testing int the app
enum ENV { dev, stag, prod, custom }

final env = EnumValues({
  'DEV': ENV.dev,
  'STAG': ENV.stag,
  'PROD': ENV.prod,
  'CUSTOM': ENV.custom,
});

class EnvironmentVars {
  static const String testMode = 'TEST_MODE';
  static const String env = 'ENV';
}
