import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/models/misc/repo/fcm/payload/repo_fcm_payload_data.dart';

class RepoFcmPayloadDataConverter
    implements JsonConverter<RepoFcmPayloadData?, String?> {
  const RepoFcmPayloadDataConverter();

  @override
  RepoFcmPayloadData? fromJson(String? string) {
    if (string == null) {
      return null;
    }
    return json.decode(string);
  }

  @override
  String? toJson(RepoFcmPayloadData? obj) {
    if (obj == null) {
      return null;
    }
    return json.encode(obj);
  }
}
