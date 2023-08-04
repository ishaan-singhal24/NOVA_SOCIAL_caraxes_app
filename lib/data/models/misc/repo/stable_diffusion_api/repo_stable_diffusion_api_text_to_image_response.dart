class RepoStableDiffusionApiTextToImageResponse {
  String? status;
  double? generationTime;
  int? id;
  List<String>? output;
  Meta? meta;

  RepoStableDiffusionApiTextToImageResponse(
      {this.status, this.generationTime, this.id, this.output, this.meta});

  RepoStableDiffusionApiTextToImageResponse.fromJson(
      Map<String, dynamic> json) {
    status = json['status'];
    generationTime = json['generationTime'];
    id = json['id'];
    output = json['output'].cast<String>();
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['generationTime'] = generationTime;
    data['id'] = id;
    data['output'] = output;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Meta {
  int? h;
  int? w;
  String? enableAttentionSlicing;
  String? filePrefix;
  double? guidanceScale;
  String? model;
  int? nSamples;
  String? negativePrompt;
  String? outdir;
  String? prompt;
  String? revision;
  String? safetyChecker;
  int? seed;
  int? steps;
  String? vae;

  Meta(
      {this.h,
      this.w,
      this.enableAttentionSlicing,
      this.filePrefix,
      this.guidanceScale,
      this.model,
      this.nSamples,
      this.negativePrompt,
      this.outdir,
      this.prompt,
      this.revision,
      this.safetyChecker,
      this.seed,
      this.steps,
      this.vae});

  Meta.fromJson(Map<String, dynamic> json) {
    h = json['H'];
    w = json['W'];
    enableAttentionSlicing = json['enable_attention_slicing'];
    filePrefix = json['file_prefix'];
    guidanceScale = json['guidance_scale'];
    model = json['model'];
    nSamples = json['n_samples'];
    negativePrompt = json['negative_prompt'];
    outdir = json['outdir'];
    prompt = json['prompt'];
    revision = json['revision'];
    safetyChecker = json['safety_checker'];
    seed = json['seed'];
    steps = json['steps'];
    vae = json['vae'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['H'] = h;
    data['W'] = w;
    data['enable_attention_slicing'] = enableAttentionSlicing;
    data['file_prefix'] = filePrefix;
    data['guidance_scale'] = guidanceScale;
    data['model'] = model;
    data['n_samples'] = nSamples;
    data['negative_prompt'] = negativePrompt;
    data['outdir'] = outdir;
    data['prompt'] = prompt;
    data['revision'] = revision;
    data['safety_checker'] = safetyChecker;
    data['seed'] = seed;
    data['steps'] = steps;
    data['vae'] = vae;
    return data;
  }
}
