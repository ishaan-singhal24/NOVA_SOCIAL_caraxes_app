import 'dart:convert';

import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/services/services.dart';
import 'package:nova_social/utils/utils.dart';

class ProdiaRepository {
  final _httpService = HttpService(
    baseUrl: AppEnvironment.getApiURL(
      apiType: AppKeyNames.prodiaStableDiffusionApi,
    ),
    addToHeader: {
      'X-Prodia-Key': 'e843fa76-247c-43c8-b85e-02800fc15573',
    },
  );

  final _baseEndPoint = '/job';

  Future<Responser<RepoProdiaCreateJobResponse>>
      textToImageStableDiffusionCreateJob({
    required String inputText,
  }) async {
    final payload = RepoProdiaCreateJobRequest(prompt: inputText).toJson();
    payload.removeWhere((key, value) => value == null);
    try {
      var res = await _httpService.makePostRequest(
        _baseEndPoint,
        jsonEncode(payload),
      );
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: RepoProdiaCreateJobResponse.fromJson(res),
      );
    } catch (error) {
      return ErrorHandler.error(error);
    }
  }

  Future<Responser<RepoProdiaGetJobResponse>> textToImageStableDiffusionGetJob({
    required String jobId,
  }) async {
    try {
      var res = await _httpService.makeGetRequest(
        '$_baseEndPoint/$jobId',
      );
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
        data: RepoProdiaGetJobResponse.fromJson(res),
      );
    } catch (error) {
      return ErrorHandler.error(error);
    }
  }
}
