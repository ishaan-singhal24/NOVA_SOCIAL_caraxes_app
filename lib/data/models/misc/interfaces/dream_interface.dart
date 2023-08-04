import 'package:nova_social/data/models/misc/misc.dart';

abstract class DreamInterface extends ToFromJsonInterface {
  String? get id;
  String? get name;
  String? get iconUrl;
}
