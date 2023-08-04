class RepoProdiaCreateJobRequest {
  String? model;
  String? prompt;
  String? negativePrompt;
  int? seed;
  int? steps;
  int? cfgScale;

  RepoProdiaCreateJobRequest(
      {this.model,
      this.prompt,
      this.negativePrompt,
      this.seed,
      this.steps,
      this.cfgScale});

  RepoProdiaCreateJobRequest.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    prompt = json['prompt'];
    negativePrompt = json['negative_prompt'];
    seed = json['seed'];
    steps = json['steps'];
    cfgScale = json['cfg_scale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['model'] = model;
    data['prompt'] = prompt;
    data['negative_prompt'] = negativePrompt;
    data['seed'] = seed;
    data['steps'] = steps;
    data['cfg_scale'] = cfgScale;
    return data;
  }
}
