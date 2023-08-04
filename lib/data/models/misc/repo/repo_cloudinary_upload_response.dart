class CloudinaryUploadResponse {
  String? assetId;
  String? publicId;
  int? version;
  String? versionId;
  String? signature;
  int? width;
  int? height;
  String? format;
  String? resourceType;
  String? createdAt;
  List<String>? tags;
  int? pages;
  int? bytes;
  String? type;
  String? etag;
  bool? placeholder;
  String? url;
  String? secureUrl;
  String? accessMode;
  String? originalFilename;

  CloudinaryUploadResponse({
    this.assetId,
    this.publicId,
    this.version,
    this.versionId,
    this.signature,
    this.width,
    this.height,
    this.format,
    this.resourceType,
    this.createdAt,
    this.tags,
    this.pages,
    this.bytes,
    this.type,
    this.etag,
    this.placeholder,
    this.url,
    this.secureUrl,
    this.accessMode,
    this.originalFilename,
  });

  CloudinaryUploadResponse.fromJson(Map<String, dynamic> json) {
    assetId = json['asset_id'];
    publicId = json['public_id'];
    version = json['version'];
    versionId = json['version_id'];
    signature = json['signature'];
    width = json['width'];
    height = json['height'];
    format = json['format'];
    resourceType = json['resource_type'];
    createdAt = json['created_at'];
    tags = json['tags'].cast<String>();
    pages = json['pages'];
    bytes = json['bytes'];
    type = json['type'];
    etag = json['etag'];
    placeholder = json['placeholder'];
    url = json['url'];
    secureUrl = json['secure_url'];
    accessMode = json['access_mode'];
    originalFilename = json['original_filename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['asset_id'] = assetId;
    data['public_id'] = publicId;
    data['version'] = version;
    data['version_id'] = versionId;
    data['signature'] = signature;
    data['width'] = width;
    data['height'] = height;
    data['format'] = format;
    data['resource_type'] = resourceType;
    data['created_at'] = createdAt;
    data['tags'] = tags;
    data['pages'] = pages;
    data['bytes'] = bytes;
    data['type'] = type;
    data['etag'] = etag;
    data['placeholder'] = placeholder;
    data['url'] = url;
    data['secure_url'] = secureUrl;
    data['access_mode'] = accessMode;
    data['original_filename'] = originalFilename;
    return data;
  }
}
