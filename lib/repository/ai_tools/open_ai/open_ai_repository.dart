import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/utils/utils.dart';

const BASE_URL = 'https://api.openai.com/v1';
// const API_KEY = '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';
const API_KEY = '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';

class OpenAiRepository {
  // Send Message using ChatGPT API
  Future<Responser<List<OpenAiChatModel>>> sendMessageToGPT(
      {required String message}) async {
    try {
      String modelId = 'gpt-3.5-turbo';
      var response = await http.post(
        Uri.parse("$BASE_URL/chat/completions"),
        headers: {
          'Authorization': 'Bearer $API_KEY',
          "Content-Type": "application/json"
        },
        body: jsonEncode(
          {
            "model": modelId,
            "messages": [
              {
                "role": "user",
                "content": message,
              }
            ],
            "max_tokens": 2000,
          },
        ),
      );

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']["message"]);
      }
      List<OpenAiChatModel> chatList = [];
      if (jsonResponse["choices"].length > 0) {
        chatList = List.generate(
          jsonResponse["choices"].length,
          (index) => OpenAiChatModel(
            message: jsonResponse["choices"][index]["message"]["content"],
            chatIndex: 1,
          ),
        );
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: chatList,
      );
      ;
    } catch (error) {
      return ErrorHandler.error<List<OpenAiChatModel>>(error);
    }
  }
}
