import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ColorConverter implements JsonConverter<Color?, int?> {
  const ColorConverter();

  @override
  Color? fromJson(int? colorCode) {
    return colorCode != null ? Color(colorCode) : null;
  }

  @override
  int? toJson(Color? color) {
    return color?.value;
  }
}
