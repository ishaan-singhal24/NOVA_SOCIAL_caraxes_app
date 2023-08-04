import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nova_social/repository/ai_tools/hugging_face/hugging_face_repository.dart';
import 'package:nova_social/utils/utils.dart';

class HuggingFaceNotifier with ChangeNotifier {
  late HuggingFaceRepository _huggingFaceRepository;

  static HuggingFaceNotifier initialize(HuggingFaceRepository repo) {
    late HuggingFaceNotifier instance;
    try {
      instance = HuggingFaceNotifier();
    } catch (e) {
      Logger.logError('Initialization failed HuggingFaceNotifier', e);
      instance = HuggingFaceNotifier();
    }
    instance._huggingFaceRepository = repo;
    return instance;
  }

  Uint8List? image;

  Future<void> textToImageOpenJourney({required String inputText}) async {
    final response = await _huggingFaceRepository.textToImageOpenJourney(
      inputText: inputText,
    );
    if (response.isSuccess) {
      print("Image Success");
      image = response.data;
    }
    notifyListeners();
  }
}
