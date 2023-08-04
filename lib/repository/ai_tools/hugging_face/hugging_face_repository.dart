import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/services/services.dart';
import 'package:nova_social/utils/utils.dart';

class HuggingFaceRepository {
  final _httpService = HttpService(
    baseUrl: AppEnvironment.getApiURL(
      apiType: AppKeyNames.openjourneyApi,
    ),
    authToken: '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',
  );

  final _baseEndPoint = '/models';

  Future<Responser<Uint8List>> textToImageOpenJourney({
    required String inputText,
  }) async {
    final payload = jsonEncode({'inputs': inputText});
    try {
      var res = await _httpService.makePostRequest(
        '$_baseEndPoint/prompthero/openjourney',
        payload,
        needResponseData: true,
      ) as Response;
      if (res.statusCode > 299) {
        return Responser(
          message: AppStrings.failure,
          isSuccess: false,
        );
      }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: res.bodyBytes,
      );
    } catch (error) {
      return ErrorHandler.error(error);
    }
  }
}
