import 'package:nova_social/data/models/nova/nova.dart';

abstract class ToFromJsonInterface {
  ToFromJsonInterface();

  Map<String, dynamic> toJson();

  // ToFromJson.fromJson(Map<String, dynamic> json);
  static T fromJson<T extends ToFromJsonInterface>(Map<String, dynamic> json) {
    switch (T) {
      case NovaInterests:

        /// Why the heck without `as T`, does Dart complain:
        /// "A value of type 'User' can't be returned from the method 'fromJson' because it has a return type of 'T'."
        /// when clearly `User extends Model` and `T extends Model`?
        return NovaInterests.fromJson(json) as T;
      default:
        throw UnimplementedError();
    }
  }
}
