class RepoProdiaCreateJobResponse {
  String? job;
  String? status;
  RepoProdiaCreateJobResponseParams? params;

  RepoProdiaCreateJobResponse({this.job, this.status, this.params});

  RepoProdiaCreateJobResponse.fromJson(Map<String, dynamic> json) {
    job = json['job'];
    status = json['status'];
    params = json['params'] != null
        ? RepoProdiaCreateJobResponseParams.fromJson(json['params'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['job'] = job;
    data['status'] = status;
    if (params != null) {
      data['params'] = params!.toJson();
    }
    return data;
  }
}

class RepoProdiaCreateJobResponseParams {
  String? prompt;
  int? cfgScale;
  int? steps;
  String? negativePrompt;
  int? seed;
  bool? upscale;
  RepoProdiaCreateJobResponseOptions? options;

  RepoProdiaCreateJobResponseParams(
      {this.prompt,
      this.cfgScale,
      this.steps,
      this.negativePrompt,
      this.seed,
      this.upscale,
      this.options});

  RepoProdiaCreateJobResponseParams.fromJson(Map<String, dynamic> json) {
    prompt = json['prompt'];
    cfgScale = json['cfg_scale'];
    steps = json['steps'];
    negativePrompt = json['negative_prompt'];
    seed = json['seed'];
    upscale = json['upscale'];
    options = json['options'] != null
        ? RepoProdiaCreateJobResponseOptions.fromJson(json['options'])
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

class RepoProdiaCreateJobResponseOptions {
  String? sdModelCheckpoint;

  RepoProdiaCreateJobResponseOptions({this.sdModelCheckpoint});

  RepoProdiaCreateJobResponseOptions.fromJson(Map<String, dynamic> json) {
    sdModelCheckpoint = json['sd_model_checkpoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sd_model_checkpoint'] = sdModelCheckpoint;
    return data;
  }
}
