class RepoStableDiffusionApiTextToImageRequest {
  String? key;
  String? prompt;
  String? negativePrompt;
  String? width;
  String? height;
  String? samples;
  String? numInferenceSteps;
  Null? seed;
  double? guidanceScale;
  String? safetyChecker;
  Null? webhook;
  Null? trackId;

  RepoStableDiffusionApiTextToImageRequest(
      {this.key,
      this.prompt,
      this.negativePrompt,
      this.width,
      this.height,
      this.samples,
      this.numInferenceSteps,
      this.seed,
      this.guidanceScale,
      this.safetyChecker,
      this.webhook,
      this.trackId});

  RepoStableDiffusionApiTextToImageRequest.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    prompt = json['prompt'];
    negativePrompt = json['negative_prompt'];
    width = json['width'];
    height = json['height'];
    samples = json['samples'];
    numInferenceSteps = json['num_inference_steps'];
    seed = json['seed'];
    guidanceScale = json['guidance_scale'];
    safetyChecker = json['safety_checker'];
    webhook = json['webhook'];
    trackId = json['track_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['key'] = key;
    data['prompt'] = prompt;
    data['negative_prompt'] = negativePrompt;
    data['width'] = width;
    data['height'] = height;
    data['samples'] = samples;
    data['num_inference_steps'] = numInferenceSteps;
    data['seed'] = seed;
    data['guidance_scale'] = guidanceScale;
    data['safety_checker'] = safetyChecker;
    data['webhook'] = webhook;
    data['track_id'] = trackId;
    return data;
  }
}
