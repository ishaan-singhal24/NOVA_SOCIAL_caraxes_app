import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'playground_suggestions_model.freezed.dart';
part 'playground_suggestions_model.g.dart';

@freezed
class PlaygroundSuggestionsModel with _$PlaygroundSuggestionsModel {
  const factory PlaygroundSuggestionsModel({
    String? tip,
    String? prompt,
    String? imageUrl,
  }) = _PlaygroundSuggestionsModel;

  factory PlaygroundSuggestionsModel.fromJson(Map<String, dynamic> json) =>
      _$PlaygroundSuggestionsModelFromJson(json);
}
