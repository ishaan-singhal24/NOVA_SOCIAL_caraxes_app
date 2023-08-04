import 'package:flutter/cupertino.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/chat_bot/chat_bot_conversation_model.dart/chat_bot_conversation_model.dart';
import 'package:nova_social/data/models/chat_bot/chat_bot_model.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/repository/chat_bot/chat_bot_repository.dart';
import 'package:nova_social/utils/utils.dart';

class ChatBotNotifier with ChangeNotifier {
  late ChatBotRepository _chatBotRepository;

  List<ChatBotConversationModel>? chatConversations;
  ChatBotModel? chatBotModel;
  InitEnum? savingConversationStatus;
  InitEnum? fetchConversationStatus;
  InitEnum? aiResponseStatus;

  late ProfileNotifier _profileNotifier;

  update(ProfileNotifier prof) {
    _profileNotifier = prof;
    notifyListeners();
  }

  static ChatBotNotifier initialize(ChatBotRepository repo) {
    late ChatBotNotifier instance;
    try {
      instance = ChatBotNotifier();
    } catch (e) {
      Logger.logError('Initialization failed OpenAiNorifier', e);
      instance = ChatBotNotifier();
    }
    instance._chatBotRepository = repo;
    return instance;
  }

  ChatBotModel? get getResponseList {
    return chatBotModel;
  }

  Future<void> sendMessgaeAndGetResponse({required String msg}) async {
    if (_profileNotifier.userProfile == null || msg.isEmpty) {
      return;
    }
    aiResponseStatus = InitEnum.initializing;
    ChatBotConversationModel chatBotConversationModel =
        ChatBotConversationModel(
      userQuery: msg,
    );
    chatConversations ??= [];
    chatConversations?.add(chatBotConversationModel);
    final index = chatConversations?.indexOf(chatBotConversationModel);
    notifyListeners();

    final response = await _chatBotRepository.sendChatRequest(
      message: msg,
      name: _profileNotifier.userProfile?.name ?? '',
      userId: _profileNotifier.userProfile?.id ?? '',
      userBio: _profileNotifier.userProfile?.about ?? '',
    );
    if (response.isSuccess && (response.data != null)) {
      aiResponseStatus = InitEnum.initialized;
      chatConversations ??= [];
      chatConversations?[index ?? 0] = response.data!;
      // chatConversations?.add(response.data!);
    } else {
      aiResponseStatus = InitEnum.uninitialized;
    }
    notifyListeners();
  }

  Future<void> storeConversationToFirebase() async {
    if (_profileNotifier.userProfile == null) {
      return;
    }
    savingConversationStatus = InitEnum.initializing;
    chatBotModel = ChatBotModel(
      id: _profileNotifier.userProfile?.id,
      chatConversations: chatConversations,
    );
    if ((chatBotModel?.id?.isEmpty ?? true) ||
        (chatBotModel?.chatConversations?.isEmpty ?? true)) {
      return;
    }
    final response = await _chatBotRepository.storeConversationToFirestore(
      chatBotModel: chatBotModel!,
    );
    if (response.isSuccess) {
      savingConversationStatus = InitEnum.initialized;
    } else {
      savingConversationStatus = InitEnum.uninitialized;
    }
    notifyListeners();
  }

  Future<void> fetchConversationFromFirebase() async {
    if (_profileNotifier.userProfile == null) {
      return;
    }
    fetchConversationStatus = InitEnum.initializing;

    final response = await _chatBotRepository.fetchConversations(
      userId: _profileNotifier.userProfile?.id ?? '',
    );
    if (response.isSuccess) {
      chatBotModel = response.data;
      chatConversations = chatBotModel?.chatConversations;
      fetchConversationStatus = InitEnum.initialized;
    } else {
      fetchConversationStatus = InitEnum.uninitialized;
    }
    notifyListeners();
  }
}
