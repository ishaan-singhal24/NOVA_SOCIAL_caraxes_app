import 'package:nova_social/utils/utils.dart';
import 'package:hive/hive.dart';

class HiveService {
  Future<Box<T>> openBox<T>(String name) async {
    try {
      return await Hive.openBox<T>(name);
    } catch (e) {
      return Future.error('Unable to open DB $name - $e');
    }
  }

  Future<bool> storeData<T>(Box box, String boxName, T item) async {
    try {
      box = await _checkBox(box, boxName);
      await box.add(item);
      return true;
    } catch (e) {
      Logger.logError(this, 'Unable to add item $item - $e');
      return false;
    }
  }

  Future<bool> storeDataWithKey<T>(
    Box? box,
    String boxName,
    String key,
    Map<String, dynamic> data,
  ) async {
    try {
      box = await _checkBox(box, boxName);

      await box.put(key, data);
      return true;
    } catch (e) {
      Logger.logError(this, 'Unable to add item $data - $e');
      return false;
    }
  }

  Future<bool> removeDataWithKey(Box? box, String boxName, String key) async {
    try {
      box = await _checkBox(box, boxName);
      await box.delete(key);
      return true;
    } catch (e) {
      Logger.logError(this, 'Unable to remove item - $e');
      return false;
    }
  }

  Future<Map<String, dynamic>?> fetchData<T>(
      Box? box, String boxName, String key,
      [Map<String, dynamic>? defaultValue]) async {
    try {
      box = await _checkBox(box, boxName);
      return (box.get(key, defaultValue: defaultValue) as Map)
          .cast<String, dynamic>();
    } catch (e) {
      Logger.logError(this, 'Unable to retrieve item from $key - $e');
      return defaultValue;
    }
  }

  List<T> fetchAllData<T>(Box box) {
    try {
      return box.values.cast<T>().toList();
    } catch (e) {
      Logger.logError(this, 'Unable to all values for $box');
      return [];
    }
  }

  bool _isOpen(Box? box) {
    return box?.isOpen ?? false;
  }

  Future<Box> _checkBox(Box? box, String name) async {
    if (!_isOpen(box)) {
      return await openBox(name);
    }
    return box!;
  }
}
