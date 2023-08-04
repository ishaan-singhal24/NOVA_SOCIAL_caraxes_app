import 'package:freezed_annotation/freezed_annotation.dart';
part 'open_ai_chat_model.freezed.dart';
part 'open_ai_chat_model.g.dart';

@freezed
class OpenAiChatModel with _$OpenAiChatModel {
  const factory OpenAiChatModel({
    final String? message,
    final int? chatIndex,
  }) = _OpenAiChatModel;

  factory OpenAiChatModel.fromJson(Map<String, dynamic> json) =>
      _$OpenAiChatModelFromJson(json);
}
