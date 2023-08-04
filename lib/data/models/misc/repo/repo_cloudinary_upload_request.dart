import 'package:freezed_annotation/freezed_annotation.dart';
part 'repo_cloudinary_upload_request.freezed.dart';
part 'repo_cloudinary_upload_request.g.dart';

@freezed
class CloudinaryUploadRequest with _$CloudinaryUploadRequest {
  factory CloudinaryUploadRequest({
    String? file,
    @JsonKey(name: 'public_id') String? publicId,
    String? folder,
    @JsonKey(name: 'use_filename') bool? useFilename,
    @JsonKey(name: 'unique_filename') bool? uniqueFilename,
    @JsonKey(name: 'filename_override') String? filenameOverride,
    @JsonKey(name: 'resource_type') String? resourceType,
    String? type,
    bool? overwrite,
    String? tags,
  }) = _CloudinaryUploadRequest;

  factory CloudinaryUploadRequest.fromJson(Map<String, dynamic> json) =>
      _$CloudinaryUploadRequestFromJson(json);
}
