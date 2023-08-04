import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/repository/repository.dart';
import 'package:nova_social/utils/utils.dart';

class StableDiffusionApiNotifier with ChangeNotifier {
  late StableDiffusionApiRepository _stableDiffusionApiRepository;
  RepoStableDiffusionApiTextToImageResponse? result;

  static StableDiffusionApiNotifier initialize(
      StableDiffusionApiRepository repo) {
    late StableDiffusionApiNotifier instance;
    try {
      instance = StableDiffusionApiNotifier();
    } catch (e) {
      Logger.logError('Initialization failed StableDiffusionApiNotifier', e);
      instance = StableDiffusionApiNotifier();
    }
    instance._stableDiffusionApiRepository = repo;
    return instance;
  }

  Future<void> textToImageStableDiffusion({required String inputText}) async {
    final response =
        await _stableDiffusionApiRepository.textToImageStableDiffusion(
      inputText: inputText,
    );
    if (response.isSuccess) {
      result = response.data;
      notifyListeners();
    }
  }
}
