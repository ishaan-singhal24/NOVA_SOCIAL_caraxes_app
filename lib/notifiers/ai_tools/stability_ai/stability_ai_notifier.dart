import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:nova_social/repository/ai_tools/stability_ai/stability_ai_repository.dart';
import 'package:nova_social/utils/utils.dart';

class StabilityAiNotifier with ChangeNotifier {
  late StabilityAiRepository _stabilityAiRepository;

  static StabilityAiNotifier initialize(StabilityAiRepository repo) {
    late StabilityAiNotifier instance;
    try {
      instance = StabilityAiNotifier();
    } catch (e) {
      Logger.logError('Initialization failed StabilityAi', e);
      instance = StabilityAiNotifier();
    }
    instance._stabilityAiRepository = repo;
    return instance;
  }

  Uint8List? image;

  Future<void> textToImageOpenJourney({required String inputText}) async {
    final response = await _stabilityAiRepository.textToImageOpenJourney(
      inputText: inputText,
    );
    if (response.isSuccess) {
      print("Image Success");
      // image = response.data;
      image = base64Decode(response.data ?? '');
    }
    notifyListeners();
  }
}
