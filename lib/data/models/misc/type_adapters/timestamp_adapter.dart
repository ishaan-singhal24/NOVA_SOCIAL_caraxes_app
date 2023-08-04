// Can be generated automatically
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TimestampAdapter extends TypeAdapter<Timestamp?> {
  @override
  final typeId = 0;

  @override
  Timestamp? read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    if (fields[0] == null) return null;
    return Timestamp(
      fields[0] as int,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Timestamp? obj) {
    if (obj == null) {
      writer
        ..writeByte(1)
        ..writeByte(0)
        ..write(null);
      return;
    }
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.seconds)
      ..writeByte(1)
      ..write(obj.nanoseconds);
  }
}
