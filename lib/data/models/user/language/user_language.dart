import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_languages.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class UserLanguages {
  String? id;
  String? name;
  String? icon;

  UserLanguages({
    this.id,
    this.name,
    this.icon,
  });

  factory UserLanguages.fromJson(Map<String, dynamic> json) =>
      _$UserLanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$UserLanguagesToJson(this);
}
