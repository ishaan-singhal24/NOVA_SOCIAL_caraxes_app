class RepoProdiaGetJobResponse {
  String? job;
  RepoProdiaGetJobResponseParams? params;
  String? status;
  String? imageUrl;

  RepoProdiaGetJobResponse({this.job, this.params, this.status, this.imageUrl});

  RepoProdiaGetJobResponse.fromJson(Map<String, dynamic> json) {
    job = json['job'];
    params = json['params'] != null
        ? RepoProdiaGetJobResponseParams.fromJson(json['params'])
        : null;
    status = json['status'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['job'] = job;
    if (params != null) {
      data['params'] = params!.toJson();
    }
    data['status'] = status;
    data['imageUrl'] = imageUrl;
    return data;
  }
}

class RepoProdiaGetJobResponseParams {
  String? prompt;
  int? cfgScale;
  int? steps;
  String? negativePrompt;
  int? seed;
  bool? upscale;
  RepoProdiaGetJobResponseOptions? options;

  RepoProdiaGetJobResponseParams(
      {this.prompt,
      this.cfgScale,
      this.steps,
      this.negativePrompt,
      this.seed,
      this.upscale,
      this.options});

  RepoProdiaGetJobResponseParams.fromJson(Map<String, dynamic> json) {
    prompt = json['prompt'];
    cfgScale = json['cfg_scale'];
    steps = json['steps'];
    negativePrompt = json['negative_prompt'];
    seed = json['seed'];
    upscale = json['upscale'];
    options = json['options'] != null
        ? RepoProdiaGetJobResponseOptions.fromJson(json['options'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['prompt'] = prompt;
    data['cfg_scale'] = cfgScale;
    data['steps'] = steps;
    data['negative_prompt'] = negativePrompt;
    data['seed'] = seed;
    data['upscale'] = upscale;
    if (options != null) {
      data['options'] = options!.toJson();
    }
    return data;
  }
}

class RepoProdiaGetJobResponseOptions {
  String? sdModelCheckpoint;

  RepoProdiaGetJobResponseOptions({this.sdModelCheckpoint});

  RepoProdiaGetJobResponseOptions.fromJson(Map<String, dynamic> json) {
    sdModelCheckpoint = json['sd_model_checkpoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sd_model_checkpoint'] = sdModelCheckpoint;
    return data;
  }
}
