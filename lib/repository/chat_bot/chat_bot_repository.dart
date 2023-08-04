import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/chat_bot/chat_bot_conversation_model.dart/chat_bot_conversation_model.dart';
import 'package:nova_social/data/models/chat_bot/chat_bot_model.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/utils/utils.dart';

const BASE_URL_GCP = 'http://34.23.178.37:8080';

class ChatBotRepository {
  final firestore = FirebaseFirestore.instance;

  Future<Responser<ChatBotModel?>> storeConversationToFirestore({
    required ChatBotModel chatBotModel,
  }) async {
    try {
      final DocumentReference documentRef =
          firestore.collection(AppKeyNames.chatBotRobin).doc(chatBotModel.id);
      final String? entity = chatBotModel.chatConversations?.last.entity;

      await documentRef.set(chatBotModel.toJson());
      if (entity?.isNotEmpty ?? false) {
        print('storing entity to pinecone');
        await storeEntityToPinecone(
          userId: chatBotModel.id ?? '',
          entity: entity!,
        );
        print('storing entity to pinecone 2');
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: chatBotModel,
      );
    } catch (e) {
      return ErrorHandler.error<ChatBotModel>(e);
    }
  }

  Future<Responser<ChatBotModel?>> fetchConversations({
    required String userId,
  }) async {
    try {
      var query = await firestore
          .collection(AppKeyNames.chatBotRobin)
          .doc(userId)
          .get();
      // final DocumentReference documentRef =
      //     firestore.collection(AppKeyNames.chatBotRobin).doc(userId);
      if (query.exists && (query.data()?.isNotEmpty ?? false)) {
        final chatBotModel = ChatBotModel.fromJson(query.data()!);
        return Responser(
          message: AppStrings.success,
          isSuccess: true,
          data: chatBotModel,
        );
      } else {
        return Responser(
          message: AppStrings.success,
          isSuccess: false,
        );
      }
    } catch (e) {
      return ErrorHandler.error<ChatBotModel>(e);
    }
  }

  Future<Responser> createPineconeUserNamespace({
    required String userId,
    required String userData,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("$BASE_URL_GCP/upload"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
          {
            "userData": userData,
            "userId": userId,
          },
        ),
      );

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']["message"]);
      }

      int jsonResponseStatus = jsonResponse['status'];
      if (jsonResponseStatus != 200) {
        return Responser(
          message: AppStrings.failure,
          isSuccess: false,
          data: null,
        );
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: null,
      );
    } catch (error) {
      return ErrorHandler.error<Responser>(error);
    }
  }

  Future<Responser> storeEntityToPinecone({
    required String userId,
    required String entity,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("$BASE_URL_GCP/update"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
          {
            "entity_update": entity,
            "userId": userId,
          },
        ),
      );

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']["message"]);
      }

      int jsonResponseStatus = jsonResponse['status'];
      if (jsonResponseStatus != 200) {
        return Responser(
          message: AppStrings.failure,
          isSuccess: false,
          data: null,
        );
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: null,
      );
    } catch (error) {
      return ErrorHandler.error<Responser>(error);
    }
  }

  // Send Message to Bot and recieve response
  Future<Responser<ChatBotConversationModel?>> sendChatRequest({
    required String message,
    required String name,
    required String userId,
    required String userBio,
  }) async {
    try {
      final CollectionReference collectionReference =
          FirebaseFirestore.instance.collection(AppKeyNames.chatBotRobin);
      final DocumentSnapshot documentSnapshot =
          await collectionReference.doc(userId).get();

      if (documentSnapshot.exists.not) {
        await createPineconeUserNamespace(
          userId: userId,
          userData: userBio,
        );
      }
      var response = await http.post(
        Uri.parse("$BASE_URL_GCP/chat"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
          {
            "query": message,
            "username": name.split(' ')[0],
            "userId": userId,
          },
        ),
      );

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']["message"]);
      }

      print(jsonResponse);

      Map jsonResponseData = jsonResponse['data'];

      if (jsonResponseData.isEmpty) {
        return Responser(
          message: AppStrings.failure,
          isSuccess: false,
          data: null,
        );
      }

      ChatBotConversationModel chatBotConversationModel =
          ChatBotConversationModel(
        userQuery: message,
        botResponse: jsonResponseData['output'],
        entity: jsonResponseData['entity'],
        createdAt: DateTime.now(),
      );

      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: chatBotConversationModel,
      );
    } catch (error) {
      return ErrorHandler.error<ChatBotConversationModel>(error);
    }
  }
}
