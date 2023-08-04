// Can be generated automatically
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ColorAdapter extends TypeAdapter<Color?> {
  @override
  final typeId = 1;

  @override
  Color? read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    if (fields[0] == null) return null;
    return Color(
      fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Color? obj) {
    if (obj == null) {
      writer
        ..writeByte(1)
        ..writeByte(0)
        ..write(null);
      return;
    }
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.value);
  }
}
