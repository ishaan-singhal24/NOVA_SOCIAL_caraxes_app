import 'package:flutter/cupertino.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/repository/ai_tools/open_ai/open_ai_repository.dart';
import 'package:nova_social/utils/utils.dart';

class OpenAiNotifier with ChangeNotifier {
  late OpenAiRepository _openAiRepository;
  List<OpenAiChatModel> chatList = [];

  static OpenAiNotifier initialize(OpenAiRepository repo) {
    late OpenAiNotifier instance;
    try {
      instance = OpenAiNotifier();
    } catch (e) {
      Logger.logError('Initialization failed OpenAiNorifier', e);
      instance = OpenAiNotifier();
    }
    instance._openAiRepository = repo;
    return instance;
  }

  List<OpenAiChatModel> get getChatList {
    return chatList;
  }

  Future<void> sendMessageAndGetSOP({required String msg}) async {
    final response = await _openAiRepository.sendMessageToGPT(message: msg);
    if (response.isSuccess && (response.data?.isNotEmpty ?? false)) {
      chatList.addAll(response.data!);
    }
    notifyListeners();
  }
}
